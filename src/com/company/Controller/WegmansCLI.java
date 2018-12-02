package com.company.Controller;

import com.company.Controller.CommandDefinitions.*;
import com.company.Model.Admin;
import com.company.Model.Customer;
import com.company.Model.Store;
import com.company.Model.User;
import com.company.Model.User.UserType;
import java.sql.SQLException;
import java.util.Scanner;
import picocli.CommandLine;
import picocli.CommandLine.RunAll;
import picocli.CommandLine.UnmatchedArgumentException;

public class WegmansCLI {
    private static Scanner scanner = new Scanner(System.in);
    private static final String ACCOUNT_SELECTION_STRING = "Customer or Admin?: ";
    private static final String ADMIN_PROMPT = "Enter Admin username: ";
    private static final String CUSTOMER_PROMPT = "Enter customer phone number: ";
    private static final String WELCOME = "Welcome! ";
    private static final String PROMPT = "> ";
    private static final String STORE_WELCOME = "Please pick a store! (for options type -h)";

    public SQLConnection dataBase;

    public void initDatabase() {
        dataBase = new SQLConnection();
        try{
            dataBase.connectToDB("Wegmans2");
        }catch (SQLException e){
            System.out.println("SQL Error:");
            e.printStackTrace();
        }
    }

    public void setUserStore(User user, Store store) {

    }

    public void run() {
        User user = chooseUser();
        String input = null;
        String[] args = null;
        CommandLine cmdLine = new CommandLine(new CommandService(user))
            .addSubcommand("cart", new CartCommand(user))
            .addSubcommand("store", new StoreCommand(user));

        // main running loo
        loop : while(true) {
            // Get the next command the user enters
            System.out.print(PROMPT);
            input = scanner.nextLine();
            args = input.split(" ");

            // parse the commands
            try {
                cmdLine.parse(args);
                if (cmdLine.isUsageHelpRequested()) {
                    cmdLine.usage(System.out);
                } else if (cmdLine.getParseResult().hasMatchedOption("q") ||
                    cmdLine.getParseResult().hasMatchedOption("quit")) {
                    break;
                }
                else {
                    cmdLine.parseWithHandler(new RunAll(), args);
                }

            } catch (UnmatchedArgumentException e) {
                System.out.println("Unrecognized Command");
            }
        }
    }

    private User chooseUser() {
        UserType result;
        String user;
        while(true) {
            System.out.print(ACCOUNT_SELECTION_STRING);
            user = scanner.nextLine().toLowerCase();
            try {
                result = UserType.valueOf(user);
                break;
            } catch (IllegalArgumentException e) {
                continue;
            }
        }

        User userObject = null;
        switch (result) {
            case admin:
                userObject = handleAdmin();
                break;
            case customer:
                userObject = handleCustomer();
                break;
        }
        return userObject;

    }

    private Admin handleAdmin() {
        System.out.print(ADMIN_PROMPT);
        String admin = scanner.nextLine();
        System.out.println(WELCOME + admin);
        return new Admin(admin);
    }

    private Customer handleCustomer() {
        System.out.print(CUSTOMER_PROMPT);
        String customerPhone = scanner.nextLine();
        // TODO: run checks for customer here
        Customer c = new Customer(customerPhone);
        /*
        while (!c.verifyPhoneNumber()){
            System.out.println("No users under that phone number! Please enter a valid phone number.");
            customerPhone = scanner.nextLine();
            c.setPhone(customerPhone);
        }
        c.setNames();
        System.out.println("Welcome, " + c.getFirstname() + " " + c.getLastname() + ".");
        */
        return c;
    }

}
