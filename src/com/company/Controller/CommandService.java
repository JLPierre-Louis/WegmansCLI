package com.company.Controller;

import com.company.Model.User;
import picocli.CommandLine.Command;
import picocli.CommandLine.HelpCommand;
import picocli.CommandLine.Option;

@Command(
    name = "wegmans2",
    subcommands = {HelpCommand.class})
public class CommandService implements Runnable{

    User user;

    public CommandService(User user) {
        this.user = user;
    }

    @Command(name = "quit", description = "quit the application")
    void quit() {
        System.out.println("Thank you for using Wegmans2 CLI");
        System.exit(0);
    }

    @Override
    public void run() {
    }
}
