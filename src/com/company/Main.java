package com.company;

import com.company.Controller.WegmansCLI;
import com.company.Model.Admin;

public class Main {

    public static void main(String[] args) {
        System.out.println("+------------------------------------------------------------------------------+");
        System.out.println("|            Welcome to the Wegmans2 Command Line Shopping Interface           |");
        System.out.println("+------------------------------------------------------------------------------+");
        System.out.println("| In order for you to use this application effectively please follow the steps |");
        System.out.println("| below:                                                                       |");
        System.out.println("|    1. Please identify what user you are (Type: \"customer\" or \"admin\")        |");
        System.out.println("|    2. Enter your credentials                                                 |");
        System.out.println("|        a. Customers - please enter your registered phone number              |");
        System.out.println("|        b. Admins - please enter your username and password                   |");
        System.out.println("|    3. Ask for help!                                                          |");
        System.out.println("|        a. Use \"help [subcommand]\" for general help                           |");
        System.out.println("|        b. Use \"[subcommand] -h \" for option help                             |");
        System.out.println("+------------------------------------------------------------------------------+");
        WegmansCLI main = new WegmansCLI();
        main.run();
    }
}
