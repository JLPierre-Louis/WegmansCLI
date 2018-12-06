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

    @Command(name = "store-sales", description = "gets the customer who has spent the most money")
    void storeSales(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"--rank"}, required = true, description = "either \"TOP\" or \"BOT\"") String rank)
    {

    }

    @Command(name = "item-sales", description = "get first 3 best or worst items sold")
    void itemSales(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"-s", "--store"}, defaultValue = "", description = "the store id of the store you want to see the best/worst items") String storeId,
        @Option(names = {"--rank"}, required = true, description = "either \"TOP\" or \"BOT\"") String rank)
    {

    }





    @Override
    public void run() {
    }
}
