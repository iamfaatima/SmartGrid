package smartgrid.authentication;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

public class signupServer extends HttpServlet {
	

public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
        response.setContentType("text/html");
		ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
        HttpSession hs = request.getSession();

        String name = request.getParameter("userName");
        String email = request.getParameter("email");
		String password = request.getParameter("password");
        String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

        
        User us = new User("0", name, email, password, gender, phone, address);
        Boolean check = signup.register(us);
        
        

        if(check)
		{
            //out.println(check);
			response.sendRedirect("login.jsp");
		}
        else
        {
            //out.println(check);
            response.sendRedirect("signup.jsp");
        }


        

    }
}