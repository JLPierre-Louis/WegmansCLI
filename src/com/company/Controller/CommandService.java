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

    @Option(names = {"-q", "--quit"}, description = "quit the application")
    Boolean quit;

    @Command(name = "test", description = "used for testing methods before release`")
    void test(@Option(names = {"-test"}) boolean test) {
        System.out.println(user);
    }

    @Override
    public void run() {
    }
}
