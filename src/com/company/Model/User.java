package com.company.Model;

import java.util.ArrayList;

public abstract class User {

    private String username;

    public ArrayList<Store> queryStoreByState(String state) {
        return null;
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
