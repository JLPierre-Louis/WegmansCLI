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
        return (String.format("| %-21s | %-12s | %-21s | %-7.2f |", getName(), getUpc(), getBrand(), getPrice()));
    }

    static final ArrayList<Product> returnDatabaseResults(ResultSet rs){
        ArrayList<Product> products = new ArrayList<>();
        try {
            if (!rs.next()) {
                return null;
            } else {
                do {
                    products.add(new Product(rs.getString(NAME), rs.getString(BRAND),
                            rs.getString(UPC), rs.getDouble(PRICE)));
            }while (rs.next()); }
        } catch (SQLException e){
            System.out.println("Error in product translation.");
            e.printStackTrace();
        }
        return products;
    }

    static final void printDatabaseResults(ResultSet rs) {
        ArrayList<Product> products = returnDatabaseResults(rs);
        if (products != null){
            System.out.println("--------------------------------------------------------------------------");
            System.out.println(String.format("| %-21s | %-12s | %-21s | %-7s |", "Name", "UPC", "Brand", "Price"));
            for(Product product: products) {
                System.out.println("|------------------------------------------------------------------------|");
                System.out.println(product.toString());
            }
            System.out.println("--------------------------------------------------------------------------");
        }else{
            System.out.println("No products found under specified parameters!");
        }

    }
}
