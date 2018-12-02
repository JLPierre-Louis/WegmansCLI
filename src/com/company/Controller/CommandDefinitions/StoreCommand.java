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

    @Command(name = "test", description = "used for testing methods before release`")
    void test(@Option(names = {"-test"}) boolean test) {
        System.out.println(user);
    }

    @Command(name = "set", description = "set your current store")
    void set(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Parameters(paramLabel = "<id>") String id
    ) {
        System.out.println(id);
    }

    @Command(name = "search", description = "search for active stores")
    void search(
        @Option(names = {"-h","--help"}, usageHelp = true) boolean help,
        @Option(names = {"-s", "--state"}, paramLabel = "<state_abbr>") String state,
        @Option(names = {"-i", "--item-name"}, paramLabel = "<item_name>") String itemName,
        @Option(names = {"-t", "--time"}, arity = "2" ,paramLabel = "<time>", description = "4-digit number representing 24-hr time") String[] times
    ) {
        // TODO: implement search store logic
    }

    @Override
    public void run() {
    }
}
