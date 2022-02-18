
<%@page contentType = "text/html" pageEncoding ='utf-8'%>

<%@ page session="false" %>

<jsp:include page="layout/header.jsp" />
<script src='assets/js/validator.js'></script>

<div class="main-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2">
                <h1>Login</h1>
                <form onsubmit="return validate_login()" action='log' method="POST">
                    
                    <div class="form-floating mb-3">
                        <input 
                        type="text" 
                        class="form-control" 
                        id="email"
                        name="email"
                        placeholder="Email Address">
                        <label for="email">Email Address</label>
                        <span id='error_email' class="error_input"></span>
                    </div>

                    <div class="form-floating mb-3">
                        <input 
                        type="password" 
                        class="form-control" 
                        id="password"
                        name="password"
                        placeholder="Password">
                        <label for="password">Password</label>
                        <span id='error_password' class="error_input"></span>
                    </div>
                    <button type="submit" class="btn btn-dark" id="signup-btn">Login</button>
                    
                </form>
                <a href="signup.jsp">Signup</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="layout/footer.jsp" />