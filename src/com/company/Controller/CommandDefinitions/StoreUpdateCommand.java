package com.company.Controller.CommandDefinitions;

import com.company.Model.User;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.ParentCommand;

@Command(name = "store")
public class StoreUpdateCommand extends StoreCommand {

    public StoreUpdateCommand(User user) {
        super(user);
    }

    @Command(name = "request-reorder", description = "request a reorder for an item in a store")
    void requestReorder(
        @Parameters(index = "0", paramLabel = "<store-id>") String id,
        @Parameters(index = "1", paramLabel = "<product-name>") String productName,
        @Parameters(index = "2", paramLabel = "<quantity>") int quantity)
    {

    }

    @Command(name = "fulfill-reorder", description = "fulfull a store's need for an item")
    void fulfullReorder(
        @Parameters(index = "0", paramLabel = "<store-id>") String id,
        @Parameters(index = "1", paramLabel = "<product-name>") String productName,
        @Parameters(index = "2", paramLabel = "<quantity>") int quantity)
    {

    }

    @Command(name = "price", description = "update a price for the entire wegmans2 chain")
    void updatePrice(
        @Option(names = {"-n", "--name"}, defaultValue = "", description = "set a price by name") String name,
        @Option(names = {"-u", "--upc"}, defaultValue = "", description = "set a price by upc") String upc,
        @Parameters double price)
    {

    }

    @Command(name = "add-item", description = "add an item to your current store's stock")
    void addItem(
        @Option(names = {"-n", "--name"}, defaultValue = "", description = "set a price by name") String name,
        @Option(names = {"-u", "--upc"}, defaultValue = "", description = "set a price by upc") String upc,
        @Parameters double price)
    {

    }

    @Command(name = "remove-item", description = "remove an item from your current store's stock")
    void removeItem(
        @Option(names = {"-n", "--name"}, defaultValue = "", description = "set a price by name") String name,
        @Option(names = {"-u", "--upc"}, defaultValue = "", description = "set a price by upc") String upc,
        @Parameters double price)
    {

    }

    @Command(name = "remove-location", description = "remove a store from the wegmans2 chain")
    void removeStore(@Parameters String storeid) {

    }





}
