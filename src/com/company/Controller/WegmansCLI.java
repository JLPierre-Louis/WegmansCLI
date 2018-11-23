package com.company.Controller;

import com.company.Model.Store;
import com.company.Model.User;
import com.company.View.LoginPrompt;
import com.company.View.MainPrompt;
import com.company.View.Prompt;

public class WegmansCLI {


    Prompt currentPrompt;

    public WegmansCLI() {
        currentPrompt = new LoginPrompt();
    }

    public void initDatabase() {

    }

    public void setUserStore(User user, Store store) {

    }

    public void run() {
        // handle the user login prompt
        currentPrompt.displayMain();
        User user = (User)currentPrompt.handleMain();
        // only handle customer prompt for now
        currentPrompt = new MainPrompt(user);
        currentPrompt.displayMain();
        currentPrompt.handleMain();
    }

}
