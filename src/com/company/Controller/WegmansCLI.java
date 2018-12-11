package com.company.Controller;

import com.company.Model.Admin;
import com.company.Model.Customer;
import com.company.Model.User;
import com.company.Model.User.UserType;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;
import picocli.CommandLine.MissingParameterException;
import picocli.CommandLine.Model.ArgSpec;
import picocli.CommandLine.ParameterException;
import picocli.CommandLine.RunAll;
import picocli.CommandLine.UnmatchedArgumentException;
import org.apache.tools.ant.types.Commandline;

public class WegmansCLI {
    private static Scanner scanner = new Scanner(System.in);
    private static final String ACCOUNT_SELECTION_STRING = "Welcome are you a customer or an admin?: ";
    private static final String ADMIN_PROMPT_USER = "Enter Admin username: ";
    private static final String ADMIN_PROMPT_PASSWORD = "Enter Admin password: ";
    private static final String CUSTOMER_PROMPT = "Enter customer phone number: ";
    private static final String WELCOME = "Welcome! ";
    private static final String PROMPT = "> ";

    private Connection dataBaseConnection;

    public WegmansCLI(String url, String user, String password) {
        try {
            dataBaseConnection = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            System.out.println("SQL Error. Cannot connect to database");
            System.exit(1);
        }
    }


    public void run() {
        splashScreen();
        User user = chooseUser();
        String input = null;
        String[] args = null;
        picocli.CommandLine cmdLine = user.initCLI();

        // main running loo
        loop : while(true) {
            // Get the next command the user enters
            System.out.print(PROMPT);
            input = scanner.nextLine();
            args = Commandline.translateCommandline(input);

            // parse the commands
            try {
                cmdLine.parse(args);
                if (cmdLine.isUsageHelpRequested()) {
                    cmdLine.usage(System.out);
                } else {
                    cmdLine.parseWithHandler(new RunAll(), args);
                }
            } catch (UnmatchedArgumentException e) {
                System.out.println("Unrecognized Command. Use `help` for help.");
            } catch (MissingParameterException e) {
                for(ArgSpec s : e.getMissing()) {
                    System.out.println(e.getCommandLine().getUsageMessage());
                    System.out.println("Missing following parameters: " + s.paramLabel());
                }
            } catch (ParameterException e) {
                System.out.println("Incorrect Parameters. \n" + e.getCommandLine().getUsageMessage());
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
        String username = null;
        String password = null;
        Admin tempAdmin = null;
        while(true) {
            System.out.print(ADMIN_PROMPT_USER);
            username = scanner.nextLine();
            System.out.print(ADMIN_PROMPT_PASSWORD);
            password = scanner.nextLine();
            tempAdmin = new Admin(dataBaseConnection, username, password);
            if(tempAdmin.verifyAccount())
                break;
            System.out.println("Incorrect credentials. Try again. (passwords are case sensitive)");
        }
        System.out.println(WELCOME + tempAdmin.getUsername());
        return tempAdmin;
    }

    private Customer handleCustomer() {
        System.out.print(CUSTOMER_PROMPT);
        String customerPhone = scanner.nextLine();
        Customer c = new Customer(dataBaseConnection, customerPhone);
        while (!c.verifyPhoneNumber()){
            System.out.println("No users under that phone number! Please enter a valid phone number.");
            customerPhone = scanner.nextLine();
            c.setPhone(customerPhone);
        }
        c.setNames();
        System.out.println("Welcome, " + c.getFirstname() + " " + c.getLastname() + ".");
        return c;
    }


    private static void splashScreen() {
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
        System.out.println("|        c. Use \"synopsis\" for a list of all commands                          |");
        System.out.println("+------------------------------------------------------------------------------+");
    }
}
