package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.ParentCommand;

@Command(name = "synopsis", description = "display all possible commands")
public class CustomerSynopsis implements Runnable{

    @ParentCommand
    CommandService parent;
    @Option(names = {"-h"}, hidden = true) boolean help;

    @Override
    public void run() {

        String[] synopsis = {
            "help    Displays help information about the specified command",
            "quit    quit the application",
            "cart    allows the user to do cart based actions",
            "   add       <item_name> <count>               Add an item to your cart",
            "   remove    <item_name> <count>               remove an item from your cart",
            "   checkout                                    finalize your purchase",
            "   show      Show the contents of your cart",
            "store   allows the user to do store related actions",
            "   search                                      search for active stores",
            "       -i, --item-name=<item_name>                    search stores that have a particular item",
            "       -s, --state=<state_abbr>                       search by state abbreviation (i.e MA)",
            "       -t, --times=<start>=<end>[|<start>=<end>...] 4-digit number representing 24-hr time",
            "   set     <id>                                set your current store",
            "   show                                        show your current store",
            "browse     allows the user to browse wegmans inventory",
            "   -b, --brand=<brand>   query by brand name",
            "   -n, --name=<name>     search a product by name",
            "   -r, --price-range=<start>=<end>[|<start>=<end>...] A double representing 24-hr time",
            "   -t, --type=<type>     the type of product you want to search for"
        };

        for(String s : synopsis) {
            System.out.println(s);
        }
    }

}
