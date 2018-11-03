package com.company.Model;

public class Brand {

    private String name;
    private Vendor vendor;

    public Brand(String name, Vendor vendor) {
        this.name = name;
        this.vendor = vendor;
    }

    public String getName() {
        return name;
    }

    public Vendor getVendor() {
        return vendor;
    }
}
