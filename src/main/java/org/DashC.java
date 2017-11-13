import dao.DBConn;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.StName;

public class DashC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = null;
        String name = (String) session.getAttribute("name");
        String cid = null;
        String tbranch = null;
        String no = null;
        String address = null;
        String city = null;
        String country = null;
        String abtme = null;
        String vacancy = null;
        String cname = null;
        String pack = null;
        String label1 = "";
        String series1 = "";
        String label2 = "";
        String series2 = "";
        int stuCount=0;
        int comCount=0;
        int count1=0;
        int countS=0;
        int maxNos=0;
        int maxNos2=0;
        ArrayList<StName> stname = new ArrayList<StName>();
        try{
            if(!session.getAttribute("countS").equals(null))
            countS = (Integer) session.getAttribute("countS");
        }
        catch(NullPointerException e)
        {
            countS = 0;
        }
        
        try {
            Connection con = DBConn.connect();
            String query = "select count(name) from register where category='student'";
            String query1 = "select count(name) from register where category!='student'";
            String query2 = "select email from register where name=?";
            
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            
            if(rs.next())
            {
                stuCount = rs.getInt(1);
                //System.out.println("C Count = "+stuCount);
            }
            
            pst = con.prepareStatement(query1);
            rs = pst.executeQuery();
            if(rs.next())
            {
                comCount = rs.getInt(1);
                //System.out.println("s Count = "+comCount);
            }
            pst = con.prepareStatement(query2);
            pst.setString(1, name);
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                email = rs.getString(1);
                System.out.println("Email = "+email);
            }
            if(countS!=0)
            {
                String query5 = "update companyinfo set count=? where name=?";
                pst = con.prepareStatement(query5);
                pst.setInt(1, countS);
                pst.setString(2, name);
                int i = pst.executeUpdate();
            }
            String query3 = "select * from companyinfo where name=?";
            pst = con.prepareStatement(query3);
            pst.setString(1, name);
            rs = pst.executeQuery();
            while(rs.next())
            {
                cid = rs.getString(2);
                address = rs.getString(3);
                no = rs.getString(4);
                vacancy = rs.getString(5);
                city = rs.getString(6);
                country = rs.getString(7);
                cname = rs.getString(8);
                abtme = rs.getString(9);
                pack = rs.getString(10);
                tbranch = rs.getString(11);
                countS = rs.getInt(12);
            }
            
            String query8 = "select * from placed";
            pst = con.prepareStatement(query8);
            rs = pst.executeQuery();
            while(rs.next())
            {
               label1 = label1 + rs.getInt(1) + " ";
               series1 = series1 + rs.getInt(2) + " "; 
               if(rs.getInt(2) > maxNos)
               {
                   maxNos = rs.getInt(2);
               }
            }
            String query9 = "select * from cyear";
            pst = con.prepareStatement(query9);
            rs = pst.executeQuery();
            while(rs.next())
            {
               label2 = label2 + rs.getInt(1) + " ";
               series2 = series2 + rs.getInt(2) + " "; 
               if(rs.getInt(2) > maxNos2)
               {
                   maxNos2 = rs.getInt(2);
               }
            }
            String query10 = "select name,cgpa,branch,r.email from register r,studentinfo s where r.email=s.email and r.email in (select email from scr where cname=? and apply='Applied' and status='Unavailable') order by name";
            pst = con.prepareStatement(query10);
            pst.setString(1, name);
            rs = pst.executeQuery();
            while(rs.next())
            {
                StName stn = new StName(rs.getString(1), rs.getDouble(2), rs.getString(3),rs.getString(4));
                stname.add(stn);
            }
            
            String query11 = "select count(email) from scr where cname=? and apply='Applied'";
            pst = con.prepareStatement(query11);
            pst.setString(1, name);
            rs = pst.executeQuery();
            while(rs.next())
            {
                count1 = rs.getInt(1);
                System.out.println("Count1 = "+count1);
            }
            session.setAttribute("category", "CEO/CO-FOUNDER");
            session.setAttribute("stuCount", stuCount);
            session.setAttribute("comCount", comCount);
            session.setAttribute("tbranch", tbranch);
            session.setAttribute("address",address);
            session.setAttribute("city",city);
            session.setAttribute("cname",cname);
            session.setAttribute("country",country);
            session.setAttribute("vacancy",vacancy);
            session.setAttribute("cid",cid);
            session.setAttribute("pack",pack);
            session.setAttribute("no",no);
            session.setAttribute("email",email);
            session.setAttribute("abtme",abtme);
            session.setAttribute("label1", label1);
            session.setAttribute("series1", series1);
            session.setAttribute("maxNos", maxNos);
            session.setAttribute("label2", label2);
            session.setAttribute("series2", series2);
            session.setAttribute("maxNos2", maxNos2);
            session.setAttribute("stname", stname);
            session.setAttribute("count1", count1);
            session.setAttribute("countS", countS);
            con.close();
            DBConn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("examples/dashC.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
