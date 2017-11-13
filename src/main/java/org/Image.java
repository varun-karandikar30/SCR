import dao.DBConn;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177215)
public class Image extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
        String email = (String) session.getAttribute("email");
        boolean student = true;
        Part filePart = request.getPart("image");
        InputStream image = null;
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            //obtains input stream of the upload file
            //the InputStream will point to a stream that contains
            //the contents of the file
            image = filePart.getInputStream();
        }
        try {
            Connection con = DBConn.connect();
            String query1= "select category from register where email=?";
            PreparedStatement pst = con.prepareStatement(query1);
            pst.setString(1,email);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                if(rs.getString(1).equals("company"))
                {
                    email = (String) session.getAttribute("name");
                    student = false;
                }
            }
            String query= "update photo set img=? where email=?";
            pst = con.prepareStatement(query);
            pst.setString(2,email);
            pst.setBinaryStream(1,image);
            int i = pst.executeUpdate();
            con.close();
            DBConn.close();
        }catch (SQLException ex) {
            System.out.println("SQL " + ex);
        }
        if(student)
        response.sendRedirect("examples/user.jsp");
        else
        response.sendRedirect("examples/userC.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
