/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.postgretest;

import java.sql.*;

/**
 *
 * @author gatis.braucs
 */
public class TestPostGreConnect {

    private final String url = "jdbc:postgresql://10.2.89.43/reachdb";
    private final String user = "rsext";
    private final String password = "rs_#ext16d";
    private final String sql = "select * from rsext.notf_vlocity_responses where SOA_STATUS = 0";

    Statement stmt = null;
    ResultSet rs = null;
    
    /**
     * Connect to the PostgreSQL database
     *
     * @return a Connection object
     */
    public Connection connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
            
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            System.out.println("SQL executed successfully.");
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return conn;
    }

    public static void main(String[] args) {
        TestPostGreConnect app = new TestPostGreConnect();
        app.connect();

    }

}
