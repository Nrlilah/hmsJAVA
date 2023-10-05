package com.hms.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hmsdb?allowPublicKeyRetrieval=true&useSSL=false", "root", "password");
        //return DriverManager.getConnection("jdbc:mysql://192.168.127.115:3306/hmsdb?useSSL=false", "root", "password");
    }
}