package com.Stortacco.modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataSource {

    private static DataSource ds = null;
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/stortacco";
    private static final String USER = "jerson";
    private static final String PASS = "jerson123";

    private DataSource() {

    }

    public static DataSource getInstace() {
        if (ds == null) {
            ds = new DataSource();
        }
        return ds;
    }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to database...");
            conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (Exception e) {
            try {
                conn.close();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }
        return conn;
    }
}
