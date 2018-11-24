package com.company.Controller;

import com.company.Model.Customer;
import com.company.Model.Store;
import com.company.Model.User;
import com.company.View.LoginPrompt;
import com.company.View.Prompt;
import com.company.View.StorePrompt;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

public class WegmansCLI {

    public SQLConnection dataBase;
    private Prompt currentPrompt;

    public WegmansCLI() {
        currentPrompt = new LoginPrompt();
    }

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
        // handle the user login prompt
        currentPrompt.displayMain();
        User user = (User)currentPrompt.handleMain();

        // only handle customer prompt for now
        if(user instanceof Customer) {
            currentPrompt = new StorePrompt();
            currentPrompt.displayMain();
            currentPrompt.handleMain();
        }



    }

}
