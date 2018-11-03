package com.company.Controller;

import com.company.Model.Store;
import com.company.Model.User;
import com.company.View.Prompt;

public class UserService {

    enum UserType {
        admin, customer
    }

    private Prompt currentPrompt;
    private User currentUser;
    private Store currentStore;

    public UserService(User user, Prompt prompt) {
        currentPrompt = prompt;
        currentUser = user;
        currentStore = null;
    }

    public Store getCurrentStore() {
        return currentStore;
    }

    public Prompt getCurrentPrompt() {
        return currentPrompt;
    }

    public void updatePrompt(Prompt newPrompt) {

    }

    public void switchToStore(Store store) {

    }

    public Prompt login() {
        return null;
    }

    public void logOut() {

    }


}
