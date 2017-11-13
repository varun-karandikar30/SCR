package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DataDao;


public class Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("In Controller ");

        response.setContentType("application/json");
        try {
            String term = request.getParameter("term");
            System.out.println("Data from ajax call " + term);

            DataDao dataDao = new DataDao();
            ArrayList<String> list = dataDao.getFrameWork(term);
            System.out.println("list Values:" + list);
            String searchList = new Gson().toJson(list);
            response.getWriter().write(searchList);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
