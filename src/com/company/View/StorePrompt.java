package com.company.View;

public class StorePrompt extends Prompt {

    private static final String PROMPT = "> ";
    private static final String STORE_WELCOME = "Please pick a store! (for options type -h)";

    // command options
    private static final String HELP_CMD = "h";
    private static final String QUIT_CMD = "q";

    @Override
    public void displayMain() {
        System.out.println(STORE_WELCOME);
    }

    @Override
    public Object handleMain() {
        String input;
        loop : while(true) {
            System.out.print(PROMPT);
            input = scanner.nextLine();
            switch (input) {
                case HELP_CMD:
                    displayCommands();
                    break;
                case QUIT_CMD:
                    break loop;

            }
        }
        return null;
    }

    @Override
    public void displayCommands() {
        System.out.println(HELP_CMD + ": display the help commands");
        System.out.println(QUIT_CMD+ ": quit the application");
    }
}
