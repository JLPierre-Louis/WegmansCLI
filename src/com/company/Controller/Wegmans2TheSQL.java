package com.company.Controller;

import com.company.Controller.CommandDefinitions.Cart;
import com.company.Controller.CommandDefinitions.Store;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.HelpCommand;
import picocli.CommandLine.Option;

@Command(
    name = "wegmans2",
    subcommands = {HelpCommand.class, Cart.class, Store.class})
public class Wegmans2TheSQL implements Runnable{

    @Command(name = "explain", helpCommand = true, description = "display this help and exit")
    void displaySubcommandHelp() {
        CommandLine.usage(new Cart(), System.out);
        CommandLine.usage(new Store(), System.out);
    }

    @Override
    public void run() {
    }
}
