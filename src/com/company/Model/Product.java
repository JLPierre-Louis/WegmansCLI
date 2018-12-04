package com.company.Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Product {

    static final int UPC = 1;
    static final int BRAND = 2;
    static final int NAME = 3;
    static final int TYPE = 4;
    static final int SIZE = 5;
    static final int PRICE = 6;

    private String name;
    private String brand;
    private String upc;
    private double price;

    public Product(String name, String brand, String upc, double price) {
        this.name = name;
        this.brand = brand;
        this.upc = upc;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public String getBrand() {
        return brand;
    }

    public double getPrice() {
        return price;
    }

    public String getUpc() {
        return upc;
    }

    @Override
    public String toString() {
        return "(" + upc + ") " + this.name + " by " + this.brand + ": $" + this.price;
    }

    static final ArrayList<Product> returnDatabaseResults(ResultSet rs){
        ArrayList<Product> products = new ArrayList<>();
        try {
            while (rs.next()){
                products.add(new Product(rs.getString(NAME), rs.getString(BRAND),
                            rs.getString(UPC), rs.getDouble(PRICE)));
            }
        } catch (SQLException e){
            System.out.println("Error in product translation.");
            e.printStackTrace();
        }
        return products;
    }

    static final void printDatabaseResults(ResultSet rs) {
        ArrayList<Product> products = returnDatabaseResults(rs);
        for(Product product: products) {
            System.out.println(product.toString());
        }
    }
}
