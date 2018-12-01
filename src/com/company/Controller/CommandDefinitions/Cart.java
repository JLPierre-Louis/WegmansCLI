package com.company.Controller.CommandDefinitions;

import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.Command;

@Command(name = "cart", description = "Do cart related commands")
public class Cart {

    @Command(name = "show", description = "Show the contents of your cart")
    void show(
        @Option(names = {"-p", "--price"}, description = "Show the total price of the items in your cart") Boolean price,
        @Option(names = {"-i", "--items"}, description = "Show the items in your cart") Boolean items
    ) {
        // TODO: implement logic for show command
    }

    @Command(name = "add", description = "Add an item to your cart")
    void add(
        @Option(names = {"--upc"}, paramLabel = "<upc>", description = "Add product by upc code") String upc,
        @Option(names = {"--name"}, paramLabel = "<name>", description = "Add product by name") String name
    ) {
        // TODO: implement log for add command
    }

    @Command(name = "remove", description = "remove an item from your cart")
    void remove(
        @Option(names = {"--upc"}, paramLabel = "<upc>", description = "Add product by upc code") String upc,
        @Option(names = {"--name"}, paramLabel = "<name>", description = "Add product by name") String name
    ) {
        // TODO: implement logic for remove
    }


}
