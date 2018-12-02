package com.company.Controller.CommandDefinitions;

import com.company.Controller.Wegmans2TheSQL;
import java.util.concurrent.Callable;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.ParentCommand;

@Command(name = "store", description = "allows the user to do store related actions")
public class Store implements Runnable{

    @ParentCommand
    private Wegmans2TheSQL parent;

    @Command(name = "set", description = "set your current store")
    void set(
        @Parameters(paramLabel = "<id>") String id
    ) {
        System.out.println(id);
    }

    @Command(name = "search", description = "search for active stores")
    void search(
        @Option(names = {"-s", "--state"}, paramLabel = "<state_abbr>") String state,
        @Option(names = {"-i", "--item-name"}, paramLabel = "<item_name>") String itemName,
        @Option(names = {"-t", "--time"}, arity = "2" ,paramLabel = "<time>", description = "4-digit number representing 24-hr time") String[] times
    ) {
        // TODO: implement search store logic
    }

    @Override
    public void run() {
        System.out.println("here");
    }
}
