package com.company.Model;

import com.company.Controller.SQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.Set;

public class ShoppingCart {

    private final String TOTAL_QUERY = "SELECT price FROM Product WHERE name = ?";
    private final String ORDER_NUMBERS = "SELECT orderNumber FROM orders";
    private final String ADD_ORDER = "INSERT INTO orders VALUES (?, ?, ?, ?, ?)";
    private final String GET_UPC_FROM_NAME = "SELECT upc FROM product WHERE name = ?";
    private final String GET_CURR_STOCK = "SELECT soldBy.numberInStock " +
            "FROM soldBy JOIN product ON product.upc = soldBy.productId " +
            "WHERE product.name = ? AND soldBy.storeId = ?";
    private final String UPDATE_STOCK = "UPDATE soldBy SET numberInStock = (SELECT (numberInStock - ?) FROM soldBy " +
            "WHERE storeId = ? AND productId = ?) WHERE storeId = ? AND productId = ?";


    private HashMap<String, Integer> currentItems;
    private String customerPhone;
    private Store store;
    private Connection con;

    public ShoppingCart(Store store, Connection con, String phone) {
        currentItems = new HashMap<>();
        customerPhone = phone;
        this.store = store;
        this.con = con;
    }

    public Store getStore(){
        return this.store;
    }

    public void setStore(Store s){
        this.store = s;
    }

    public boolean addItem(Product p, int number) {
        if (store.isInStock(p)) {
            if (currentItems.containsKey(p.getName())) {
                int newAmt = currentItems.get(p.getName()) + number;
                if (newAmt > store.getStock(p)) {
                    System.out.println("Not enough stock to add " + number + "to cart!");
                    return false;
                } else {
                    currentItems.replace(p.getName(), newAmt);
                    return true;
                }
            } else {
                if (number > store.getStock(p)) {
                    System.out.println("Not enough stock to add " + number + "to cart!");
                    return false;
                } else {
                    currentItems.put(p.getName(), number);
                    return true;
                }
            }
        } else {
            System.out.println("Product not in stock at this store!");
            return false;
        }
    }

    public void removeItem(String item, int number) {
        int newAmt = currentItems.get(item) - number;
        currentItems.replace(item, newAmt);
    }

    public double getTotal() {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        double total = 0;
        Set<String> productSet = currentItems.keySet();
        String[] productNames = productSet.toArray(new String[productSet.size()]);
        try {
            for (int i = 0; i < productNames.length; i++) {
                double currTotal = 0;
                stmt = con.prepareStatement(TOTAL_QUERY);
                stmt.setString(1, productNames[i]);
                rs = stmt.executeQuery();
                rs.next();
                currTotal = rs.getDouble(1);
                total = total + (currTotal * currentItems.get(productNames[i]));
            }
        } catch (SQLException e){
            System.out.println("Error in total calculation.");
            e.printStackTrace();
        }
        return total;
    }

    public void checkout() {
        String[] productNames = currentItems.keySet().toArray(new String[currentItems.keySet().size()]);
        ArrayList<String> orderNumbers = new ArrayList<>();
        Random r = new Random();
        PreparedStatement stmt;
        ResultSet rs;
        String ONString;
        int numInStock = 0;
        try{
            stmt = con.prepareStatement(ORDER_NUMBERS);
            rs = stmt.executeQuery();
            while(rs.next()){
                orderNumbers.add(rs.getString(1));
            }

            for(int i = 0; i < productNames.length; i++){
                int orderNumber = r.nextInt((99999999 - 10000000) + 1) + 10000000;
                ONString = Integer.toString(orderNumber);
                while(orderNumbers.contains(ONString)){
                    orderNumber = r.nextInt((99999999 - 10000000) + 1) + 10000000;
                    ONString = Integer.toString(orderNumber);
                }
                orderNumbers.add(ONString);
                String currUPC;

                stmt = con.prepareStatement(GET_UPC_FROM_NAME);
                stmt.setString(1, productNames[i]);
                rs = stmt.executeQuery();
                rs.next();
                currUPC = rs.getString(1);

                stmt = con.prepareStatement(ADD_ORDER);
                stmt.setString(1, customerPhone);
                stmt.setString(2, ONString);
                stmt.setString(3, currUPC);
                stmt.setString(4, store.getId());
                stmt.setInt(5, currentItems.get(productNames[i]));
                stmt.executeUpdate();

                stmt = con.prepareStatement(UPDATE_STOCK);
                stmt.setInt(1, currentItems.get(productNames[i]));
                stmt.setString(2, store.getId());
                stmt.setString(3, currUPC);
                stmt.setString(4, store.getId());
                stmt.setString(5, currUPC);
                stmt.executeUpdate();

            }
            currentItems.clear();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void printCart() {
        System.out.println("+-----------------------------+");
        System.out.println(String.format("| %-12s | %-12s |", "Product", "Quantity"));
        for(String product : currentItems.keySet() ) {
            System.out.println(String.format("| %-12s | %-12s |", product, currentItems.get(product)));
        }
        System.out.println("+-----------------------------+");
    }

}
