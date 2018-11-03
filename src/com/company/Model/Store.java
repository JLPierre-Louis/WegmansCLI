package com.company.Model;

import java.util.ArrayList;

public class Store {

    private String id;
    private String state;
    private String address;
    private ArrayList<Product> inventory;

    public Store(String id, String state, String address) {
        this.id = id;
        this.state = state;
        this.address = address;
        this.inventory = new ArrayList<>();
    }

    public ArrayList<Product> getInventory() {
        return inventory;
    }


    public String getAddress() {
        return address;
    }

    public String getId() {
        return id;
    }

    public String getState() {
        return state;
    }

    public int getTotalSold(Product item) {
        return 0;
    }

    public int getStock(Product item) {
        return 0;
    }

    public void updateItem(Product item, int number) {

    }

    public double priceOf(Product item) {
        return 0.0;
    }

    public boolean isInStock(Product item) {
        return false;
    }
}
