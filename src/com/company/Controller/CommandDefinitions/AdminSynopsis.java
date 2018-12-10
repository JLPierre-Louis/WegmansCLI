package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.ParentCommand;

@Command(name = "synopsis", description = "display all possible commands")
public class AdminSynopsis implements Runnable{

    @ParentCommand
    CommandService parent;
    @Option(names = {"-h"}, hidden = true) boolean help;

    @Override
    public void run() {

            String[] synopsis = {
                "help    Displays help information about the specified command",
                "quit    quit the application",
                "store   allows the user to do store related actions",
                "   search                                      search for active stores",
                "       -i, --item-name=<item_name>                    search stores that have a particular item",
                "       -s, --state=<state_abbr>                       search by state abbreviation (i.e MA)",
                "       -t, --times=<start>=<end>[|<start>=<end>...] 4-digit number representing 24-hr time",
                "   set     <id>                                set your current store",
                "   show                                        show your current store",
                "   view-brands      view brands for your current store",
                "   view-inventory   view your current store's inventory",
                "   view-vendors     view vendors for your current store",
                "   update-price  <price>   update a price for the entire wegmans2 chain",
                "       -u, --upc=<upc>    set a price by upc",
                "       -n, --name=<name>   set a price by name",
                "   request-reorder <store-id> <product-name> <quantity> request a reorder for an item in a store",
                "   fulfill-reorder  fulfill a store's need for an item",
                "browse     allows the user to browse wegmans inventory",
                "   -b, --brand=<brand>                                 query by brand name",
                "   -n, --name=<name>                                   search a product by name",
                "   -r, --price-range=<start>=<end>[|<start>=<end>...]  A double representing 24-hr time",
                "   -t, --type=<type>                                   the type of product you want to search for",
                "statistics, stats  get statistics about how wegmans2 is doing",
                "   customer-mvp  gets the customer who has spent the most money",
                "   item-sales    get first 3 best or worst items sold",
                "           --rank=TOP|BOT                              either display the top or bottom three items",
                "       -a, --all                                       search all store's best/worst items",
                "   store-sales   gets the customer who has spent the most money",
                "         --rank=TOP|BOT                                display top or bottom store in sales",
                "       -s, --state=<state_abbr>                        narrow sales search to a specific state",
                "update     update certain aspects of the database",
                "   add-customer <firstname> <lastname> <phonenumber>   add a customer to the database",
                "   remove-customer <phonenumber>   remove a customer from the database",
                "   remove-location <store-id>      remove a store from the database"
            };

            for(String s : synopsis) {
                System.out.println(s);
            }
        }
    }
