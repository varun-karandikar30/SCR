package model;

import dao.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DataDao {
    private Connection con;

    public DataDao() throws Exception {
        con = DBConn.connect();
    }

    public ArrayList<String> getFrameWork(String frameWork) 
    {
        ArrayList<String> list = new ArrayList<String>();
        PreparedStatement ps = null;
        String data;
        try {
            ps = con.prepareStatement("select * from register where name like ?");
            ps.setString(1, (frameWork + "%"));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                data = rs.getString(1);
                list.add(data);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
}
