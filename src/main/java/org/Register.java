/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.DBConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
        resp.sendRedirect("index.jsp");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        Connection con=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Driver Loaded");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "TIGER");
            System.out.println("Connected");
            String username = request.getParameter("username");
            String category = request.getParameter("optionsRadios");
            String mail = request.getParameter("mail");  
            String password = request.getParameter("password");
            pst = con.prepareStatement("Insert into register values(?,?,?,?)");
            pst.setString(1, username);
            pst.setString(2, category);
            pst.setString(3, mail);
            pst.setString(4, password);
            int i = pst.executeUpdate();
            
            if(category.equals("student"))
            {
                pst = con.prepareStatement("insert into studentinfo values(?,null,null,null,null,null,null,null,null,null,null,null)");
                pst.setString(1, mail);
                i = pst.executeUpdate();
                pst = con.prepareStatement("Insert into photo values(?,null)");
                pst.setString(1, mail);
                i = pst.executeUpdate();
            }
            else
            {
                pst = con.prepareStatement("insert into companyinfo values(?,null,null,null,null,null,null,null,null,null,null)");
                pst.setString(1, username);
                i = pst.executeUpdate();
                pst = con.prepareStatement("Insert into photo values(?,null)");
                pst.setString(1, username);
                i = pst.executeUpdate();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        catch(ClassNotFoundException e)
        {
             System.out.println(e);
        }
        response.sendRedirect("index.jsp");
}
}

