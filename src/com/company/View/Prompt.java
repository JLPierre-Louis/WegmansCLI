package com.company.View;

import java.util.Scanner;

public abstract class Prompt {

    Scanner scanner = new Scanner(System.in);

    public abstract void displayMain();

    public abstract void displayCommands();

    public abstract Object handleMain();

}
