package com.company.View;

import com.company.Model.Admin;
import com.company.Model.Customer;
import org.apache.commons.cli.*;
import com.company.Model.User;

import java.util.ArrayList;

public class MainPrompt extends Prompt {
    private static final String PROMPT = "> ";
    private static final String STORE_WELCOME = "Please pick a store! (for options type -h)";

    // command options
    private static final String[] HELP_CMD = new String[]{"h", "help", "Show options"};
    private static final String[] QUIT_CMD = new String[]{"q", "quit", "Quit the application"};
    private static final String[] SHOW_CART_CMD = new String[]{"c", "show-cart", "Show the current contents of the cart"};
    private static final String[] UPDATE_PRICE_CMD= new String[]{"u", "update-price", "Show the current contents of the cart"};
    private static final String PARSER_ERROR = "Invalid command. See -h for help.";

    private User user;
    private Options options;

    public MainPrompt(User user) {
        this.user = user;
        this.options = createOptions();
    }

    @Override
    public void displayCommands() {
        HelpFormatter helpFormatter = new HelpFormatter();
        helpFormatter.printHelp("WegmansCLI", options);
    }

    @Override
    public void displayMain() {
        System.out.println();
    }

    @Override
    public Object handleMain() {
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
        if(hasCmd(line, SHOW_CART_CMD)) {
            System.out.println("Cart invoked");
            user.queryProductByName("Wild Boar");
        } else if (hasCmd(line, UPDATE_PRICE_CMD)) {
            ((Admin) user).updatePriceByUPC("349330324726", 65.00);
        }
    }

    private Options createOptions() {
        Options newOptions = new Options();

        newOptions.addOption(HELP_CMD[0], HELP_CMD[1],false, HELP_CMD[2]);
        newOptions.addOption(QUIT_CMD[0], QUIT_CMD[1],false, QUIT_CMD[2]);
        if(user instanceof Customer) {
            newOptions.addOption(SHOW_CART_CMD[0], SHOW_CART_CMD[1], false, SHOW_CART_CMD[2]);
        } else {
            newOptions.addOption(SHOW_CART_CMD[0], SHOW_CART_CMD[1], false, SHOW_CART_CMD[2]);
            newOptions.addOption(UPDATE_PRICE_CMD[0], UPDATE_PRICE_CMD[1], false, UPDATE_PRICE_CMD[2]);
        }
        return newOptions;
    }
}
