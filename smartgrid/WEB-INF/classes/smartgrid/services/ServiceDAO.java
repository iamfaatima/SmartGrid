package smartgrid.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ServiceDAO {
    private static Connection con;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/smartgrid", "root", "root");
        } catch ( Exception ex ) {
            ex.printStackTrace();
        }
    }

    public static ArrayList<ServiceType> getServiceTypes() {
        ArrayList<ServiceType> data = new ArrayList<ServiceType>();

        try {
            String query = "SELECT * FROM service_type;";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) {
                data.add( new ServiceType( rs.getString( "name" ) ) );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return data;
    }

    public static ArrayList<SingleService> getAllServices(String service_type) {
        ArrayList<SingleService> data = new ArrayList<SingleService>();

        try {
            String query = "SELECT * FROM services WHERE service_type LIKE ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString( 1, service_type );
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) {
                data.add( 
                    new SingleService(
                        rs.getInt( "id" ),
                        rs.getString( "name" ), 
                        rs.getInt( "user_id" ),
                        rs.getString( "description" ), 
                        rs.getInt( "rating" ),
                        rs.getFloat( "price" ),
                        rs.getString( "service_type" ),
                        rs.getString( "contact_number" )
                    ) 
                );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return data;
    }

    public static SingleService getSingleService(int id) {
        SingleService service = null;

        try {
            String query = "SELECT * FROM services WHERE id = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt( 1, id );
            ResultSet rs = statement.executeQuery();

            if ( rs.next() ) {
                service = new SingleService(
                    rs.getInt( "id" ),
                    rs.getString( "name" ), 
                    rs.getInt( "user_id" ),
                    rs.getString( "description" ), 
                    rs.getInt( "rating" ),
                    rs.getFloat( "price" ),
                    rs.getString( "service_type" ),
                    rs.getString( "contact_number" )
                );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return service;
    }

    public static ArrayList<SingleService> getUserServices(int id) {
        ArrayList<SingleService> data = new ArrayList<SingleService>();

        try {
            String query = "SELECT * FROM services WHERE user_id = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt( 1, id );
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) {
                data.add( 
                    new SingleService(
                        rs.getInt( "id" ),
                        rs.getString( "name" ), 
                        rs.getInt( "user_id" ),
                        rs.getString( "description" ), 
                        rs.getInt( "rating" ),
                        rs.getFloat( "price" ),
                        rs.getString( "service_type" ),
                        rs.getString( "contact_number" )
                    ) 
                );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return data;
    }

    public static int createService(SingleService service) {
        try {
            String query = "INSERT INTO services ( name, description, rating, service_type, user_id, price, contact_number ) VALUES ( ?, ?, ?, ?, ?, ?, ? )";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setString( 1, service.getName() );
            statement.setString( 2, service.getDescription() );
            statement.setInt( 3, service.getRating() );
            statement.setString( 4, service.getService_type() );
            statement.setInt( 5, service.getUser_id() );
            statement.setFloat( 6, service.getPrice() );
            statement.setString( 7, service.getContact_number() );

            int rows_affected = statement.executeUpdate();

            return rows_affected;

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return -1;
    }

    public static int updateService(SingleService service) {
        try {
            String query = "UPDATE services SET name = ?, description = ?, rating = ?, service_type = ?, price = ?, contact_number = ?  WHERE id = ?";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setString( 1, service.getName() );
            statement.setString( 2, service.getDescription() );
            statement.setInt( 3, service.getRating() );
            statement.setString( 4, service.getService_type() );
            statement.setFloat( 5, service.getPrice() );
            statement.setString( 6, service.getContact_number() );
            statement.setInt( 7, service.getId() );

            int rows_affected = statement.executeUpdate();

            return rows_affected;

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return -1;
    }

    public static int deleteService( int id ) {
        try {
            String query = "DELETE FROM services WHERE id = ?";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setInt( 1, id );

            int rows_affected = statement.executeUpdate();

            return rows_affected;

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return -1;
    }

}