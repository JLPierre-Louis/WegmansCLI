package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.Admin;
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
        if(!(user instanceof Admin)) return;
        Admin admin =  (Admin)user;
        admin.getCustomerMVP();
    }

    @Command(name = "store-sales", description = "gets the customer who has spent the most money")
    void storeSales(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"--rank"}, required = true, paramLabel = "TOP|BOT", defaultValue = "TOP", description = "display top or bottom store in sales")
            String rank)
    {
        if(!(user instanceof Admin)) return;
        Admin admin =  (Admin)user;

            if(rank.equals("TOP"))
                admin.getBestAndWorstStoreSales(false);
            else if (rank.equals("BOT"))
                admin.getBestAndWorstStoreSales(true);
            else
                System.out.println("Please enter \"TOP\" or \"BOT\" for --rank");
    }

    @Command(name = "item-sales", description = "get first 3 best or worst items sold")
    void itemSales(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"-a", "--all"}, defaultValue = "", description = "searh all store's best/worst items") boolean all,
        @Option(names = {"--rank"}, required = true, defaultValue = "TOP", description = "either \"TOP\" or \"BOT\"") String rank)
    {
        if(!(user instanceof Admin)) return;
        Admin admin = (Admin)user;
        boolean desc = false;
        if(rank.equals("BOT"))
            desc = true;

        if(all) {
            admin.getItemsRanked(desc);
        } else {
            admin.getItemsByStoreRanked(desc);

        }

    }

    @Override
    public void run() {
    }
}
