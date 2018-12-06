package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.User;
import java.util.Map;
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

    @Option(names = {"-r", "--price-range"}, split = "\\|", paramLabel = "<start>=<end>", description = "A double representing 24-hr time")
    Map<Double, Double> priceRanges;

    @Option(names = {"-t", "--type"}, defaultValue = "", description = "the type of product you want to search for")
    String type;

    @Option(names = {"-b", "--brand"}, defaultValue = "",  description = "query by brand name")
    String brand;

    /**
     * Note these can be run by all users
     */
    @Override
    public void run() {
        if (!name.isEmpty()) {
            user.queryProductByName(name);
            return;
        }

        if (priceRanges.size() > 0) {
            for(Double start : priceRanges.keySet()) {
                double end = priceRanges.get(start);
                System.out.println(String.format("====== Price Range [%.2f - %.2f] ======",start, end));
                if(!type.isEmpty())
                    user.queryProductByTypeAndRange(type, start, end);
                else
                    user.queryProductByPriceRange(start, end);
                System.out.println("=======================================\n");
            }
            return;
        }

        if (!type.isEmpty()){
            user.queryProductByType(type);
            return;
        }

        if (!brand.isEmpty()) {
            user.queryProductByBrand(brand);
        }
    }
}
