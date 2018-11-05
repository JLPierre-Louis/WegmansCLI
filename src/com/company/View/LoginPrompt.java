package com.company.View;

import com.company.Controller.UserService;
import com.company.Controller.UserService.UserType;
import com.company.Model.Admin;
import com.company.Model.Customer;
import com.company.Model.User;

public class LoginPrompt extends Prompt {

    private static final String WELCOME_STRING = "********************************\nWELCOME TO WEGMANS2 CLI SHOPPING APP\n********************************\n";
    private static final String LOGIN_WELCOME = "Please log in to use our app!";
    private static final String ACCOUNT_SELECTION_STRING = "Customer or Admin?: ";
    private static final String ADMIN_PROMPT = "Enter Admin username: ";
    private static final String CUSTOMER_PROMPT = "Enter customer phone number: ";
    private static final String COMMAND_ERROR = "No commands on login screen";
    private static final String WELCOME = "Welcome! ";

    @Override
    public void displayCommands() {
        System.out.println(COMMAND_ERROR);
    }

    @Override
    public Object handleMain() {
        UserType result;
        String user;
        while(true) {
            System.out.print(ACCOUNT_SELECTION_STRING);
            user = scanner.nextLine().toLowerCase();
            try {
                result = UserService.UserType.valueOf(user);
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

    @Override
    public void displayMain() {
        System.out.println(WELCOME_STRING);
        System.out.println(LOGIN_WELCOME);
    }

    private Admin handleAdmin() {
        System.out.print(ADMIN_PROMPT);
        String admin = scanner.nextLine();
        System.out.println(WELCOME + admin);
        return new Admin(admin);
    }

    private Customer handleCustomer() {
        System.out.print(CUSTOMER_PROMPT);
        String customer = scanner.nextLine();
        // TODO: run checks for customer here
        System.out.println(WELCOME + customer);
        return new Customer("firstname", "lastname", "phone here");
    }
}
