package com.company.Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Store {

    private static final int ID = 1;
    private static final int ADDRESS= 2;
    private static final int STATE = 3;
    private static final int OPEN_TIME = 4;
    private static final int CLOSE_TIME = 5;

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
        // select from store join soldby where store.id = this.id
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

    /**
     * This method translates a result set of stores to
     * Store objects
     * @param rs the result set to translate
     */
    public static void returnDabaseResults(ResultSet rs){
        ArrayList<Store> stores = new ArrayList<>();
        try {
            while (rs.next()){
                stores.add(new Store(rs.getString(ID), rs.getString(STATE), rs.getString(ADDRESS)));
            }
        } catch (SQLException e){
            System.out.println("Error in store translation.");
            e.printStackTrace();
        }

        for (Store s: stores) {
            System.out.println(s);
        }
    }

    @Override
    public String toString() {
        return getId() + ": " + getAddress() + ", " + getState();
    }
}
