package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.User;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.ParentCommand;

@Command(name = "store", description = "allows the user to do store related actions")
public class StoreCommand implements Runnable{

    @ParentCommand
    private CommandService parent;

    User user;

    public StoreCommand(User user) {
        this.user = user;
    }

    @Option(names = {"-h", "--help"}, usageHelp = true)
    boolean help;

    @Command(name = "set", description = "set your current store")
    void set(@Parameters(paramLabel = "<id>") String id)
    {
        user.selectMainStore(id);
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
        @Option(names = {"-t", "--time"}, split = ",", defaultValue = "0000,2400", paramLabel = "<time>", description = "4-digit number representing 24-hr time") int[] times)
    {
        // TODO: add options being exclusive
        if(!state.isEmpty()) {
            user.queryStoreByState(state);
        } else if (!itemName.isEmpty()) {
            user.queryStoreByProduct(itemName);
        } else if (times.length > 0) {
            user.queryStoreByTime(times[0], times[1]);
        }
    }

    /**
     * If no command is given, then it will execute this code
     */
    @Override
    public void run() {
        System.out.println("Use `store [<subcommand>] -h` for help");
    }
}
