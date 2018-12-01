package com.company.Model;

import com.company.Controller.SQLConnection;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class User {

    final String STORE_BY_PRODUCT_QUERY = "SELECT * FROM Store WHERE id IN (SELECT storeID FROM soldBy WHERE productid IN (SELECT upc FROM Product WHERE name = ?))";
    final String STORE_BY_ID_QUERY = "SELECT * FROM Store WHERE id = ?";
    final String PRODUCT_BY_NAME_QUERY = "SELECT * FROM Product WHERE name = ?";
    final String PRODUCT_BY_PRICE_RANGE = "SELECT * FROM Product WHERE price > ? and price < ?";
    final String PRODUCT_BY_PRICE_AND_TYPE = "SELECT * FROM Product WHERE price > ? and price < ? and type = ?";
    final String PRODUCT_BY_BRAND_QUERY = "SELECT * FROM Product WHERE brand = ?";

    private String username;
    private SQLConnection sqlConnection = new SQLConnection();
    private Connection con;

    User() {
        try {
            con = sqlConnection.connectToDB("wegmans2");
        } catch (SQLException e) {
            System.out.println("ERROR: Couldn't establish connection to database on User creation.");
        }
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
        Store.returnDabaseResults(rs);
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
        Store.returnDabaseResults(rs);
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
        Store.returnDabaseResults(rs);
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
        Product.returnDatabaseResults(rs);
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
        Product.returnDatabaseResults(rs);
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
        Product.returnDatabaseResults(rs);
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
        Product.returnDatabaseResults(rs);
    }
}
