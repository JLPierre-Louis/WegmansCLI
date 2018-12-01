package com.company.Model;

import java.sql.Connection;

public class Customer extends User {

    private String lastname;
    private String firstname;
    private String phone;
    private ShoppingCart shoppingCart;
    //////////////////////////////////////////////////////////////////////////////////////////////////
    private final String PHONE_NUMBER_CHECK = "SELECT phonenumber FROM customer WHERE phonenumber = ?";
    //When you get the resultSet from this query, and you want to check if the phone is in the database,
    //you can just return rs.next();
    //rs.next() returns false if it's an empty table, so that means that phonenumber didn't exist in the DB
    //////////////////////////////////////////////////////////////////////////////////////////////////


    public Customer(String lastname, String firstname, String phone) {
        super();
        this.lastname = lastname;
        this.firstname = firstname;
        this.phone = phone;
        shoppingCart = new ShoppingCart(this.getStore(), this.getCon(), this.phone);
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
}
