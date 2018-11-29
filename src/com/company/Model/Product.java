package com.company.Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Product {

    static final String UPC = "0";
    static final String NAME = "1";
    static final String BRAND = "2";
    static final String PRICE = "3";

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
        return "(" + upc + ") " + this.name + this.brand + ": $" + this.price;
    }

    static final void printProducts(ResultSet rs) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            while (rs.next()){
                products.add(new Product(rs.getString(NAME), rs.getString(BRAND), rs.getString(UPC), rs.getDouble(PRICE)));
            }
        } catch (SQLException e){
            System.out.println("Error in product translation.");
            e.printStackTrace();
        }

        for(Product product: products) {
            System.out.println(product.toString());
        }
    }

}
