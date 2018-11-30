package com.company.Model;

public class Customer extends User {

    private String lastname;
    private String firstname;
    private String phone;
    private ShoppingCart shoppingCart;
    private Store currentStore = new Store("1", "MA", "812 4th Parkway");

    public Customer(String lastname, String firstname, String phone) {
        this.lastname = lastname;
        this.firstname = firstname;
        this.phone = phone;
        shoppingCart = new ShoppingCart(currentStore);
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
        System.out.println(shoppingCart.getTotal());
    }
}
