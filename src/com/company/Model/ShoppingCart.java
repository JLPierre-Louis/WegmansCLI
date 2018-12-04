package com.company.Model;

import com.company.Controller.SQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.Set;

public class ShoppingCart {

    private final String TOTAL_QUERY = "SELECT price FROM Product WHERE name = ?";
    private final String ORDER_NUMBERS = "SELECT ordernumber FROM orders";
    private final String ADD_ORDER = "INSERT INTO orders VALUES (?, ?, ?, ?, ?)";
    private final String GET_UPC_FROM_NAME = "SELECT upc FROM product WHERE name = ?";
    private final String GET_CURR_STOCK = "SELECT soldby.numberinstock " +
            "FROM soldby JOIN product ON product.upc = soldby.productid " +
            "WHERE product.name = ? AND soldby.storeid = ?";
    private final String UPDATE_STOCK = "UPDATE soldBy SET numberinstock = ? WHERE productid = ? AND storeid = ?";


    private HashMap<String, Integer> currentItems;
    private String customerPhone;
    private Store store;
    private Connection con;

    public ShoppingCart(Store store, Connection con, String phone) {
        currentItems = new HashMap<>();
        customerPhone = phone;
        this.store = store;
        this.con = con;
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
        double total = 0;
        Set<String> productSet = currentItems.keySet();
        String[] productNames = productSet.toArray(new String[productSet.size()]);
        try {
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
            System.out.println("Error in total calculation.");
            e.printStackTrace();
        }
        return total;
    }

    public void checkout() {
        String[] productNames = currentItems.keySet().toArray(new String[currentItems.keySet().size()]);
        ArrayList<String> orderNumbers = new ArrayList<>();
        Random r = new Random();
        PreparedStatement stmt;
        ResultSet rs;
        String ONString;
        int numInStock = 0;
        try{
            stmt = con.prepareStatement(ORDER_NUMBERS);
            rs = stmt.executeQuery();
            while(rs.next()){
                orderNumbers.add(rs.getString(1));
            }

            for(int i = 0; i < productNames.length; i++){
                int orderNumber = r.nextInt((99999999 - 10000000) + 1) + 10000000;
                ONString = Integer.toString(orderNumber);
                while(orderNumbers.contains(ONString)){
                    orderNumber = r.nextInt((99999999 - 10000000) + 1) + 10000000;
                    ONString = Integer.toString(orderNumber);
                }
                orderNumbers.add(ONString);
                String currUPC;

                stmt = con.prepareStatement(GET_UPC_FROM_NAME);
                stmt.setString(1, productNames[i]);
                rs = stmt.executeQuery();
                rs.next();
                currUPC = rs.getString(1);

                stmt = con.prepareStatement(ADD_ORDER);
                stmt.setString(1, customerPhone);
                stmt.setString(2, ONString);
                stmt.setString(3, currUPC);
                stmt.setString(4, store.getId());
                stmt.setInt(5, currentItems.get(productNames[i]));
                stmt.executeUpdate();

                stmt = con.prepareStatement(GET_CURR_STOCK);
                stmt.setString(1, productNames[i]);
                stmt.setString(2, store.getId());
                rs = stmt.executeQuery();
                rs.next();
                numInStock = rs.getInt(1);
                numInStock = numInStock - currentItems.get(productNames[i]);

                stmt = con.prepareStatement(UPDATE_STOCK);
                stmt.setInt(1, numInStock);
                stmt.setString(2, currUPC);
                stmt.setString(3, store.getId());
                stmt.executeUpdate();

            }
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void printCart() {
        for(String product : currentItems.keySet() ) {
            System.out.println(product + " : " + currentItems.get(product));
        }
    }

}
