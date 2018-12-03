package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.Customer;
import com.company.Model.User;
import picocli.CommandLine.Option;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
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
        @Option(names = {"-p", "--price"}, defaultValue = "true", description = "Only show total price of items in your cart") Boolean price,
        @Option(names = {"-i", "--items"}, defaultValue = "true", description = "Only show items in your cart") Boolean items)
    {
        // TODO: use polymorphism better
        if(user instanceof Customer) {
            Customer customer = ((Customer) user);
            // only show the items, we disable the price
            if(price) {
                customer.printCartItems();
            }
            if(items) {
                customer.getCartTotal();
            }
        }
    }

    @Command(name = "add", description = "Add an item to your cart")
    void add(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Parameters(paramLabel = "ITEM_NAME", description = "Add product by name") String name,
        @Parameters(paramLabel = "COUNT", defaultValue = "1", description = "Number of items to add") int count)
    {
        if(user instanceof Customer) {
            Customer customer = ((Customer) user);
            if(!name.isEmpty()) {
                customer.addItemToCart(name, count);
            }
            System.out.println(count + " " + name + "(s) added to your cart.");
        }
    }

    @Command(name = "remove", description = "remove an item from your cart")
    void remove(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Parameters(paramLabel = "ITEM_NAME", description = "Add product by name") String name,
        @Parameters(paramLabel = "COUNT", defaultValue = "1", description = "Number of items to add") int count)
    {
        if(user instanceof Customer) {
            Customer customer = ((Customer) user);
            if(!name.isEmpty()) {
                customer.removeItemFromCart(name, count);
            }
            System.out.println(count + " " + name + "(s) removed from your cart.");
        }
    }

    @Override
    public void run() {
        System.out.println("Use `cart [<subcommand>] -h` for hep");
    }
}
