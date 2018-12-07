package com.company.Model;

import com.company.Controller.CommandDefinitions.AdminStoreCommand;
import com.company.Controller.CommandDefinitions.BrowseCommand;
import com.company.Controller.CommandDefinitions.CartCommand;
import com.company.Controller.CommandDefinitions.StatisticsCommand;
import com.company.Controller.CommandService;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;
import picocli.CommandLine;


public class Admin extends User {

    private final String UPDATE_PRICE_BY_UPC_QUERY = "UPDATE Product SET price = ? WHERE upc = ?";
    private final String UPDATE_PRICE_BY_NAME_QUERY = "UPDATE Product SET price = ? WHERE name = ?";
    private final String ORDER_NUMBERS = "SELECT orderNumber FROM Reorder";
    private final String REMOVE_FROM_STORE = "DELETE FROM soldBy WHERE storeId = ? AND productId = ?";
    private final String ADD_TO_STORE = "INSERT INTO soldBy (storeId, productId) VALUES (?, ?)";
    private final String REMOVE_CUSTOMER = "DELETE FROM customer WHERE phone = ?";
    private final String REMOVE_STORE = "DELETE FROM store WHERE storeID = ?";
    private final String CREATE_CUSTOMER = "INSERT INTO customer VALUES (?, ?, ?)";
    private final String CHECK_CUSTOMER = "SELECT * FROM customer WHERE phone = ?";
    private final String GET_UNFULFILLED_ORDERS = "SELECT orderNumber, product, store, stockRequested FROM Reorder" +
            " WHERE deliveryDate IS NULL";
    private final String UPDATE_STOCK = "UPDATE soldBy SET numberInStock = ((SELECT stockRequested FROM " +
            "reorder WHERE store = ? AND product = ?) + (SELECT numberInStock FROM soldBy WHERE storeId = ? AND " +
            "productId = ?)) WHERE storeId = ? AND productId = ?";
    private final String UPDATE_REORDER_TABLE = "UPDATE reorder SET deliveryDate = ?, fulfilledBy = (SELECT " +
            "distributedBy.vendor FROM distributedBy JOIN Product ON distributedBy.brand = product.brand " +
            "WHERE product.upc = ?) WHERE orderNumber = ?";
    private final String GET_BRANDS_FROM_STORE = "SELECT DISTINCT Product.brand FROM product JOIN soldBy ON " +
            "soldBy.productId = product.upc WHERE soldBy.storeId = ? ORDER BY Product.brand ASC";
    private final String GET_VENDOR_FROM_STORE = "SELECT DISTINCT distributedBy.vendor FROM product JOIN soldBy " +
            "ON soldBy.productId = product.upc JOIN distributedBy ON product.brand = distributedBy.brand WHERE " +
            "soldBy.storeId = ? ORDER BY distributedBy.vendor";
    private final String GET_STORE_INVENTORY = "SELECT product.name, product.upc, soldBy.numberInStock FROM " +
            "product JOIN soldby ON product.upc = soldBy.productId WHERE soldBy.storeId = ? ORDER BY product.name ASC";
    private final String CREATE_REORDER_REQUEST = "INSERT INTO Reorder (orderNumber, product, store, stockRequested)" +
            "VALUES (?, ?, ?, ?)";

    // Statistical Queries
    private final String GET_PRODUCT_RANKING_ASC = " SELECT product, SUM(numbersold) FROM orders GROUP BY " +
        "product ORDER BY sum";
    private final String GET_PRODUCT_RANKING_BY_STORE_ASC = "SELECT product, SUM(numbersold) FROM orders " +
        "WHERE store = ? GROUP BY product ORDER BY sum";
    private final String GET_CUSTOMER_MVP = "SELECT orders.customer, customer.firstname, customer.lastname, " +
        "SUM(orders.numbersold * product.price) FROM orders JOIN product ON product.upc = orders.product" +
        " JOIN customer ON orders.customer = customer.phonenumber GROUP BY orders.customer, " +
        "customer.firstname, customer.lastname ORDER BY sum DESC";
    private final String GET_STORE_TOTAL_SALES_ASC = "SELECT orders.store, store.address, SUM(orders.numbersold * " +
        "product.price) FROM orders JOIN product ON product.upc = orders.product JOIN store ON " +
        "store.id = orders.store GROUP BY orders.store, store.address ORDER BY sum";
    private final String GET_STORE_TOTAL_SALES_STATE_ASC = "SELECT orders.store, store.address, SUM(orders.numbersold * " +
            "product.price) FROM orders JOIN product ON product.upc = orders.product JOIN store ON " +
            "store.id = orders.store WHERE store.state = ? GROUP BY orders.store, store.address ORDER BY sum";
    private final String GET_PRODUCT_SALES_RANKING_BY_STORE_ASC = "SELECT product, SUM(orders.numbersold * " +
        "product.price) FROM orders JOIN product ON product.upc = orders.product WHERE store = ? " +
        "GROUP BY product ORDER BY sum DESC";
    private final String GET_PRODUCT_SALES_RANKING_ASC = "SELECT product, SUM(orders.numbersold * " +
        "product.price) FROM orders JOIN product ON product.upc = orders.product GROUP BY " +
        "product ORDER BY sum DESC";
    private final String VERIFY_ACCOUNT = "SELECT * FROM admin WHERE username = ? AND password = ?";

