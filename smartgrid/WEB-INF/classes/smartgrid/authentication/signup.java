package smartgrid.authentication;

import java.sql.*;
import java.util.ArrayList;


public class signup {
    private static Connection con;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/smartgrid", "root", "root");
        } catch ( Exception ex ) {
            ex.printStackTrace();
        }
    }

    public static Boolean register(User us)
    {
        Boolean check = false;
        try 
        {
            PreparedStatement pst=con.prepareStatement("insert into users(name,email,password,gender,phone,address) values(?, ?, ?, ?, ?, ? )");
            pst.setString(1, us.getName());
            pst.setString(2, us.getEmail());
            pst.setString(3, us.getPassword());
            pst.setString(4, us.getGender());
            pst.setString(5, us.getPhone());
            pst.setString(6, us.getAddress());
            int rs = pst.executeUpdate();

            if(rs > 0)
            {
                check = true;
            }
            else
            {
                check = false;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return check;
    }

}