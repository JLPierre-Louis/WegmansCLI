package com.company.View;

import com.company.Model.User;
import java.util.Scanner;

public abstract class Prompt {

    // allows the prompt to call methods
    private User user;

    public Prompt(User user) {
        this.user = user;
    }

    Scanner scanner = new Scanner(System.in);

    public abstract void displayMain();

    public abstract void displayCommands();

    public abstract Object handleMain();

}
