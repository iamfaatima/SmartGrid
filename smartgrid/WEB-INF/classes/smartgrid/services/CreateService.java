package smartgrid.services;

import java.io.IOException;
import java.io.PrintWriter;

import javax.print.attribute.standard.PrinterName;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@MultipartConfig
public class CreateService extends HttpServlet {
    public void doPost( HttpServletRequest req, HttpServletResponse res )
    throws ServletException, IOException
    {
        PrintWriter out = res.getWriter();

        HttpSession session = req.getSession( false );
        if ( session == null ) {
            res.setStatus( 401 );
            out.print( "error.jsp?message=Session is not valid" );
            out.close();
            return;
        }

        int user_id = (int) session.getAttribute( "id" );
        String name = req.getParameter( "name" );
        float price = Float.parseFloat( req.getParameter( "price" ) );
        String description = req.getParameter( "description" );
        String service_type = req.getParameter( "service_type" );
        String contact_number = req.getParameter( "contact_number" );
        
        SingleService service = new SingleService( -1, name, user_id, description, 0, price, service_type, contact_number);
        int rows_affected = ServiceDAO.createService(service);

        if ( rows_affected == 1 ) {
            res.setStatus( 200 );
            out.print( "success.jsp?message=Service created successfully." );
            out.close();
        } else {
            res.setStatus( 402 );
            out.print( "error.jsp?message=Service could not be created." );
            out.close();
        }

        out.close();

    }
}
