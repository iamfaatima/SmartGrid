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
                <div><h1>Change Password</h1></div>
                <p>Change your new Password and Confirm it:</p>
                <div>
                    <form  action='handler' method="POST" onsubmit="return match_password()">
                        <input type="hidden" name="id" value="<%=us.getId()%>">
                        <input type="hidden" name="type" value="change-password">
    
                        <div class="form-floating mb-3">
                            <input type = "password" name = 'password' class="input-fields form-control" id="password" onkeyup="match_password()" placeholder="Enter Password">
                            <label>Password:</label>
                            <span id='error_password' class="error_input"></span>
                        </div>
                        <div class="form-floating mb-3">
                            <input type = "password" name = 'cnfrm-password' class="input-fields form-control" id="cnfrm_password" onkeyup="match_password()" placeholder="Confirm Password">
                            <label>Confirm Password:</label>
                        </div>
                        <div class="d-flex justify-content-end">
                            <input type=submit value='Change' id="signup-btn" class="btn btn-dark">
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" />