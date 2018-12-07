package com.company.Controller;

import com.company.Controller.CommandDefinitions.*;
import com.company.Model.Admin;
import com.company.Model.Customer;
import com.company.Model.User;
import com.company.Model.User.UserType;
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
    private static final String ACCOUNT_SELECTION_STRING = "Customer or Admin?: ";
    private static final String ADMIN_PROMPT_USER = "Enter Admin username: ";
    private static final String ADMIN_PROMPT_PASSWORD = "Enter Admin password: ";
    private static final String CUSTOMER_PROMPT = "Enter customer phone number: ";
    private static final String WELCOME = "Welcome! ";
    private static final String PROMPT = "> ";
    private static final String START_BANNER = "=================\nWegmans2 CLI APP\n=================";

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

    public void run() {
        System.out.println(START_BANNER);
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
                e.printStackTrace();
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
            tempAdmin = new Admin(username, password);
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
        Customer c = new Customer(customerPhone);
        while (!c.verifyPhoneNumber()){
            System.out.println("No users under that phone number! Please enter a valid phone number.");
            customerPhone = scanner.nextLine();
            c.setPhone(customerPhone);
        }
        c.setNames();
        System.out.println("Welcome, " + c.getFirstname() + " " + c.getLastname() + ".");
        return c;
    }
}
