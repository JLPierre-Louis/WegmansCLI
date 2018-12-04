package com.company.Model;

import com.company.Controller.SQLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;


public class Admin extends User {

    private final String UPDATE_PRICE_BY_UPC_QUERY = "UPDATE Product SET price = ? WHERE upc = ?";
    private final String UPDATE_PRICE_BY_NAME_QUERY = "UPDATE Product SET price = ? WHERE name = ?";
    private final String CREATE_REORDER_REQUEST = "INSERT INTO Reorder (orderNumber, product, store, stockRequested)" +
            "                                      VALUES (?, ?, ?, ?)";
    private final String ORDER_NUMBERS = "SELECT ordernumber FROM Reorder";
    private final String GET_UNFULFILLED_ORDERS = "SELECT product, store, stockRequested FROM Reorder WHERE deliveryDate IS NULL";
    private String username;

    public Admin(String username){
        super();
        this.username = username;
    }

    public void requestReorder(Store store, Product item, int quantity) {
        try {
            ArrayList<String> orderNumbers = new ArrayList<>();
            Random r = new Random();
            String ONString;
            PreparedStatement stmt;
            ResultSet rs;
            stmt = this.getCon().prepareStatement(ORDER_NUMBERS);
            rs = stmt.executeQuery();
            while(rs.next()){
                orderNumbers.add(rs.getString(1));
            }
            int orderNumber = r.nextInt((99999999 - 10000000) + 1) + 10000000;
            ONString = Integer.toString(orderNumber);
            while(orderNumbers.contains(ONString)){
                orderNumber = r.nextInt((99999999 - 10000000) + 1) + 10000000;
                ONString = Integer.toString(orderNumber);
            }
            stmt = this.getCon().prepareStatement(CREATE_REORDER_REQUEST);
            stmt.setString(1, ONString);
            stmt.setString(2, item.getUpc());
            stmt.setString(3, store.getId());
            stmt.setInt(4, quantity);
            stmt.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void fulfillReorders(){
        try {
            PreparedStatement stmt = this.getCon().prepareStatement(GET_UNFULFILLED_ORDERS);
            ResultSet rs = stmt.executeQuery();
        } catch (SQLException e){
            System.out.println("Error while fulfilling reorder");
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
