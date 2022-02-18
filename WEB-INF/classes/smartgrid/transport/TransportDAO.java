package smartgrid.transport;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TransportDAO {
    private static TransportDAO instance = null;
    private Connection con;

    private TransportDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/smartgrid", "root", "root");
        } catch ( Exception ex ) {
            ex.printStackTrace();
        }
    }

    public static TransportDAO getInstance() {
        if ( instance == null ) {
            instance = new TransportDAO();
        }
        return instance;
    }

    public ArrayList<TransportType> getTransportTypes() {
        ArrayList<TransportType> data = new ArrayList<TransportType>();

        try {
            String query = "SELECT * FROM transport_type;";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) {
                data.add( 
                    new TransportType( 
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

    public ArrayList<SingleTransport> getTransports( String type ) {
        ArrayList<SingleTransport> data = new ArrayList<SingleTransport>();

        try {
            String query = "SELECT * FROM transports WHERE type LIKE ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString( 1, type );
            ResultSet rs = statement.executeQuery();

            while ( rs.next() ) {
                data.add( 
                    new SingleTransport(
                        rs.getInt( "id" ),  
                        rs.getString( "name" ),
                        rs.getString( "description" ),
                        rs.getFloat( "fare" ),
                        rs.getString( "type" ),
                        rs.getString( "route" ),
                        rs.getString( "timing" )
                    ) 
                );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return data;
    }

    public SingleTransport getSingleTransport( int id ) {
        SingleTransport transport = null;

        try {
            String query = "SELECT * FROM transports WHERE id = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt( 1, id );
            ResultSet rs = statement.executeQuery();

            if ( rs.next() ) {
                transport = new SingleTransport(
                    rs.getInt( "id" ), 
                    rs.getString( "name" ),
                    rs.getString( "description" ),
                    rs.getFloat( "fare" ),
                    rs.getString( "type" ),
                    rs.getString( "route" ),
                    rs.getString( "timing" )
                ); 
            }

        } catch ( Exception ex ) {
            ex.printStackTrace();
        }

        return transport;
    }

}
