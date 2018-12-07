package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.User;
import java.util.Map;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.ParentCommand;

@Command(name = "store", description = "allows the user to do store related actions")
public class AdminStoreCommand implements Runnable{

    @ParentCommand
    private CommandService parent;

    User user;

    public AdminStoreCommand(User user) {
        this.user = user;
    }

    @Option(names = {"-h", "--help"}, usageHelp = true)
    boolean help;

    @Command(name = "set", description = "set your current store")
    void set(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Parameters(paramLabel = "<id>") String id)
    {
        if (id.matches("\\d+"))
            user.selectMainStore(id);
        else {
            System.out.println("<id> must be integer.");
        }
    }

    @Command(name = "show",  description = "show your current store")
    void show(@Option(names = {"-h","--help"}, usageHelp = true) boolean help) {
        user.printCurrentStore();
    }

    @Command(name = "search", description = "search for active stores")
    void search(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Option(names = {"-s", "--state"}, defaultValue = "" ,paramLabel = "<state_abbr>") String state,
        @Option(names = {"-i", "--item-name"}, defaultValue = "", paramLabel = "<item_name>") String itemName,
        @Option(names = {"-t", "--times"}, split = "\\|", paramLabel = "<start>=<end>", description = "4-digit number representing 24-hr time")
            Map<Integer, Integer> times)
    {
        // TODO: add options being exclusive
        if(!state.isEmpty()) {
            user.queryStoreByState(state);
        } else if (!itemName.isEmpty()) {
            user.queryStoreByProduct(itemName);
        } else if (times.size() > 0) {
            for(int start : times.keySet()) {
                int end = times.get(start);
                System.out.println(String.format("====== Time Range [%d - %d] ======",start, end));
                user.queryStoreByTime(start, end);
                System.out.println("=======================================\n");
            }
        }
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

    @Override
    public void run() {

    }
}
