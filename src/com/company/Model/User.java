package com.company.Model;

import com.company.Controller.SQLConnection;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class User {

    private String username;

    private Connection con;

    public ArrayList<Store> queryStoreByState(String state) {
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
        return Store.translateStores(rs);
    }

    public Store queryStorebyID(String id) {
        return null;
    }

    public Store queryStoreByProuduct(Product product) {
        return null;
    }

    public ArrayList<Product> queryProductByName(String name) {
        return null;
    }

    public ArrayList<Product> queryProductByPriceRange(double start, double end) {
        return null;
    }

    public ArrayList<Product> queryProductByTypeAndRange(String type, double start, double end) {
        return null;
    }

    public ArrayList<Product> queryProductByBrand(String brand) {
        return null;
    }


}
