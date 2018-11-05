package com.company.Controller;

import com.company.Model.Store;
import com.company.Model.User;
import com.company.View.Prompt;

public class UserService {

    public enum UserType {
        admin, customer
    }

    private Prompt currentPrompt;
    private Store currentStore;

    public UserService(Prompt prompt) {
        currentPrompt = prompt;
        currentStore = null;
    }

    public Store getCurrentStore() {
        return currentStore;
    }

    public Object runCurrentPromptDialog() {
        currentPrompt.displayMain();
        return currentPrompt.handleMain();
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
