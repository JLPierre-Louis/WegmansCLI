package com.company.Model;

public class Vendor {

    private String name;
    private String homeState;

    public Vendor(String name, String homeState) {
        this.name = name;
        this.homeState = homeState;
    }

    public String getHomeState() {
        return homeState;
    }

    public String getName() {
        return name;
    }
}
