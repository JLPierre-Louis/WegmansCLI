package com.company.Controller;

import com.company.Controller.CommandDefinitions.Cart;
import com.company.Controller.CommandDefinitions.Store;
import picocli.CommandLine.Command;
import picocli.CommandLine.HelpCommand;
import picocli.CommandLine.Option;

@Command(
    name = "wegmans2",
    subcommands = {HelpCommand.class, Cart.class, Store.class})
public class CommandService implements Runnable{

    @Option(names = {"-q", "--quit"}, description = "quit the application")
    Boolean quit;

    @Command(name = "test", description = "used for testing methods before release`")
    void test(@Option(names = {"-test"}) boolean test) {
        System.out.println("were testing!");
    }

    @Override
    public void run() {
    }
}
