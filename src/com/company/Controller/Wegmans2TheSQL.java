package com.company.Controller;

import com.company.Controller.CommandDefinitions.Cart;
import com.company.Controller.CommandDefinitions.Store;
import picocli.CommandLine.Command;
import picocli.CommandLine.HelpCommand;
import picocli.CommandLine.Option;

@Command(
    name = "wegmans2",
    subcommands = {HelpCommand.class, Cart.class, Store.class})
public class Wegmans2TheSQL implements Runnable{

    @Option(names = {"-q", "--quit"}, description = "quit the application")
    Boolean quit;

    @Override
    public void run() {
    }
}
