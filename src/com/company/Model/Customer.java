package com.company.Model;

import com.company.Controller.CommandDefinitions.BrowseCommand;
import com.company.Controller.CommandDefinitions.CartCommand;
import com.company.Controller.CommandDefinitions.CustomerStoreCommand;
import com.company.Controller.CommandDefinitions.CustomerSynopsis;
import com.company.Controller.CommandService;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import picocli.CommandLine;

public class Customer extends User {

    private String lastname;
    private String firstname;
    private String phone;
    private ShoppingCart shoppingCart;
    private final int PHONE = 1;
    private final int FIRST = 1;
    private final int LAST = 2;
    private final String STORE_BY_ID_QUERY = "SELECT * FROM Store WHERE id = ?";
    private final String PHONE_NUMBER_CHECK = "SELECT phonenumber FROM customer WHERE phonenumber = ?";
    private final String GET_NAME_BY_PHONE = "SELECT firstname, lastname FROM customer WHERE phonenumber = ?";



    public Customer(Connection con, String phone) {
        super(con);
        this.lastname = lastname;
        this.firstname = firstname;
        this.phone = phone;
        shoppingCart = new ShoppingCart(this.getStore(), this.getCon(), this.phone);
    }

    @Override
    public void selectMainStore(String storeId) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = this.getCon().prepareStatement(STORE_BY_ID_QUERY);
            stmt.setString(1, storeId);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            System.out.println("SQL ERROR: Couldn't set main store.");
            System.out.println(e.getMessage());
        }

        // get the store the user wants to set as their main store
        ArrayList<Store> result = Store.returnListOfStores(rs);
        assert result.size() == 0;
        // set the store to the only store in the result list
        setStore(result.get(0));

        // set the connection to the store
        store.setCon(this.getCon());
        this.shoppingCart = new ShoppingCart(this.getStore(), this.getCon(), this.phone);
    }

        public boolean verifyPhoneNumber(){
        PreparedStatement stmt;
        ResultSet rs;
        try {
            stmt = this.getCon().prepareStatement(PHONE_NUMBER_CHECK);
            stmt.setString(PHONE, this.phone);
            rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e){
            System.out.println("SQL Error in verifyPhoneNumber");
            return false;
        }
    }

    public void setPhone(String phone){
        this.phone = phone;
    }

    public void setNames(){
        PreparedStatement stmt;
        ResultSet rs;
        try {
            stmt = this.getCon().prepareStatement(GET_NAME_BY_PHONE);
            stmt.setString(PHONE, this.phone);
            rs = stmt.executeQuery();
            rs.next();
            firstname = rs.getString(FIRST);
            lastname = rs.getString(LAST);
        } catch (SQLException e){
            System.out.println("SQL Error in setNames");
            System.out.println(e.getMessage());
        }

    }

    public ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCartStore(Store s){
        shoppingCart.setStore(s);
    }

    public void verifyCart(){
        if(this.shoppingCart.getStore() == null){
            shoppingCart.setStore(this.getStore());
        }
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getPhone() {
        return phone;
    }

    public boolean addItemToCart(String itemName, int number) {
        verifyCart();
        Product p = createProductFromName(itemName);
        return shoppingCart.addItem(p, number);
    }

    @Override
    public CommandLine initCLI() {
        return new picocli.CommandLine(new CommandService(this))
            .addSubcommand("cart", new CartCommand(this))
            .addSubcommand("store", new CustomerStoreCommand(this))
            .addSubcommand("browse", new BrowseCommand(this))
            .addSubcommand("synopsis", new CustomerSynopsis());
    }

    public void removeItemFromCart(String itemName, int number) {
        if (!checkStoreSet()) return;
        shoppingCart.removeItem(itemName, number);
    }

    public void getCartTotal(){
        if (!checkStoreSet()) return;
        double total = shoppingCart.getTotal();
        String tot = String.format("$%.02f", total);
        System.out.println(tot);
    }

    public void printCartItems() {
        if (!checkStoreSet()) return;
        this.getShoppingCart().printCart();
    }

    public void checkout() {
        if (!checkStoreSet()) return;
        this.shoppingCart.checkout();
        System.out.println("Thank you for your purchase!");
    }
}
