package com.company.View;

import com.company.Controller.Wegmans2TheSQL;
import com.company.Model.User;
import picocli.CommandLine;
import picocli.CommandLine.UnmatchedArgumentException;

public class MainPrompt extends Prompt {
    private static final String PROMPT = "> ";
    private static final String STORE_WELCOME = "Please pick a store! (for options type -h)";

    private User user;

    public MainPrompt(User user) {
        this.user = user;
    }

    @Override
    public void displayCommands() {
    }

    @Override
    public void displayMain() {
        System.out.println();
    }

    @Override
    public Object handleMain() throws Exception{
        String input = null;
        String[] args = null;

        CommandLine cmdLine = new CommandLine(new Wegmans2TheSQL());

        loop : while(true) {
            // Get the next command the user enters
            System.out.print(PROMPT);
            input = scanner.nextLine();
            args = input.split(" ");

            try {
                cmdLine.parse(args);
                if (cmdLine.isUsageHelpRequested()) {
                    cmdLine.usage(System.out);
                } else {
                    CommandLine.run(new Wegmans2TheSQL(), args);
                }

            } catch (UnmatchedArgumentException e) {
                System.out.println("Unrecognized Command");
            }

        }
    }
}
