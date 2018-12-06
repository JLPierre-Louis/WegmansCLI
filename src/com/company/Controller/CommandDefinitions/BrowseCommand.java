package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.User;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.ParentCommand;

@Command(name = "browse", description = "allows the user to browse wegmans inventory")
public class BrowseCommand implements Runnable{

    @ParentCommand
    private CommandService parent;
    private User user;

    public BrowseCommand(User user){
        this.user = user;
    }

    @Option(names = {"-n", "--name"}, defaultValue = "", description = "search a product by name")
    String name;

    @Option(names = {"-r", "--price-range"}, split = ",", defaultValue = "0,1000", paramLabel = "<start,end>", description = "4-digit number representing 24-hr time")
    double[] prices;

    @Option(names = {"-t", "--type"}, defaultValue = "", description = "the type of product you want to search for")
    String type;

    /**
     * Note these can be run by all users
     */
    @Override
    public void run() {
        if (!name.isEmpty()) {
            user.queryProductByName(name);
            return;
        }

        if (prices.length > 0) {
            if(!type.isEmpty())
                user.queryProductByTypeAndRange(type, prices[0], prices[1]);
            else
                user.queryProductByPriceRange(prices[0], prices[1]);
            return;
        }

        if (!type.isEmpty()){
            user.queryProductByType(type);
        }
    }
}
