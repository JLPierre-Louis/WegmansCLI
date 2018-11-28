package com.company.Controller;
import java.io.*;
import java.sql.*;
import java.util.*;

public class SQLConnection {

    private static final String URL = "jdbc:postgresql://reddwarf.cs.rit.edu:5432/?currentSchema=wegmans2";
    private static final String USERNAME = "jaf9897";
    private static final String PASSWORD = "wegmans2";


    public Connection connectToDB(String schemaName) throws SQLException {


        // This code creates the URL on boot using the password file, will be good for different roles.
        /*
        // Read the password file in the running directory, connects to jaf9897 database.
        String passFile = null;
        try {
            passFile = new Scanner(new File("pass.pgpass")).useDelimiter("\\Z").next();
        } catch (FileNotFoundException e) {
            System.err.println("Password file not found.");
            System.exit(1);
        }
        // Create the url and login info from the password file
        String parts[] = passFile.split(":");
        String host = parts[0];
        String port = parts[1];
        String username = parts[2];
        String password = parts[4];

        String url = "jdbc:postgresql://" + host + ":" + port;
        if (schemaName != null) {
            url += "/?currentSchema=" + schemaName;
        }
        return DriverManager.getConnection(url, username, password);

        */
        //This runs it directly
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    /**
     * Connect to the database and run the query
     * @param sql the SQL query
     * @return a ResultSet that should be parsed by the corresponding Model Tier object
     * @throws SQLException
     */
    public static ResultSet wegmansQuery(String sql) throws SQLException {
        Connection database = DriverManager.getConnection(URL, USERNAME, PASSWORD);
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

    public static void main(String[] args) {
        SQLConnection con = new SQLConnection();
        Connection db = null;
        ResultSetMetaData rsmd = null;

        try {
            db = con.connectToDB("wegmans2");
            ResultSet rs = wegmansQuery("SELECT * FROM product");
            rsmd = rs.getMetaData();

            int columnsNumber = rsmd.getColumnCount();
            while (rs.next()) {
                for (int i = 1; i <= columnsNumber; i++) {
                    if (i > 1) System.out.print(",  ");
                    String columnValue = rs.getString(i);
                    System.out.print(columnValue + " " + rsmd.getColumnName(i));
                }
                System.out.println("");
            }
        } catch (SQLException e){
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
