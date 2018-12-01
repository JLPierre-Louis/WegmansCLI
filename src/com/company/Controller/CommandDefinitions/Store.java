package com.company.Controller.CommandDefinitions;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;

@Command(name = "store", description = "Do store related things")
public class Store {

    @Command(name = "set", description = "set your current store")
    void set(
        @Parameters(paramLabel = "<id>") String id
    ) {
        // TODO: implement set store logic
    }

    @Command(name = "search", description = "search for active stores")
    void search(
        @Option(names = {"-s", "--state"}, paramLabel = "<state_abbr>") String state,
        @Option(names = {"-i", "--item-name"}, paramLabel = "<item_name>") String itemName,
        @Option(names = {"-t", "--start-time"}, paramLabel = "<start_time>", description = "4-digit number representing 24-hr time") String startTime,
        @Option(names = {"-T", "--end-time"}, paramLabel = "<end_time>", description = "4-digit number representing 24-hr time") String endTime
    ) {
        // TODO: implement search store logic
    }

}
