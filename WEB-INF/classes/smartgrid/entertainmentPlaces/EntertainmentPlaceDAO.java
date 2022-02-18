package smartgrid.entertainmentPlaces;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EntertainmentPlaceDAO {
    private static EntertainmentPlaceDAO instance = null;
    private Connection con;

    private EntertainmentPlaceDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/smartgrid", "root", "root");
        } catch ( Exception ex ) {
            ex.printStackTrace();
        }
    }

    public static EntertainmentPlaceDAO getInstance() {
        if ( instance == null ) {
            instance = new EntertainmentPlaceDAO();
        }
        return instance;
    }

    public ArrayList<EntertainmentPlaceType> getPlaceTypes() {
        ArrayList<EntertainmentPlaceType> data = new ArrayList<EntertainmentPlaceType>();

        try {
            String query = "SELECT * FROM entertainment_places_types;";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) {
                data.add( 
                    new EntertainmentPlaceType( 
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

    public ArrayList<SingleEntertainmentPlace> getPlaces( String type ) {
        ArrayList<SingleEntertainmentPlace> data = new ArrayList<SingleEntertainmentPlace>();

        try {
            String query = "SELECT * FROM entertainment_places WHERE type LIKE ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString( 1, type );
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) {
                data.add( 
                    new SingleEntertainmentPlace(
                        rs.getInt( "id" ),  
                        rs.getString( "name" ),
                        rs.getString( "description" ),
                        rs.getString( "location" ),
                        rs.getString( "type" ),
                        rs.getInt( "rating" )
                    ) 
                );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return data;
    }

    public SingleEntertainmentPlace getSinglePlace( int id ) {
        SingleEntertainmentPlace place = null;

        try {
            String query = "SELECT * FROM entertainment_places WHERE id = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt( 1, id );
            ResultSet rs = statement.executeQuery();

            if ( rs.next() ) {
                place =
                    new SingleEntertainmentPlace(
                        rs.getInt( "id" ),  
                        rs.getString( "name" ),
                        rs.getString( "description" ),
                        rs.getString( "location" ),
                        rs.getString( "type" ),
                        rs.getInt( "rating" )
                    );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return place;
    }

}
