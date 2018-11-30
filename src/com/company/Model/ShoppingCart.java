package com.company.Model;

import com.company.Controller.SQLConnection;

import java.sql.*;
import java.util.HashMap;
import java.util.Set;

public class ShoppingCart {

    private final String TOTAL_QUERY = "SELECT price FROM Product WHERE name = ?";
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
        Set<String> productSet = currentItems.keySet();
        String[] productNames = productSet.toArray(new String[productSet.size()]);
        try {
            SQLConnection sqlCon = new SQLConnection();
            con = sqlCon.connectToDB("wegmans2");
            for (int i = 0; i < productNames.length; i++) {
                double currTotal = 0;
                stmt = con.prepareStatement(TOTAL_QUERY);
                stmt.setString(1, productNames[i]);
                rs = stmt.executeQuery();
                rs.next();
                currTotal = rs.getDouble(1);
                total = total + (currTotal * currentItems.get(productNames[i]));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    public void checkout() {

    }

}
