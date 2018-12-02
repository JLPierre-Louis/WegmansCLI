package com.company.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Store {

    private static final int ID = 1;
    private static final int ADDRESS= 2;
    private static final int STATE = 3;
    private static final int OPEN_TIME = 4;
    private static final int CLOSE_TIME = 5;
    private final String SELECT_INVENTORY = "SELECT productId FROM soldBy WHERE storeid = ?";
    private final String GET_STOCK = "SELECT numberInStock FROM soldBy where storeid = ? AND productid = ?";

    private String id;
    private String state;
    private String address;
    private ArrayList<Product> inventory;
    private int openTime;
    private int closeTime;
    private Connection con;


    public Store(String id, String state, String address, int openTime, int closeTime) {
        this.id = id;
        this.state = state;
        this.address = address;
        this.inventory = new ArrayList<>();
        this.openTime = openTime;
        this.closeTime = closeTime;
    }

    //Class attribute getters and setters
    public String getAddress() {
        return address;
    }
    public String getId() {
        return id;
    }
    public String getState() {
        return state;
    }
    public int getOpenTime() {
        return openTime;
    }
    public int getCloseTime() {
        return closeTime;
    }
    public ArrayList<Product> getInventory() {
        // select from store join soldby where store.id = this.id
        return inventory;
    }
    public void setCon(Connection con){
        this.con = con;
    }


    //SQL queries
    public void setInventory(){
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(SELECT_INVENTORY);
            stmt.setString(1, this.id);
            rs = stmt.executeQuery();
            inventory = Product.returnDatabaseResults(rs);
        } catch (SQLException e){
            System.out.println("SQL Error in Store.setInventory()");
            e.printStackTrace();
        }
    }


    public int getStock(Product item) {
        if(isInStock(item)) {
            ResultSet rs = null;
            PreparedStatement stmt = null;
            int stock = -1;
            try {
                stmt = con.prepareStatement(GET_STOCK);
                stmt.setString(1, this.id);
                stmt.setString(2, item.getUpc());
                rs = stmt.executeQuery();
                rs.next();
                stock = rs.getInt(1);
            } catch (SQLException e) {
                System.out.println("SQL Error in Store.setInventory()");
                e.printStackTrace();
            }
            return stock;
        } else {
            System.out.println("Item not in stock.");
            return -1;
        }
    }


    public double priceOf(Product item) {
        return item.getPrice();
    }

    public boolean isInStock(Product item) {
        ResultSet rs;
        PreparedStatement stmt;
        boolean inStock = false;
        try {
            stmt = con.prepareStatement(GET_STOCK);
            stmt.setString(1, this.id);
            stmt.setString(2, item.getUpc());
            rs = stmt.executeQuery();
            inStock = rs.next();
        } catch (SQLException e){
            System.out.println("SQL Error in Store.setInventory()");
            e.printStackTrace();
        }
        return inStock;
    }

    /**
     * This method translates a result set of stores to
     * Store objects
     * @param rs the result set to translate
     */
    public static void returnListOfStores(ResultSet rs){
        ArrayList<Store> stores = new ArrayList<>();
        try {
            while (rs.next()){
                stores.add(new Store(rs.getString(ID), rs.getString(STATE),
                rs.getString(ADDRESS), rs.getInt(OPEN_TIME), rs.getInt(CLOSE_TIME)
                ));
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
