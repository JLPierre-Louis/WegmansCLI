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
    Admin admin;

    public StatisticsCommand(Admin admin) {
        this.admin = admin;
    }

    @Command(name = "customer-mvp", description = "gets the customer who has spent the most money")
    void getCustomerMVP(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help)
    {
        admin.getCustomerMVP();
    }

    @Command(name = "store-sales", description = "gets the customer who has spent the most money")
    void storeSales(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"-s", "--state"}, defaultValue = "", paramLabel = "<state_abbr>", description = "narrow sales search to a specific state") String state,
        @Option(names = {"--rank"}, required = true, paramLabel = "TOP|BOT", defaultValue = "TOP", description = "display top or bottom store in sales")
            String rank)
    {
        if(!state.isEmpty()) {
            if (rank.equals("BOT"))
                admin.getBestAndWorstStoreSalesbyState(false, state);
            else if (rank.equals("TOP"))
                admin.getBestAndWorstStoreSalesbyState(true, state);
            else
                System.out.println("Please enter \"TOP\" or \"BOT\" for --rank");
        } else {
            if (rank.equals("BOT"))
                admin.getBestAndWorstStoreSales(false);
            else if (rank.equals("TOP"))
                admin.getBestAndWorstStoreSales(true);
            else
                System.out.println("Please enter \"TOP\" or \"BOT\" for --rank");
        }
    }

    @Command(name = "item-sales", description = "get first 3 best or worst items sold")
    void itemSales(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Option(names = {"-a", "--all"}, defaultValue = "false", description = "search all store's best/worst items") boolean all,
        @Option(names = {"--rank"}, required = true, paramLabel = "TOP|BOT", defaultValue = "TOP", description = "either display the top or bottom three items") String rank)
    {
        boolean desc = true;
        if(rank.equals("BOT"))
            desc = false;

        if(all) {
            admin.getItemsRanked(desc);
        } else {
            if(!admin.checkStoreSet()) {
                System.out.print(" Or use \"--all\" to show products across all stores");
                return;
            }
            admin.getItemsByStoreRanked(desc);

        }

    }

    @Override
    public void run() {
    }
}
