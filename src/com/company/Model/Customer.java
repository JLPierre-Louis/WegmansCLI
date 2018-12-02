package com.company.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Customer extends User {

    private String lastname;
    private String firstname;
    private String phone;
    private ShoppingCart shoppingCart;
    private final int PHONE = 1;
    private final int FIRST = 1;
    private final int LAST = 2;
    private final String PHONE_NUMBER_CHECK = "SELECT phonenumber FROM customer WHERE phonenumber = ?";
    private final String GET_NAME_BY_PHONE = "SELECT firstname, lastname FROM customer WHERE phonenumber = ?";


    public Customer(String phone) {
        super();
        this.lastname = lastname;
        this.firstname = firstname;
        this.phone = phone;
        shoppingCart = new ShoppingCart(this.getStore(), this.getCon(), this.phone);
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

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getPhone() {
        return phone;
    }

    public void addItemToCart(String item, int number) {
        shoppingCart.addItem(item, number);
    }

    public void getCartTotal(){
        double total = shoppingCart.getTotal();
        String tot = String.format("$%.02f", total);
        System.out.println(tot);
    }

    public void printCartItems() {
        this.getShoppingCart().printCart();
    }
}
