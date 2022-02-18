package smartgrid.authentication;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.*;


public class profileHandler extends HttpServlet {
	

public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
        response.setContentType("text/html");
		ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
        HttpSession hs = request.getSession( false );

        String id = request.getParameter("id");
        String type = request.getParameter("type");

        if(type.equals("delete-account"))
        {
            Boolean tmp = UserDAO.deleteUser(id);
            if(tmp == true)
            {
                hs.removeAttribute("userEmail");
                response.sendRedirect("login.jsp");
                hs.invalidate();
            }
        }
        else if(type.equals("change-details"))
        {
            User us = new User(id, request.getParameter("userName"), "", "", request.getParameter("gender"), request.getParameter("phone"), request.getParameter("address"));
            Boolean tmp = UserDAO.changeUserDetails(us);
            if(tmp == true)
            {
                response.sendRedirect("profile.jsp");
            }
            else
            {
                response.sendRedirect("changeDetails.jsp");
            }
        }
        else if(type.equals("change-password"))
        {
            String password = request.getParameter("password");
            Boolean tmp = UserDAO.changeUserPassowrd(id, password); 
            if(tmp == true)
            {
                response.sendRedirect("profile.jsp");
            }
            else
            {
                response.sendRedirect("changePassword.jsp");
            }
        }
    }
}