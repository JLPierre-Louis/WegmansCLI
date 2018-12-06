package com.company.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
    private final String MOST_SOLD_PRODUCT = " SELECT product, SUM(numbersold) FROM orders GROUP BY " +
            "product ORDER BY sum DESC";
    private final String MOST_SOLD_PRODUCT_BY_STORE = "SELECT product, SUM(numbersold) FROM orders " +
            "WHERE store = ? GROUP BY product ORDER BY sum DESC";


    public Customer(String phone) {
        super();
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
            System.exit(1);
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

    public void mostPopularItems(){
        try{
            PreparedStatement stmt = this.getCon().prepareStatement(MOST_SOLD_PRODUCT);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            String productUPC;
            System.out.println("The 3 most popular items are:");
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

    public void removeItemFromCart(String itemName, int number) {
        shoppingCart.removeItem(itemName, number);
    }

    public void getCartTotal(){
        double total = shoppingCart.getTotal();
        String tot = String.format("$%.02f", total);
        System.out.println(tot);
    }

    public void printCartItems() {
        this.getShoppingCart().printCart();
    }

    public void checkout() {
        if (this.getStore() == null) {
            System.out.println("No store selected, please select a store before continuing.");
        } else {
            this.shoppingCart.checkout();
            System.out.println("Thank you for your purchase!");
        }
    }
}
