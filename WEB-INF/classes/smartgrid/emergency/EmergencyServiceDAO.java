package smartgrid.emergency;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EmergencyServiceDAO {
    private static Connection con;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/smartgrid", "root", "root");
        } catch ( Exception ex ) {
            ex.printStackTrace();
        }
    }

    public static ArrayList<EmergencySingleService> getAllServices(String type) {
        ArrayList<EmergencySingleService> data = new ArrayList<EmergencySingleService>();

        try {
            String query = "SELECT * FROM emergency_services WHERE type LIKE ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString( 1, type );
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) {
                data.add( 
                    new EmergencySingleService(
                        rs.getInt( "id" ), 
                        rs.getString( "name" ),
                        rs.getString( "contact_number" ),
                        rs.getString( "description" ),
                        rs.getInt( "response_time" ),
                        rs.getString( "type" )
                    ) 
                );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return data;
    }
    
    public static EmergencySingleService getSingleService( int id ) {
        EmergencySingleService service = null;
        try {
            String query = "SELECT * FROM emergency_services WHERE id = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt( 1, id );
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) { 
                    service = new EmergencySingleService(
                        rs.getInt( "id" ), 
                        rs.getString( "name" ),
                        rs.getString( "contact_number" ),
                        rs.getString( "description" ),
                        rs.getInt( "response_time" ),
                        rs.getString( "type" )
                    );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return service;
    }

    public static ArrayList<EmergencyServiceType> getServiceTypes() {
        ArrayList<EmergencyServiceType> data = new ArrayList<EmergencyServiceType>();

        try {
            String query = "SELECT * FROM emergency_services_type;";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) {
                data.add( 
                    new EmergencyServiceType(
                        rs.getString( "name" ),
                        rs.getString( "description" )
                    ) 
                );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return data;
    }


}