    //


    private String username;
    private String password;

    public Admin(String username, String password){
        super();
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return this.username;
    }

    @Override
    public CommandLine initCLI() {
        return new picocli.CommandLine(new CommandService(this))
            .addSubcommand("cart", new CartCommand(this))
            .addSubcommand("store", new AdminStoreCommand(this))
            .addSubcommand("browse", new BrowseCommand(this))
            .addSubcommand("statistics", new StatisticsCommand(this));
    }

    public void requestReorder(String storeid, String itemName, int quantity) {
        try {
            ArrayList<String> orderNumbers = new ArrayList<>();
            Random r = new Random();
            String ONString;
            PreparedStatement stmt;
            ResultSet rs;
            stmt = this.getCon().prepareStatement(ORDER_NUMBERS);
            rs = stmt.executeQuery();
            while(rs.next()){
                orderNumbers.add(rs.getString(1));
            }
            int orderNumber = r.nextInt((99999999 - 10000000) + 1) + 10000000;
            ONString = Integer.toString(orderNumber);
            while(orderNumbers.contains(ONString)){
                orderNumber = r.nextInt((99999999 - 10000000) + 1) + 10000000;
                ONString = Integer.toString(orderNumber);
            }
            stmt = this.getCon().prepareStatement(CREATE_REORDER_REQUEST);
            stmt.setString(1, ONString);
            stmt.setString(2, itemName);
            stmt.setString(3, storeid);
            stmt.setInt(4, quantity);
            stmt.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void fulfillReorders(){
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(GET_UNFULFILLED_ORDERS);
            ResultSet rs = stmt.executeQuery();
            Date date = new Date(Calendar.getInstance().getTime().getTime());
            if (!rs.next()) {
                System.out.println("No unfulfilled reorders!");
            } else {
                do {
                    String orderNumber = rs.getString(1);
                    String upc = rs.getString(2);
                    String storeID = rs.getString(3);
                    int stockRequested = rs.getInt(4);
                    stmt = this.getCon().prepareStatement(UPDATE_STOCK);
                    stmt.setString(1, storeID);
                    stmt.setString(2, upc);
                    stmt.setString(3, storeID);
                    stmt.setString(4, upc);
                    stmt.setString(5, storeID);
                    stmt.setString(6, upc);
                    stmt.executeUpdate();

                    stmt = this.getCon().prepareStatement(UPDATE_REORDER_TABLE);
                    stmt.setDate(1, date);
                    stmt.setString(2, upc);
                    stmt.setString(3, orderNumber);
                    stmt.executeUpdate();
                }while (rs.next()); }
        } catch (SQLException e){
            System.out.println("Error while fulfilling reorder");
            e.printStackTrace();
        }
    }


    public void updatePriceByUPC(String upc, double price) {
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(UPDATE_PRICE_BY_UPC_QUERY);
            stmt.setDouble(1, price);
            stmt.setString(2, upc);
            int rs = stmt.executeUpdate();
            System.out.println(String.format("%s now costs $%f.", upc, price));
        } catch (SQLException e){
            System.out.println("Error: updatingPrice for upc: " + upc);
        }
    }



    public void updatePriceByName(String name, double price) {
        try {
            PreparedStatement stmt = getCon().prepareStatement(UPDATE_PRICE_BY_NAME_QUERY);
            stmt.setDouble(1, price);
            stmt.setString(2, name);
            int rs = stmt.executeUpdate();
            System.out.println(String.format("%s now costs $%f.", name, price));
        } catch (SQLException e){
            System.out.println("Error: updatingPrice for " + name);
            e.printStackTrace();
        }
    }

