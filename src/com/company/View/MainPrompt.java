package com.company.View;

import org.apache.commons.cli.*;
import com.company.Model.User;

public class MainPrompt extends Prompt {
    private static final String PROMPT = "> ";
    private static final String STORE_WELCOME = "Please pick a store! (for options type -h)";

    // command options
    private static final String[] HELP_CMD = new String[]{"h", "help", "Show options"};
    private static final String[] QUIT_CMD = new String[]{"q", "quit", "Quit the application"};
    private static final String[] CART_CMD = new String[]{"c", "cart", "Show the current contents of the cart"};
    private static final String PARSER_ERROR = "Invalid command. See -h for help.";

    public MainPrompt(User user) {
        super(user);
    }

    @Override
    public void displayCommands() {
        HelpFormatter helpFormatter = new HelpFormatter();
    }

    @Override
    public void displayMain() {
        System.out.println();
    }

    @Override
    public Object handleMain() {
        Options options = new Options();
        options.addOption(HELP_CMD[0], HELP_CMD[1],false, HELP_CMD[2]);
        options.addOption(QUIT_CMD[0], QUIT_CMD[1],false, QUIT_CMD[2]);

        CommandLineParser parser = new DefaultParser();

        String input = null;
        String[] args = null;
        CommandLine line = null;
        loop : while(true) {
            // Get the next command the user enters
            System.out.print(PROMPT);
            input = scanner.nextLine();
            args = input.split(" ");
            try {
               line = parser.parse(options, args);
            } catch (ParseException e) {
                System.out.println(PARSER_ERROR);
                System.out.println(e.getMessage());
            }

            // display help or quit otherwise handle rest of the commands
            if(hasCmd(line, HELP_CMD)) {
                displayCommands();
            } else if (hasCmd(line, QUIT_CMD)) {
                break loop;
            } else {
                parseCommand(line);
            }

        }
        return null;
    }

    private boolean hasCmd(CommandLine line, String[] argArray) {
        return line.hasOption(argArray[0]) || line.hasOption(argArray[1]);
    }

    private void parseCommand(CommandLine line) {

    }
}
