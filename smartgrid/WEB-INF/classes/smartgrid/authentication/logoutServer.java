package smartgrid.authentication;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

public class logoutServer extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        HttpSession session = request.getSession( false );
        if ( session != null ) {
            session.invalidate();
            response.sendRedirect( "login.jsp" );
        }
    }
}
