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
public class DeleteService extends HttpServlet {
    public void doGet( HttpServletRequest req, HttpServletResponse res )
    throws ServletException, IOException
    {
        
        HttpSession session = req.getSession( false );
        if ( session == null ) {
            res.setStatus( 401 );
            PrintWriter out = res.getWriter();
            out.print( "error.jsp?message=Session is not valid" );
            out.close();
            return;
        }

        int id = Integer.parseInt( req.getParameter( "id" ) );
        
        int rows_affected = ServiceDAO.deleteService( id );

        if ( rows_affected == 1 ) {
            res.setStatus( 200 );
            res.sendRedirect( "my-services.jsp" );
        } else {
            res.setStatus( 402 );
            res.sendRedirect( "error.jsp?message=Service could not be deleted." );
        }

    }
}
