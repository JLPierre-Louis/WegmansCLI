package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.Admin;
import java.util.Map;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.ParentCommand;

@Command(name = "store", description = "allows the user to do store related actions")
public class AdminStoreCommand implements Runnable{

    @ParentCommand
    private CommandService parent;

    Admin admin;

    public AdminStoreCommand(Admin admin) {
        this.admin = admin;
    }

    @Option(names = {"-h", "--help"}, usageHelp = true)
    boolean help;

    @Command(name = "set", description = "set your current store")
    void set(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Parameters(paramLabel = "<id>") String id)
    {
        if (id.matches("\\d+"))
            admin.selectMainStore(id);
        else {
            System.out.println("<id> must be integer.");
        }
    }

    @Command(name = "show",  description = "show your current store")
    void show(@Option(names = {"-h","--help"}, usageHelp = true) boolean help) {
        admin.printCurrentStore();
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
            admin.queryStoreByState(state);
        } else if (!itemName.isEmpty()) {
            admin.queryStoreByProduct(itemName);
        } else if (times.size() > 0) {
            for(int start : times.keySet()) {
                int end = times.get(start);
                System.out.println(String.format("====== Time Range [%d - %d] ======",start, end));
                admin.queryStoreByTime(start, end);
                System.out.println("=======================================\n");
            }
        }
    }


    @Command(name = "request-reorder", description = "request a reorder for an item in a store")
    void requestReorder(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Parameters(index = "0", paramLabel = "<store-id>") String id,
        @Parameters(index = "1", paramLabel = "<product-name>") String productName,
        @Parameters(index = "2", paramLabel = "<quantity>") int quantity)
    {
        admin.requestReorder(id, productName, quantity);
    }

    @Command(name = "fulfill-reorder", description = "fulfull a store's need for an item")
    void fulfullReorder(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help)
    {
        admin.fulfillReorders();
    }

    @Command(name = "update-price", description = "update a price for the entire wegmans2 chain")
    void updatePrice(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"-n", "--name"}, defaultValue = "", paramLabel = "<name>", description = "set a price by name") String name,
        @Option(names = {"-u", "--upc"}, defaultValue = "", paramLabel = "<upc>", description = "set a price by upc") String upc,
        @Parameters(paramLabel = "price") double price)
    {
        if(!checkExclusive(name, upc)) return;

        if (!name.isEmpty()) {
            admin.updatePriceByName(name, price);
        } else if (!upc.isEmpty()) {
            admin.updatePriceByUPC(upc, price);
        }
    }

    @Command(name = "add-item", description = "add an item to your current store's stock")
    void addItem(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"-n", "--name"}, defaultValue = "", description = "set a price by name") String name,
        @Option(names = {"-u", "--upc"}, defaultValue = "", description = "set a price by upc") String upc)
    {
        if(!checkExclusive(name, upc)) return;

        if (!name.isEmpty()) {
            admin.addProductToStoreByName(name);
        } else if (!upc.isEmpty()) {
            admin.addProductToStoreByUPC(upc);
        }
    }

    @Command(name = "remove-item", description = "remove an item from your current store's stock")
    void removeItem(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"-n", "--name"}, defaultValue = "", description = "set a price by name") String name,
        @Option(names = {"-u", "--upc"}, defaultValue = "", description = "set a price by upc") String upc)
    {
        if(!checkExclusive(name, upc)) return;

        if (!name.isEmpty()) {
            admin.removeProductFromStorebyName(name);
        } else if (!upc.isEmpty()) {
            admin.removeProductFromStoreByUPC(upc);
        }
    }


    @Command(name = "view-inventory", description = "view your current store's inventory")
    void viewInventory(@Option(names = {"-h", "--help"}, usageHelp = true) boolean help) {
        admin.getStoreInventory();
    }

    @Command(name = "view-vendors", description = "view vendors for your current store")
    void viewVendors(@Option(names = {"-h", "--help"}, usageHelp = true) boolean help) {
        admin.viewAllVendorNames();
    }

    @Command(name = "view-brands", description = "view brands for your current store")
    void viewBrands(@Option(names = {"-h", "--help"}, usageHelp = true) boolean help) {
        admin.viewAllBrandNames();
    }

    private boolean checkExclusive(String name, String upc) {
        if (!name.isEmpty() && !upc.isEmpty()) {
            System.out.println("--name and --upc should be used exclusively");
            return false;
        } else if (name.isEmpty() && upc.isEmpty()) {
            System.out.println("Please use --name or --upc");
            return false;
        } else {
            return true;
        }
    }

    @Override
    public void run() {

    }
}
