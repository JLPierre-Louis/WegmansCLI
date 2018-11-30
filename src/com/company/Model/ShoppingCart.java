package com.company.Model;

import com.company.Controller.SQLConnection;

import java.sql.*;
import java.util.HashMap;
import java.util.Set;

public class ShoppingCart {

    private HashMap<String, Integer> currentItems;
    private Store store;

    public ShoppingCart(Store store) {
        currentItems = new HashMap<>();
        this.store = store;
    }

    public void addItem(String item, int number) {
        currentItems.put(item, number);
    }

    public void removeItem(String item, int number) {
        int newAmt = currentItems.get(item) - number;
        currentItems.replace(item, newAmt);
    }

    public double getTotal() {
        ResultSet rs = null;
        PreparedStatement stmt = null;
        Connection con = null;
        double total = 0;
        Set productSet = currentItems.keySet();
        String[] productNames = (String[])productSet.toArray();

        try {
            SQLConnection s = new SQLConnection();
            con = s.connectToDB("wegmans2");
            Array products = con.createArrayOf("VARCHAR", productNames);
            stmt = con.prepareStatement("SELECT SUM(price) FROM Product WHERE name in (?)");
            stmt.setArray(1, products);
            rs = stmt.executeQuery();
            total = rs.getDouble(1);
        } catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    public void checkout() {

    }

}
