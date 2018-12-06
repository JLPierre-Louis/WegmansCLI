package com.company;

import com.company.Controller.WegmansCLI;
import com.company.Model.Admin;

public class Main {

    public static void main(String[] args) {
        Admin a = new Admin("asdd");
        a.selectMainStore("1");
        a.getStoreInventory();
        WegmansCLI main = new WegmansCLI();
        main.run();
    }
}
