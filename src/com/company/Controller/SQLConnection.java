package com.company.Controller;
import java.io.*;
import java.sql.*;
import java.util.*;

public class SQLConnection {

    public Connection connectToDB(String schemaName) throws SQLException {
        // Read the password file
        // should be ~/.pgpass and look like
        // localhost:8080:USERNAME:USERNAME:PASSWORD
        String homeDir = System.getProperty("user.dir");
        String content = null;
        try {
            content = new Scanner(new File(homeDir, ".pgpass")).useDelimiter("\\Z").next();
        } catch (FileNotFoundException e) {
            System.err.println("Password file not found.");
            System.exit(1);
        }
        String parts[] = content.split(":");
        String host = parts[0];
        String port = parts[1];
        String username = parts[2];
        String password = parts[4];

        String url = "jdbc:postgresql://" + host + ":" + port;
        if (schemaName != null) {
            url += "/?currentSchema=" + schemaName;
        }
        return DriverManager.getConnection(url, username, password);
    }

    public static ResultSet query(Connection database, String sql) throws SQLException {
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = database.createStatement();
            rs = stmt.executeQuery(sql);
            stmt.closeOnCompletion();
        } catch (SQLException e) {
            System.err.println("SQL Error:");
            e.printStackTrace();
        }
        return rs;
    }
}
