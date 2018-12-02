package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.Customer;
import com.company.Model.User;
import picocli.CommandLine.Option;
import picocli.CommandLine.Command;
import picocli.CommandLine.ParentCommand;

@Command(name = "cart", description = "allows the user to do cart based actions")
public class CartCommand implements Runnable {

    @ParentCommand
    private CommandService parent;

    private User user;

    public CartCommand(User user) {
        this.user = user;
    }

    @Option(names = {"-h", "--help"}, usageHelp = true, description = "display this help and exit")
    boolean help;

    @Command(name = "show", description = "Show the contents of your cart")
    void show(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Option(names = {"-p", "--price"}, defaultValue = "false", description = "Show the total price of the items in your cart") Boolean price,
        @Option(names = {"-i", "--items"}, defaultValue = "false", description = "Show the items in your cart") Boolean items)
    {
        // TODO: use polymorphism better
        if(price) {
            if(user instanceof Customer)
                ((Customer)user).getCartTotal();
        } else if (items) {
            if(user instanceof Customer)
                ((Customer)user).printCartItems();
        }
    }

    @Command(name = "add", description = "Add an item to your cart")
    void add(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Option(names = {"--upc"}, paramLabel = "<upc>", description = "Add product by upc code") String upc,
        @Option(names = {"--name"}, paramLabel = "<name>", description = "Add product by name") String name)
    {
        // TODO: implement log for add command
    }

    @Command(name = "remove", description = "remove an item from your cart")
    void remove(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Option(names = {"--upc"}, paramLabel = "<upc>", description = "Add product by upc code") String upc,
        @Option(names = {"--name"}, paramLabel = "<name>", description = "Add product by name") String name)
    {
        // TODO: implement logic for remove
    }

    @Override
    public void run() {
    }
}
