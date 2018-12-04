package com.company.Model;

import com.company.Controller.SQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class User {

    public enum UserType {
        admin, customer
    }
    private final String STORE_BY_ID_QUERY = "SELECT * FROM Store WHERE id = ?";
    private final String STORE_BY_TIME_QUERY = "SELECT * FROM Store WHERE openTime >= ? AND closeTime <= ?";
    private final String STORE_BY_STATE_QUERY = "SELECT * FROM Store WHERE state = ?";
    private final String STORE_BY_PRODUCT_QUERY = "SELECT * FROM Store WHERE id IN (SELECT storeID FROM " +
            "soldBy WHERE productid IN (SELECT upc FROM Product WHERE name = ?))";
    private final String PRODUCT_BY_NAME_QUERY = "SELECT product.* FROM Product JOIN soldBy ON " +
            "soldBy.productId = product.upc WHERE soldBy.storeId = ? AND name = ? ORDER BY product.name ASC";
    private final String PRODUCT_BY_PRICE_RANGE = "SELECT product.* FROM Product JOIN soldBy ON " +
            "soldBy.productId = product.upc WHERE soldBy.storeId = ? AND product.price > ? AND price < ? ORDER BY" +
            "product.name ASC";
    private final String PRODUCT_BY_PRICE_AND_TYPE = "SELECT product.* FROM Product JOIN soldBy ON" +
            " soldBy.productId = product.upc WHERE soldBy.storeId = ? AND product.price > ? AND price < ? AND " +
            "type = ? ORDER BY product.name ASC";
    private final String PRODUCT_BY_BRAND_QUERY = "SELECT product.* FROM Product JOIN soldBy ON " +
            "soldBy.productId = product.upc WHERE soldBy.storeId = ? AND brand = ?";

    private SQLConnection sqlConnection = new SQLConnection();
    private Connection con;
    Store store;

    public User(){
        try {
            this.con = sqlConnection.connectToDB("wegmans2");
        } catch (SQLException e){
            System.out.println("User could not connect to Wegmans 2: The SQL");
        }
        // this.store = new Store("1", "MA", "812 4th Parkway", 10, 12);
        this.store = null;
    }

    ///////////////// GETTERS and SETTERS ///////////////////

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


    ////////////////// APPLICATION ///////////////////

    public void printCurrentStore(){
        if (this.store == null) {
            System.out.println("You currently do not have a store chosen! Use \"store set\" to set your store");
        } else {
            System.out.println(this.store.toString());
        }
    }

    /**
     * This function will set the user's main store to the store given by the
     * id.
     *
     * NOTE: if the user wants to change their store, the must use the changeStore() method
     * @param storeId  the id of the store
     */
    public void selectMainStore(String storeId){
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(STORE_BY_ID_QUERY);
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
        store.setCon(this.con);
    }

    /**
     * This will change the user's current store and wipe the contents of the
     * shopping cart
     * @param storeId the id of the store, given as a string
     */
    public void changeMainStore(String storeId) {
        // TODO: implement me
    }

    /**
     * This function will query the database to find all the stores
     * in a given state and print the list to the user
     * @param state the state abbreviation (i.e MA, WA, OR, NY, CA)
     */
    public void queryStoreByState(String state) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(STORE_BY_STATE_QUERY);
            stmt.setString(1, state);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Store.printDatabaseResults(rs);
    }

    /**
     * this will query the database to find a single store
     * by a given id and print it
     * @param id the id number of the store as a string
     */
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
        Store.printDatabaseResults(rs);
    }

    /**
     * Will query the database and print out the
     * list of stores that carry the specified product
     * @param productName the name of the proudct
     */
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
        Store.printDatabaseResults(rs);
    }

    public void queryStoreByTime(int start, int end) {
        ResultSet rs = null;
        try {
            SQLConnection s = new SQLConnection();
            PreparedStatement stmt = con.prepareStatement(STORE_BY_TIME_QUERY);
            stmt.setInt(1, start);
            stmt.setInt(2, end);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Store.printDatabaseResults(rs);
    }

    ////////////////////////// Product Related Queries //////////////////

    /**
     * Will query the database and print out the product
     * with the given name
     * @param name the name of the product
     */
    public void queryProductByName(String name) {
        ResultSet rs = null;
        try {
            PreparedStatement stmt = con.prepareStatement(PRODUCT_BY_NAME_QUERY);
            stmt.setString(1, store.getId());
            stmt.setString(2, name);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Product.printDatabaseResults(rs);
    }

    /**
     * Will query the database and print a list of products
     * for a given price range
     * @param start the lower bound of the item as a double
     * @param end the upper bound of the item as a double
     */
    public void queryProductByPriceRange(double start, double end) {
        ResultSet rs = null;
        try {
            PreparedStatement stmt = con.prepareStatement(PRODUCT_BY_PRICE_RANGE);
            stmt.setString(1, store.getId());
            stmt.setDouble(2, start);
            stmt.setDouble(3, end);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Product.printDatabaseResults(rs);
    }

    /**
     * Queries the database and prints all items of a given price range
     * that are of a certain type (i.e snacks)
     * @param type
     * @param start
     * @param end
     */
    public void queryProductByTypeAndRange(String type, double start, double end) {
        ResultSet rs = null;
        try {
            PreparedStatement stmt = con.prepareStatement(PRODUCT_BY_PRICE_AND_TYPE);
            stmt.setString(1, store.getId());
            stmt.setDouble(2, start);
            stmt.setDouble(3, end);
            stmt.setString(4, type);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Product.printDatabaseResults(rs);
    }

    /**
     * Queries the database and prints a lists of items for a given brand
     * @param brand the brand name
     */
    public void queryProductByBrand(String brand) {
        ResultSet rs = null;
        try {
            PreparedStatement stmt = con.prepareStatement(PRODUCT_BY_BRAND_QUERY);
            stmt.setString(1, store.getId());
            stmt.setString(2, brand);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Product.printDatabaseResults(rs);
    }
}
