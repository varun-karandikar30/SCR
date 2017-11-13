import dao.DBConn;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StRemove extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String semail = request.getParameter("semail");
        String name = (String) session.getAttribute("name");
        System.out.println("Email = "+semail);
        try {
            Connection con = DBConn.connect();
            String query = "update scr set status='Not Selected' where email=? and cname=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, semail);
            pst.setString(2, name);
            int i = pst.executeUpdate();
            
            con.close();
            DBConn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("DashC");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
