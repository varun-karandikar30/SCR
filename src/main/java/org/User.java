import dao.DBConn;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class User extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String eno = request.getParameter("eno");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String no = request.getParameter("no");
        String sem = request.getParameter("sem");
        String gpa = request.getParameter("gpa");
        String branch = request.getParameter("branch");
        String skills = request.getParameter("skills");
        String npass = request.getParameter("npass");
        String cpass = request.getParameter("cpass");
        String abtme = request.getParameter("abtme");
        String pass = request.getParameter("pass");
        try {
            Connection con = DBConn.connect();
            String query = "update studentinfo set sem=?,cgpa=?,phone=?,address=?,city=?,country=?,branch=?,skills=?,abtme=?,eno=? where email=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, Integer.parseInt(sem));
            pst.setDouble(2, Double.parseDouble(gpa));
            pst.setString(3, no);
            pst.setString(4, address);
            pst.setString(5, city);
            pst.setString(6, country);
            pst.setString(7, branch);
            pst.setString(8, skills);
            pst.setString(9, abtme);
            pst.setString(10, eno);
            pst.setString(11, email);
            int i = pst.executeUpdate();
            
            if(npass.length()!=0 && npass.equals(cpass) && !npass.equals(pass))
            {
                String query1 = "update register set pass=? where email=?";
                pst = con.prepareStatement(query1);
                pst.setString(1, npass);
                pst.setString(2, email);
                i = pst.executeUpdate();
                System.out.println("Password Changed");
            }
            String query2 = "select name from register where category='company' and name not in(select cname from scr where email=?)";
            pst = con.prepareStatement(query2);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            System.out.println("Companies came");
            while(rs.next())
            {
                String query3 = "insert into scr values(?,?,default,default)";
                pst = con.prepareStatement(query3);
                pst.setString(1, email);
                pst.setString(2, rs.getString(1));
                i = pst.executeUpdate();
                System.out.println("Value = "+i);
            }
            con.close();
            DBConn.close();
        } catch (SQLException ex) {
            System.out.println("SQL exception "+ex);
        }
        session.setAttribute("eno",eno);
        session.setAttribute("address",address);
        session.setAttribute("city",city);
        session.setAttribute("country",country);
        session.setAttribute("no",no);
        session.setAttribute("branch",branch);
        session.setAttribute("sem",sem);
        session.setAttribute("gpa",gpa);
        session.setAttribute("skills",skills);
        session.setAttribute("abtme",abtme);
        response.sendRedirect("examples/user.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
