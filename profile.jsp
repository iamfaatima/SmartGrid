<%@page import="smartgrid.authentication.*"%>
<%
    String user = (String)session.getAttribute("userEmail");
    if(user == null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<%
    User us = UserDAO.getUserProfile(user);
%>

<%
    String image_title = imageDAO.getImageName(us.getId(), us.getEmail());
%>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />


<div class="container" id="container-profile">
    <div class="row">
        <div class="col-md-12">
    <div id="card-root">
    <div>
        <div class="text-center">
            <%
                if(image_title == null){
            %>
            <img src = "assets/images/profile-icon.png" alt= "logo" id="profile-Img">
            <%
                } else {
            %>
            <img src = "images/<%=image_title%>" alt= "logo" id="profile-Img" id = "user-profile-img">
            <%}%>
            <h1 >Profile Page</h1>
        </div>
    <% if(us != null)
    {%>
    
    <div id="content-box">
        <h5> <span class="heading-text">User ID:</span> <%=us.getId()%></h5>
        <h5> <span class="heading-text">Name:</span> <%=us.getName()%></h5>
        <h5> <span class="heading-text">Email:</span> <%=us.getEmail()%></h5>
        <h5> <span class="heading-text">Gender:</span> <%=us.getGender()%></h5>
        <h5> <span class="heading-text">Phone:</span> <%=us.getPhone()%></h5>
        <h5> <span class="heading-text">Address:</span> <%=us.getAddress()%></h5>   
    </div>
    <%}%>
    </div>
        <div id="action-buttons">
            <span>
                <a class="btn btn-danger" role="button" href="changeDetails.jsp">Change Details</a>
            </span>
        
            <span>
                <a class="btn btn-danger" role="button" href="changePassword.jsp">Change Password</a>
            </span>
        
            <span>
            <form style="display:inline" method="post" action="handler">
                <input type="hidden" name="id" value="<%=us.getId()%>">
                <input type="hidden" name="type" value="delete-account">
                <span >
                    <input type='submit' value='Delete Account'  class="btn btn-danger">
                </span>
            </form>
            </span>
        </div>

        <div>
            <form method="Post" action="image" enctype="multipart/form-data">
            <label>Add Profile Image</label><br>
            <input type="hidden" name="userid" value="<%=us.getId()%>">
            <input type="hidden" name="useremail" value="<%=us.getEmail()%>">
            <input  type = "file" name = 'profile_image' id = 'profile_image' accept="image/png, image/gif, image/jpeg" required><br>
            <span >
                <input type=submit value='Change Picture'  class="btn btn-danger">
            </span>
            </form>
        </div>
    </div>
</div>
</div>
<jsp:include page="layout/footer.jsp" />