/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Vasques
 */
public class cn {
     private Connection con;
    
    public cn() throws ClassNotFoundException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exame2", "root", "");
        } 
        catch (SQLException e) {
            System.err.println("Error: " + e);
        }
    }
    
    public Connection getCon() {
        return con;
    }
}
