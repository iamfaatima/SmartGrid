<%@page contentType = "text/html" pageEncoding ='utf-8'%>

<%@page import="smartgrid.authentication.*"%>
<%
    String user = (String)session.getAttribute("userEmail");
    if(user == null)
    {
        response.sendRedirect("log-in.jsp");
    }
%>
<%
    User us = UserDAO.getUserProfile(user);
%>


<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />
<script src='assets/js/validator.js'></script>
<div class="home-wrapper">
    <div class='container'>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div><h1>Change Details</h1></div>
                <p>Change your details in the form given below:</p>
                <div>
                    <form  action='handler' method="POST" onsubmit="return validate_details()">
                            <input type="hidden" name="id" value="<%=us.getId()%>">
                            <input type="hidden" name="type" value="change-details">
                            <div class="form-floating mb-3">
                            
                            <input type = "text" name = 'userName' id="userName" class="input-fields form-control" onblur="name_validate()" value="<%= us.getName() %>" placeholder="Enter User Name"> <br>
                            <label>User Name:</label><span id='error_name' class="error_input"></span><br> 
                            </div>
    
                            <label>Gender:</label><span id='error_gender' class="error_gender"></span><br>
                            <input type="radio" name='gender' id='gender-male' value='male' <%= us.getGender().equals("on") ? "checked": "" %>>
                            <label for='gender-male'>Male</label> <br>
                            <input type="radio" name='gender' id='gender-female' value='female' <%= !us.getGender().equals("on") ? "checked": "" %>>
                            <label for='gender-female'>Female</label> <br>
                           
                            <div class="form-floating mb-3">
                            
                            <input type = "text" name = 'phone'  id = 'phone' class="input-fields form-control" onkeypress='return printNumber(event)' placeholder="Enter Phone Number"
                            value="<%= us.getPhone() %>"><br>
                            <label>Phone:</label><span id='error_phone' class="error_input"></span><br>
                            </div>
                            <div class="form-floating mb-3">
                            
                            <input type = "text" name = 'address' id = 'address' class="input-fields form-control" placeholder="Enter Address"
                            value="<%= us.getAddress() %>"><br>
                            <label>Address:</label><span id='error_address' class="error_input"></span><br>
                            </div>
                            <div class="d-flex justify-content-end">
                                <input type=submit value='Change' id="signup-btn">
                            </div>
                    </form>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" />