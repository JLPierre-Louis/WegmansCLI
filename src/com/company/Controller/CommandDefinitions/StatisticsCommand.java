package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.User;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.ParentCommand;

@Command(name = "statistics", aliases = "stats", description = "get statistics about how wegmans2 is doing")
public class StatisticsCommand implements Runnable{

    @ParentCommand
    private CommandService parent;
    User user;

    public StatisticsCommand(User user) {
        this.user = user;
    }

    @Command(name = "customer-mvp", description = "gets the customer who has spent the most money")
    void getCustomerMVP(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help)
    {

    }

    @Command(name = "top3", description = "get first 3 best items sold")
    void top3(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"-s", "--store"}, defaultValue = "", description = "the store id of the store you want to see the best/worst items") String storeId)
    {

    }

     @Command(name = "bot3", description = "get first 3 worst items sold")
    void bot3(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"-s", "--store"}, defaultValue = "", description = "the store id of the store you want to see the best/worst items") String storeId)
    {

    }





    @Override
    public void run() {
    }
}
