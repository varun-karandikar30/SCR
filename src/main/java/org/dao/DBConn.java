package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConn {
        public static Connection con=null;
        public static Connection connect() {
        try 
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Driver Loaded");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "TIGER");
            System.out.println("Connected");
        } 
        catch (SQLException e) 
        {
            System.out.println(e);
        } catch (ClassNotFoundException e) 
        {
            System.out.println(e);
        }
        return con;
    }
        public static void close(){
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBConn.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
}
