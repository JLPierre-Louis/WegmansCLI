package com.company.Controller.CommandDefinitions;

import com.company.Controller.CommandService;
import com.company.Model.User;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.ParentCommand;

@Command(name = "browse", description = "allows the user to browse wegmans inventory")
public class BrowseCommand implements Runnable{

    @ParentCommand
    private CommandService parent;
    private User user;

    public BrowseCommand(User user){
        this.user = user;
    }

    @Option(names = {"-n", "--name"}, defaultValue = "", description = "search a product by name")
    String name;

    //TODO: implement the rest of the commands

    /**
     * Note these can be run by all users
     */
    @Override
    public void run() {
        if (!name.isEmpty()) {
            user.queryProductByName(name);
        }
    }
}
