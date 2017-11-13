import model.NTable;
import model.NTable1;
import model.SCR;
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

public class Dash extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //doGet(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String name = null;
        String eno = null;
        String branch = null;
        String sem = null;
        String gpa = null;
        String no = null;
        String address = null;
        String city = null;
        String country = null;
        String skills = null;
        String abtme = null;
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
        try{
            if(!session.getAttribute("countS").equals(null))
            countS = (Integer) session.getAttribute("countS");
        }
        catch(NullPointerException e)
        {
            countS = 0;
        }
        ArrayList<String> notif = new ArrayList<String>();
        ArrayList<NTable> nTable = new ArrayList<NTable>();
        ArrayList<NTable1> nTable1 = new ArrayList<NTable1>();
        ArrayList<SCR> sTable = new ArrayList<SCR>();
        ArrayList<SCR> rTable = new ArrayList<SCR>();
        try {
            Connection con = DBConn.connect();
            String query = "select count(name) from register where category='student'";
            String query1 = "select count(name) from register where category!='student'";
            String query2 = "select name from register where email=?";
            
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
            pst.setString(1, email);
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                name = rs.getString(1);
                System.out.println("Name = "+name);
            }
            if(countS!=0)
            {
                String query5 = "update studentinfo set count=? where email=?";
                pst = con.prepareStatement(query5);
                pst.setInt(1, countS);
                pst.setString(2, email);
                int i = pst.executeUpdate();
            }
            
            String query3 = "select * from studentinfo where email=?";
            pst = con.prepareStatement(query3);
            pst.setString(1, email);
            rs = pst.executeQuery();
            while(rs.next())
            {
                sem = rs.getString(2);
                gpa = rs.getString(3);
                no = rs.getString(4);
                address = rs.getString(5);
                city = rs.getString(6);
                country = rs.getString(7);
                branch = rs.getString(8);
                skills = rs.getString(9);
                abtme = rs.getString(10);
                eno = rs.getString(11);
                countS = rs.getInt(12);
                //System.out.println("countS "+countS);
            }
            
            String query4 = "select ndesc,doj,comname from notify order by upper(comname) desc";
            pst = con.prepareStatement(query4);
            rs = pst.executeQuery();
            while(rs.next())
            {
                notif.add(rs.getString(1));
                //System.out.println(rs.getString(1));
            }
            String query5 = "select comname,doj,dline from notify order by upper(comname) desc";
            pst = con.prepareStatement(query5);
            rs = pst.executeQuery();
            while(rs.next())
            {
                NTable table = new NTable(rs.getString(1), rs.getDate(2), rs.getDate(3));
                nTable.add(table);
                //System.out.println(rs.getString(1));
            }
            String query6 = "select name,vacancy,pack from companyinfo";
            pst = con.prepareStatement(query6);
            rs = pst.executeQuery();
            while(rs.next())
            {
                NTable1 table1 = new NTable1(rs.getString(1), rs.getString(2), rs.getString(3));
                nTable1.add(table1);
            }
            String query7 = "select * from scr where email=? order by upper(cname) desc";
            pst = con.prepareStatement(query7);
            pst.setString(1, email);
            rs = pst.executeQuery();
            while(rs.next())
            {
                SCR scr = new SCR(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                sTable.add(scr);
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
            String query10 = "select * from scr where email=? and status!='Unavailable' order by upper(cname) desc";
            pst = con.prepareStatement(query10);
            pst.setString(1, email);
            rs = pst.executeQuery();
            while(rs.next())
            {
                SCR scr = new SCR(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                rTable.add(scr);
            }
            count1 = notif.size();
            session.setAttribute("category", "Student");
            session.setAttribute("stuCount", stuCount);
            session.setAttribute("comCount", comCount);
            session.setAttribute("eno", eno);
            session.setAttribute("branch", branch);
            session.setAttribute("name", name);
            session.setAttribute("address",address);
            session.setAttribute("city",city);
            session.setAttribute("country",country);
            session.setAttribute("no",no);
            session.setAttribute("sem",sem);
            session.setAttribute("gpa",gpa);
            session.setAttribute("skills",skills);
            session.setAttribute("abtme",abtme);
            session.setAttribute("notif",notif);
            session.setAttribute("nTable", nTable);
            session.setAttribute("nTable1", nTable1);
            session.setAttribute("sTable", sTable);
            session.setAttribute("rTable", rTable);
            session.setAttribute("count1", count1);
            session.setAttribute("countS", countS);
            session.setAttribute("label1", label1);
            session.setAttribute("series1", series1);
            session.setAttribute("maxNos", maxNos);
            session.setAttribute("label2", label2);
            session.setAttribute("series2", series2);
            session.setAttribute("maxNos2", maxNos2);
            con.close();
            DBConn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("examples/dashboard.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}