    public void removeProductFromStorebyName(String name){
        Product p = createProductFromName(name);
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(REMOVE_FROM_STORE);
            stmt.setString(1, store.getId());
            stmt.setString(2, p.getUpc());
            stmt.executeUpdate();
            System.out.println("Store " + store.getId() + " no longer carries " + name);
        } catch (SQLException e){
            System.out.println("Error while removing product from store.");
            e.printStackTrace();
        }
    }

    public void removeProductFromStoreByUPC(String upc){
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(REMOVE_FROM_STORE);
            stmt.setString(1, store.getId());
            stmt.setString(2, upc);
            stmt.executeUpdate();
            System.out.println("Store " + store.getId() + " no longer carries " + upc);
        } catch (SQLException e){
            System.out.println("Error while removing product from store.");
            e.printStackTrace();
        }
    }

    public void addProductToStoreByName(String name){
        Product p = createProductFromName(name);
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(ADD_TO_STORE);
            stmt.setString(1, store.getId());
            stmt.setString(2, p.getUpc());
            stmt.executeUpdate();
            System.out.println("Store " + store.getId() + " now carries " + name);
        } catch (SQLException e){
            System.out.println("Error while adding product to store.");
            e.printStackTrace();
        }
    }

    public void addProductToStoreByUPC(String upc) {
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(ADD_TO_STORE);
            stmt.setString(1, store.getId());
            stmt.setString(2, upc);
            stmt.executeUpdate();
            System.out.println("Store " + store.getId() + " now carries " + upc);
        } catch (SQLException e) {
            System.out.println("Error while removing product from store.");
            e.printStackTrace();
        }
    }

    public void removeCustomer(String phone){
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(REMOVE_CUSTOMER);
            stmt.setString(1, phone);
            stmt.executeUpdate();
            System.out.println("Customer " + phone + " removed from database.");
        } catch (SQLException e){
            System.out.println("Error removing customer from database");
            e.printStackTrace();
        }
    }

    public void dropStore(String storeID){
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(REMOVE_STORE);
            stmt.setString(1, storeID);
            stmt.executeUpdate();
            System.out.println("Store " + storeID + " removed from database.");
        } catch (SQLException e){
            System.out.println("Error removing Store from database");
            e.printStackTrace();
        }
    }

    public void addCustomer(String phone, String firstName, String lastName){
        try {
            PreparedStatement stmt =this.getCon().prepareStatement(CHECK_CUSTOMER);
            stmt.setString(1, phone);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                System.out.println("Phone number already exists!");
            } else {
                stmt = this.getCon().prepareStatement(CREATE_CUSTOMER);
                stmt.setString(1, phone);
                stmt.setString(2, firstName);
                stmt.setString(3, lastName);
                stmt.executeUpdate();
                System.out.println("Customer " + firstName + " " + lastName + " successfully added to database.");
            }
        } catch (SQLException e){
            e.getErrorCode();
        }
    }

    public void getStoreInventory(){
        try{
            PreparedStatement stmt = this.getCon().prepareStatement(GET_STORE_INVENTORY);
            stmt.setString(1, getStore().getId());
            ResultSet rs = stmt.executeQuery();
            System.out.println("-------------------------------------------------");
            System.out.println(String.format("| %-20s | %-12s | %-7s |", "Product Name", "UPC", "Stock"));
            System.out.println("-------------------------------------------------");
            while(rs.next()){
                System.out.println(String.format("| %-20s | %-12s | %-7d |",
                        rs.getString(1), rs.getString(2), rs.getInt(3)));
            }
            System.out.println("-------------------------------------------------");
        } catch (SQLException e){
            System.out.println("Error getting store inventory.");
        }
    }

    public void viewAllVendorNames() {
        try{
            PreparedStatement stmt = this.getCon().prepareStatement(GET_VENDOR_FROM_STORE);
            stmt.setString(1, this.getStore().getId());
            ResultSet rs = stmt.executeQuery();
            System.out.println("List of all vendors that supply to this store:");
            while (rs.next()){
                System.out.println(rs.getString(1));
            }
        } catch (SQLException e){
            System.out.println("Error retrieving vendor names");
            e.printStackTrace();
        }
    }

    public void viewAllBrandNames() {
        try{
            PreparedStatement stmt = this.getCon().prepareStatement(GET_BRANDS_FROM_STORE);
            stmt.setString(1, this.getStore().getId());
            ResultSet rs = stmt.executeQuery();
            System.out.println("List of all brands carried by this store:");
            while (rs.next()){
                System.out.println(rs.getString(1));
            }
        } catch (SQLException e){
            System.out.println("Error retrieving brand names");
            e.printStackTrace();
        }
    }

    //
    // Statistical Query Methods
    //

    public void getCustomerMVP(){
        try{
            PreparedStatement stmt = this.getCon().prepareStatement(GET_CUSTOMER_MVP);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            String phone = rs.getString(1);
            String first = rs.getString(2);
            String last = rs.getString(3);
            Double sold = rs.getDouble(4);
            System.out.println("Customer " + phone + ", " + first + " " + last + " is the most valuable " +
                    "customer, with a total purchase amount of $" + sold + ". Good job!" );
        } catch (SQLException e){
            System.out.println("Error retrieving customer MVP");
            e.printStackTrace();
        }
    }

    public void getItemsRanked(boolean DESC){
        try{
            PreparedStatement stmt;
            if (DESC){
                stmt = this.getCon().prepareStatement(GET_PRODUCT_RANKING_ASC + " DESC");
            }else{
                stmt = this.getCon().prepareStatement(GET_PRODUCT_RANKING_ASC);
            }
            ResultSet rs = stmt.executeQuery();
            rs.next();
            String productUPC;
            if (DESC){
                System.out.println("The 3 most popular items are:");
            } else {
                System.out.println("The 3 least popular items are:");
            }
            for(int i = 0; i < 3; i++){
                productUPC = rs.getString(1);
                Product p = createProductFromName(productUPC);
                System.out.println(p.getName());
                rs.next();
            }
        } catch (SQLException e){
            System.out.println("Error getting popular items.");
            e.printStackTrace();
        }
    }

    public void getItemsByStoreRanked(boolean DESC){
        try{
            PreparedStatement stmt;
            if(DESC){
                stmt = this.getCon().prepareStatement(GET_PRODUCT_RANKING_BY_STORE_ASC + " DESC");
            }else{
                stmt = this.getCon().prepareStatement(GET_PRODUCT_RANKING_BY_STORE_ASC);
            }
            stmt.setString(1, this.getStore().getId());
            ResultSet rs = stmt.executeQuery();
            rs.next();
            String productUPC;
            if(DESC){
                System.out.println("The 3 most popular items at this store:");
            }else{
                System.out.println("The 3 least popular items at this store:");
            }
            for(int i = 0; i < 3; i++){
                productUPC = rs.getString(1);
                Product p = createProductFromName(productUPC);
                System.out.println(p.getName());
                rs.next();
            }
        } catch (SQLException e){
            System.out.println("Error getting popular items.");
            e.printStackTrace();
        }
    }

    public void getBestAndWorstStoreSales(boolean DESC){
        try{
            PreparedStatement stmt;
            if(DESC){
                stmt = this.getCon().prepareStatement(GET_STORE_TOTAL_SALES_ASC + " DESC");
            }else{
                stmt = this.getCon().prepareStatement(GET_STORE_TOTAL_SALES_ASC);
            }
            ResultSet rs = stmt.executeQuery();
            rs.next();
            String storeID = rs.getString(1);
            String address = rs.getString(2);
            if(DESC){
                System.out.println("The top selling store is store number " + storeID + ", at " + address + ".");
            }else{
                System.out.println("The worst selling store is store number " + storeID + ", at " + address + ".");
            }
        } catch (SQLException e){
            System.out.println("Error getting store sales.");
            e.printStackTrace();
        }
    }

    public void getBestAndWorstStoreSalesbyState(boolean DESC, String state){
        try{
            PreparedStatement stmt;
            if(DESC){
                stmt = this.getCon().prepareStatement(GET_STORE_TOTAL_SALES_STATE_ASC + " DESC");
                stmt.setString(1, state);
            }else{
                stmt = this.getCon().prepareStatement(GET_STORE_TOTAL_SALES_STATE_ASC);
                stmt.setString(1, state);
            }
            ResultSet rs = stmt.executeQuery();
            rs.next();
            String storeID = rs.getString(1);
            String address = rs.getString(2);
            if(DESC){
                System.out.println("The top selling store is store number " + storeID + ", at " + address + ".");
            }else{
                System.out.println("The worst selling store is store number " + storeID + ", at " + address + ".");
            }
        } catch (SQLException e){
            System.out.println("Error getting store sales.");
            e.printStackTrace();
        }
    }

    public boolean verifyAccount(){
        try{
            PreparedStatement stmt = this.getCon().prepareStatement(VERIFY_ACCOUNT);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e){
            System.out.println("Error in validating admin credentials.");
            e.printStackTrace();
            return false;
        }
    }

}
