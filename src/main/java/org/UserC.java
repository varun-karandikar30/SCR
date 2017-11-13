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

public class UserC extends HttpServlet {

    
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
            throws ServletException, IOException 
    {
        String name = request.getParameter("name");
        String cid = request.getParameter("cid");
        String tbranch = request.getParameter("tbranch");
        String pass = request.getParameter("opass");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String no = request.getParameter("no");
        String vacancy = request.getParameter("vacancy");
        String cname = request.getParameter("cname");
        String pack = request.getParameter("pack");
        String abtme = request.getParameter("abtme");
        String npass = request.getParameter("npass");
        String cpass = request.getParameter("cpass");
        int x = 14;
        try {
            Connection con = DBConn.connect();
            String query = "update companyinfo set cid=?,address=?,no=?,vacancy=?,city=?,country=?,cname=?,abtme=?,pack=?,tbranch=? where name=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,cid);
            pst.setString(2,address);
            pst.setString(3,no);
            pst.setString(4,vacancy);
            pst.setString(5,city);
            pst.setString(6,country);
            pst.setString(7,cname);
            pst.setString(8,abtme);
            pst.setString(9,pack);
            pst.setString(10,tbranch);
            pst.setString(11,name);
            int i = pst.executeUpdate();
            
            if(npass.length()!=0 && npass.equals(cpass) && !npass.equals(pass))
            {
                String query1 = "update register set pass=? where name=?";
                pst = con.prepareStatement(query1);
                pst.setString(1, npass);
                pst.setString(2, name);
                i = pst.executeUpdate();
                System.out.println("Password Changed " + i);
            }
            String ndesc = name+" : Registrations now open.";
            
            String query3 = "select * from notify where comname=?";
            pst = con.prepareStatement(query3);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();
            if(!rs.next())
            {
                String query2 = "insert into notify values (?,sysdate,sysdate+" + x + ",?)";
                pst = con.prepareStatement(query2);
                pst.setString(1, name);
                pst.setString(2, ndesc);
                i = pst.executeUpdate();
                System.out.println("Company notify " + i);
            }
            //String query4 = "select distinct r.email from register r,scr s where category='student' and r.email not in s.email";
            String query4 = "select email from register where category='student' and email not in (select email from scr where cname=?)";
            pst = con.prepareStatement(query4);
            pst.setString(1,name);
            rs = pst.executeQuery();
            System.out.println("Join Works");
            while(rs.next())
            {
                String query5 = "insert into scr values(?,?,default,default)";
                pst = con.prepareStatement(query5);
                pst.setString(1,rs.getString(1));
                pst.setString(2,name);
                i = pst.executeUpdate();
                System.out.println("Value = "+i);
            }
            con.close();
            DBConn.close();
        } catch (SQLException ex) {
            System.out.println("SQL exception " + ex);
        }
        HttpSession session = request.getSession();
        session.setAttribute("cid",cid);
        session.setAttribute("address",address);
        session.setAttribute("city",city);
        session.setAttribute("country",country);
        session.setAttribute("no",no);
        session.setAttribute("vacancy",vacancy);
        session.setAttribute("pack",pack);
        session.setAttribute("cname",cname);
        session.setAttribute("tbranch",tbranch);
        session.setAttribute("abtme",abtme);
        response.sendRedirect("examples/userC.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
