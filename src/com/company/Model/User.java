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

    private String username;
    private Connection con;

    public void queryStoreByState(String state) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            SQLConnection s = new SQLConnection();
            con = s.connectToDB("wegmans2");
            stmt = con.prepareStatement("SELECT * FROM Store WHERE state = ?");
            stmt.setString(1, state);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Store.printStores(rs);
    }

    public void queryStorebyID(String id) {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        try {
            SQLConnection s = new SQLConnection();
            con = s.connectToDB("wegmans2");
            stmt = con.prepareStatement(STORE_BY_ID_QUERY);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Store.printStores(rs);
    }

    public void queryStoreByProduct(String productName) {
        ResultSet rs = null;
        try {
            SQLConnection s = new SQLConnection();
            con = s.connectToDB("wegmans2");
            PreparedStatement stmt = con.prepareStatement(STORE_BY_PRODUCT_QUERY);
            stmt.setString(1, productName);
            rs = stmt.executeQuery();
        } catch (SQLException e){
            e.printStackTrace();
        }
        Store.printStores(rs);
    }

    public void queryProductByName(String name) {
    }

    public void queryProductByPriceRange(double start, double end) {
    }

    public void queryProductByTypeAndRange(String type, double start, double end) {
    }

    public void queryProductByBrand(String brand) {
    }


}
