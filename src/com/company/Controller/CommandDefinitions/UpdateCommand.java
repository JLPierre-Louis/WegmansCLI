package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.Admin;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.ParentCommand;

@Command(name = "update", description = "update certain aspects of the database")
public class UpdateCommand implements Runnable{

    @ParentCommand
    private CommandService parent;
    Admin admin;

    public UpdateCommand(Admin admin) {
        this.admin = admin;
    }

    @Command(name = "add-customer", description = "add a customer to the database")
    void addUser(
        @Option(names = {"-h", "--help"}, usageHelp = true) boolean help,
        @Parameters(index = "1", paramLabel = "<lastname>", description = "the last name of the user you want to add") String lastname,
        @Parameters(index = "0", paramLabel = "<firstname>", description = "the first name of the user you want to add") String firstname,
        @Parameters(index = "2", paramLabel = "<phonenumber>", description = "the 10-digit phone number of the user you want to add") String phonenumber)
    {
        admin.addCustomer(phonenumber, firstname, lastname);
    }
    @Command(name = "remove-customer", description = "remove a customer to the database")
    void removeUser(
        @Option(names = {"-h", "--help"}) boolean help,
        @Parameters(index = "0", paramLabel = "<phonenumber>") String phonenumber)
    {
        admin.removeCustomer(phonenumber);
    }

    @Override
    public void run() {

    }
}
