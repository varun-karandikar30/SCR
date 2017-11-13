
import dao.DBConn;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginC extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.sendRedirect("index.html");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String name = request.getParameter("loginname");
            String pass = request.getParameter("loginpass");
            try {
            Connection con = DBConn.connect();
            String query = "select pass from register where name=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,name);
            ResultSet rs = pst.executeQuery();
            rs.next();
            if(rs.getString(1).equals(pass))
            {
                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                session.setAttribute("pass", pass);
                response.sendRedirect("DashC");
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
            con.close();
            DBConn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
