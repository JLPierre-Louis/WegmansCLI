package com.company;

import com.company.Controller.WegmansCLI;
import java.util.concurrent.Callable;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Help;
import picocli.CommandLine.Help.Visibility;
import picocli.CommandLine.Parameters;

@Command(name = "run", hidden = true)
public class Main implements Callable<Void> {

    private static final String URL_TEMPLATE = "jdbc:postgresql://%s:%s/?currentSchema=%s";

    @Parameters(paramLabel = "<host>", index = "0", description = "the host that has postgres running")
    String host;
    @Parameters(paramLabel = "<port>", index = "1", showDefaultValue = Visibility.ALWAYS, defaultValue = "5432", description = "the port for postgress")
    String port;
    @Parameters(paramLabel = "<username>", index = "2", description = "the username with the permissions to access database")
    String username;
    @Parameters(paramLabel = "<password>", index = "3", description = "the password for that user")
    String password;
    @Parameters(paramLabel = "<schemaname>", index = "4", showDefaultValue = Visibility.ALWAYS, defaultValue = "wegmans2", description = "the schema name")
    String schema;

    public static void main(String[] args) {
        CommandLine.call(new Main(), args);
    }

    @Override
    public Void call() {
        String url = String.format(URL_TEMPLATE, host, port, schema);
        WegmansCLI main = new WegmansCLI(url, username, password);
        main.run();
        return null;
    }
}
