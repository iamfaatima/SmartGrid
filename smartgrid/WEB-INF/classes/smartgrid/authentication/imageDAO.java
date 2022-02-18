package smartgrid.authentication;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import smartgrid.authentication.image;

public class imageDAO {
    //private static Connection con;

    // static {
    //     try {
    //         Class.forName("com.mysql.jdbc.Driver");
    //         con = DriverManager.getConnection("jdbc:mysql://localhost/smartgrid", "root", "root");
    //     } catch ( Exception ex ) {
    //         ex.printStackTrace();
    //     }
    // }
    public static Boolean deleteImage(String id,String email)
    {
         
        Boolean check = false;
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/smartgrid", "root", "root");
            PreparedStatement pst=con.prepareStatement("delete from imagetable where id = ? and email = ? ");
            pst.setString(1, id);
            pst.setString(2, email);
            

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



    public static Boolean insertImage(image img)
    {
        Boolean check = false;
         deleteImage(img.getId(), img.getEmail());
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/smartgrid", "root", "root");
            PreparedStatement pst=con.prepareStatement("insert into imagetable(imagetitle,id,email) values(?, ?, ?)");
            pst.setString(1, img.getTitle());
            pst.setString(2, img.getId());
            pst.setString(3, img.getEmail());

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



    public static String getImageName(String id,String email)
    {
        String image_title = null; 
        Boolean check = false;
        
        
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/smartgrid", "root", "root");
            PreparedStatement pst=con.prepareStatement("select imagetitle from imagetable where id = ? and email = ? ");
            pst.setString(1, id);
            pst.setString(2, email);
            

            ResultSet rs = pst.executeQuery();

            
            if(rs.next())
            {
               image_title = rs.getString("imagetitle");
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return image_title;
    }
}