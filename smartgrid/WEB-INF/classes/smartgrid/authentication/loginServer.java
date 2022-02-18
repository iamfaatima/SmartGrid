package smartgrid.authentication;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

public class loginServer extends HttpServlet {
	

public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
        response.setContentType("text/html");
		ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
        HttpSession hs = request.getSession( false );

        String email = request.getParameter("email");
		String password = request.getParameter("password");
        

        
        
        int check = login.checkRegistration(email,password);
        
        System.out.print( check );

        if(check != -1)
		{
            HttpSession session = request.getSession( true );
            session.setAttribute( "id", check);
			session.setAttribute( "userEmail", email);
            response.sendRedirect("home.jsp");
		}
        else
        {
            //out.println(check);
            response.sendRedirect("login.jsp");
        }


        

    }
}