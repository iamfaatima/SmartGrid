package smartgrid.authentication;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
    private static Connection con;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/smartgrid", "root", "root");
        } catch ( Exception ex ) {
            ex.printStackTrace();
        }
    }

    public static User getUser( int id )
    {
        User user = null;

        try 
        {
            String query = "SELECT * FROM users WHERE id = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt( 1, id );
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) 
            {
                user = new User( rs.getString( "id" ), rs.getString("name"),rs.getString("email"), rs.getString("password"), rs.getString("gender"), rs.getString("phone"), rs.getString("address") );
            }

        } 
        catch ( Exception ex ) 
        {
            ex.printStackTrace();
        }

        return user;
    }

    public static ArrayList<User> getUsers() 
    {
        ArrayList<User> data = new ArrayList<>();

        try 
        {
            String query = "SELECT * FROM users;";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) 
            {
                data.add( new User( rs.getString( "id" ), rs.getString("name"),rs.getString("email"), rs.getString("password"), rs.getString("gender"), rs.getString("phone"), rs.getString("address") ) );
            }

        } 
        catch ( Exception ex ) 
        {
            ex.printStackTrace();
        }

        return data;
    }

    public static User getUserProfile(String email) 
    {
        User us = null;
        try
        {
            String query = "SELECT * FROM users where email = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, email);

            ResultSet rs = statement.executeQuery();
            
            if(rs.next())
            {
                 us = new User(rs.getString("id"), rs.getString("name"), rs.getString("email"), rs.getString("password"), rs.getString("gender"), rs.getString("phone"), rs.getString("address"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return us;
    }

    public static Boolean deleteUser(String id) 
    {
        Boolean check = false;
        try
        {
            String query = "delete  FROM users where id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, id);

            int rs = statement.executeUpdate();
            
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

    public static Boolean changeUserDetails(User us) 
    {
        Boolean check = false;
        try
        {
            String query = "update users set name = ? , gender = ? , phone = ?, address = ? where id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, us.getName());
            statement.setString(2, us.getGender());
            statement.setString(3, us.getPhone());
            statement.setString(4, us.getAddress());
            statement.setString(5, us.getId());

            int rs = statement.executeUpdate();
            
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

    public static Boolean changeUserPassowrd(String id,String pass) 
    {
        Boolean check = false;
        try
        {
            String query = "update users set password = ? where id = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, pass);
            statement.setString(2, id);

            int rs = statement.executeUpdate();
            
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