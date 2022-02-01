package database;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MSConnection 
{
    public Connection Connection()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e) {
            {Logger.getLogger(MSConnection.class.getName()).log(Level.SEVERE, null, e);}
        }   
        try {
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/electronics","root","root");
            return con;
        } catch ( SQLException ex) {Logger.getLogger(MSConnection.class.getName()).log(Level.SEVERE, null, ex);}
        return null;
    }
   
}