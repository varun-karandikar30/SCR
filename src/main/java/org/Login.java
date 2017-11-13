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

public class Login extends HttpServlet {

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
        
            String email = request.getParameter("loginmail");
            String pass = request.getParameter("loginpass");
            try {
            Connection con = DBConn.connect();
            String query = "select pass from register where email=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,email);
            ResultSet rs = pst.executeQuery();
            
            if(rs.next() && rs.getString(1).equals(pass))
            {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("pass", pass);
                response.sendRedirect("Dash");
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
