package com.company.Model;

public class Product {

    private String name;
    private Brand brand;
    private String upc;
    private double price;

    public Product(String name, Brand brand, String upc, double price) {
        this.name = name;
        this.brand = brand;
        this.upc = upc;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public Brand getBrand() {
        return brand;
    }

    public double getPrice() {
        return price;
    }

    public String getUpc() {
        return upc;
    }
}
