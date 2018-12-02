package com.company.Model;

import com.company.Controller.SQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class User {

    private final String STORE_BY_ID_QUERY = "SELECT * FROM Store WHERE id = ?";
    private final String PRODUCT_BY_NAME_QUERY = "SELECT * FROM Product WHERE name = ?";
    private final String PRODUCT_BY_PRICE_RANGE = "SELECT * FROM Product WHERE price > ? and price < ?";
    private final String PRODUCT_BY_PRICE_AND_TYPE = "SELECT * FROM Product WHERE price > ? and price < ? and type = ?";
    private final String PRODUCT_BY_BRAND_QUERY = "SELECT * FROM Product WHERE brand = ?";
    private final String STORE_BY_PRODUCT_QUERY = "SELECT * FROM Store WHERE id IN (SELECT storeID FROM " +
            "soldBy WHERE productid IN (SELECT upc FROM Product WHERE name = ?))";

    private SQLConnection sqlConnection = new SQLConnection();
    private Connection con;
    Store store;

    public User(){
        try {
            this.con = sqlConnection.connectToDB("wegmans2");
        } catch (SQLException e){
            System.out.println("User could not connect to Wegmans 2: The SQL");
        }
        this.store = new Store("1", "MA", "812 4th Parkway", 10, 12);
    }

    ////////////////////////////////////

    public void setStore(Store s){
        this.store = s;
        s.setCon(con);
    }
    public Connection getCon() {
        return con;
    }
    public Store getStore() {
        return store;
    }


    /////////////////////////////////////

    public void selectMainStore(Store store){
        store.setCon(this.con);
    }

    public void queryStoreByState(String state) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement("SELECT * FROM Store WHERE state = ?");
            stmt.setString(1, state);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Store.returnListOfStores(rs);
    }

    public void queryStorebyID(String id) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(STORE_BY_ID_QUERY);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Store.returnListOfStores(rs);
    }

    public void queryStoreByProduct(String productName) {
        ResultSet rs = null;
        try {
            SQLConnection s = new SQLConnection();
            PreparedStatement stmt = con.prepareStatement(STORE_BY_PRODUCT_QUERY);
            stmt.setString(1, productName);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Store.returnListOfStores(rs);
    }

    public void queryProductByName(String name) {
        ResultSet rs = null;
        try {
            PreparedStatement stmt = con.prepareStatement(PRODUCT_BY_NAME_QUERY);
            stmt.setString(1, name);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Product.printDatabaseResults(rs);
    }

    public void queryProductByPriceRange(double start, double end) {
        ResultSet rs = null;
        try {
            PreparedStatement stmt = con.prepareStatement(PRODUCT_BY_PRICE_RANGE);
            stmt.setDouble(1, start);
            stmt.setDouble(2, end);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Product.printDatabaseResults(rs);
    }

    public void queryProductByTypeAndRange(String type, double start, double end) {
        ResultSet rs = null;
        try {
            PreparedStatement stmt = con.prepareStatement(PRODUCT_BY_PRICE_AND_TYPE);
            stmt.setDouble(1, start);
            stmt.setDouble(2, end);
            stmt.setString(3, type);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Product.printDatabaseResults(rs);
    }

    public void queryProductByBrand(String brand) {
        ResultSet rs = null;
        try {
            PreparedStatement stmt = con.prepareStatement(PRODUCT_BY_BRAND_QUERY);
            stmt.setString(1, brand);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Product.printDatabaseResults(rs);
    }
}
