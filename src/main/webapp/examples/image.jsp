<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%@page import="dao.DBConn"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    System.out.println("image.jsp is here");
    OutputStream pout = null;
    String id = (request.getParameter("imgid"));
    System.out.println("is retrieved is: "+id);
    try{
    Connection con = DBConn.connect();
    String query = "select img from photo where email=?";
    PreparedStatement pst = con.prepareStatement(query);
    pst.setString(1,id);
    ResultSet rs = pst.executeQuery();
    while(rs.next())
    {
        byte[] imgBytes = rs.getBytes(1);
        response.setContentType("image/jpeg");
        BufferedInputStream  input = new BufferedInputStream(new ByteArrayInputStream(imgBytes));
        BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream());
        byte[] buffer = new byte[imgBytes.length];
        int length = 0;
        while ((length = input.read(buffer)) > 0) {
        output.write(buffer, 0, length);
     }
     System.out.println("\nWorked!!");
    }
    con.close();
    DBConn.close();
  }
  catch (Exception e)
  {
    e.printStackTrace();
  }
//          Blob obj = rs.getBlob(1);
//      InputStream readImg = obj.getBinaryStream(0,obj.length());
//      byte [] rb = new byte[obj.length()];
//      int index = readImg.read(rb, 1, (int) obj.length());
//      response.reset();
//      System.out.println("Image == ");
//      for(int i=0;i<rb.length;i++)
//      {
//          System.out.print(rb[i]);
//        response.setContentLength(obj.length());
//      response.getOutputStream().write(rb);
//      response.getOutputStream().flush();
%>