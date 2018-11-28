package com.company.View;

import com.company.Model.User;
import java.util.Scanner;

public abstract class Prompt {

    // allows the prompt to call methods

    Scanner scanner = new Scanner(System.in);

    public abstract void displayMain();

    public abstract void displayCommands();

    public abstract Object handleMain();

}
