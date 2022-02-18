package smartgrid.authentication;

import java.sql.*;
import java.util.ArrayList;

public class login {
    private static Connection con;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/smartgrid", "root", "root");
        } catch ( Exception ex ) {
            ex.printStackTrace();
        }
    }

    public static int checkRegistration(String email, String password)
    {
        Boolean check = false;
        try 
        {
            PreparedStatement pst=con.prepareStatement("Select id from users where email like ? and password like ?;");
            pst.setString(1, email);
            pst.setString(2, password);

            System.out.print( pst );
            
            ResultSet rs = pst.executeQuery();

            if(rs.next())
            {
                return rs.getInt( "id" );
            }
            else
            {
                return -1;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return -1;
    }

}