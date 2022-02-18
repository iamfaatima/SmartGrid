package smartgrid.authentication;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;

@MultipartConfig
public class profileImageUpload extends HttpServlet {
	

public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
        Part part = request.getPart("profile_image");

        String img_title = part.getSubmittedFileName();

        String img_id = request.getParameter("userid");

        String img_email = request.getParameter("useremail");

        image img = new image(img_title, img_id, img_email );

        Boolean check = imageDAO.insertImage(img);

        if(check == true)
        {
            String path = request.getServletContext().getRealPath("images") +File.separator+img_title;

            // FileOutputStream fos = new FileOutputStream(path);
					
            // InputStream is = part.getInputStream();
            
            // byte[] file = new byte[is.available()]; 
            
            // is.read(file);
            
            // fos.write(file);
            
            // fos.close();
            // is.close();

            part.write( path );

        }

        response.sendRedirect("profile.jsp");
    }

}