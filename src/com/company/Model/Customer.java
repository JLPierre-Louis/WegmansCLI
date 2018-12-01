package com.company.Model;

import java.sql.Connection;

public class Customer extends User {

    private String lastname;
    private String firstname;
    private String phone;
    private ShoppingCart shoppingCart;


    public Customer(String lastname, String firstname, String phone) {
        super();
        this.lastname = lastname;
        this.firstname = firstname;
        this.phone = phone;
        shoppingCart = new ShoppingCart(this.getStore());
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
