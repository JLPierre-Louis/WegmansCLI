package com.company.Model;

import com.company.Controller.SQLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Admin extends User {

    final String UPDATE_PRICE_BY_UPC_QUERY = "UPDATE Product SET price = ? WHERE upc = ?";
    final String UPDATE_PRICE_BY_NAME_QUERY = "UPDATE Product SET price = ? WHERE name = ?";

    private String username;

    public Admin(String username){
        super();
        this.username = username;
    }

    public void requestReorder(Store store, Product item, int quantity) {
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(UPDATE_PRICE_BY_UPC_QUERY);
            int rs = stmt.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void updatePriceByUPC(String upc, double price) {
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(UPDATE_PRICE_BY_UPC_QUERY);
            stmt.setDouble(1, price);
            stmt.setString(2, upc);
            int rs = stmt.executeUpdate();
        } catch (SQLException e){
            System.out.println("Error: updatingPrice for upc: " + upc);
        }
    }

    public void updatePriceByName(String name, double price) {
        try {
            PreparedStatement stmt = getCon().prepareStatement(UPDATE_PRICE_BY_NAME_QUERY);
            stmt.setDouble(1, price);
            stmt.setString(2, name);
            int rs = stmt.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public ArrayList<String> viewAllVendorNames() {
        return null;
    }

    public ArrayList<String> viewAllBrandNames() {
        return null;
    }


}
