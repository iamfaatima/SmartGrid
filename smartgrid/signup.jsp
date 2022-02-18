<%@page contentType = "text/html" pageEncoding ='utf-8'%>

<%@ page session="false" %>

<jsp:include page="layout/header.jsp" />
<script src='assets/js/validator.js'></script>

<div class="main-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2">
                <h1>Sign Up</h1>
                <form onsubmit="return validate_form()" action='sign' method="POST">
                    <div class="form-floating mb-3">
                        <input 
                        type="text" 
                        class="form-control" 
                        id="userName"
                        name="userName"
                        placeholder="Username" n6>
                        <label for="userName">Username</label>
                        <span id='error_name' class="error_input"></span>
                    </div>
                    
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

                    <div class="form-floating mb-3">
                        <input 
                        type="password" 
                        class="form-control" 
                        id="cnfrm_password"
                        name="cnfrm-password"
                        placeholder="Confirm Password">
                        <label for="cnfrm-password">Confirm Password</label>
                        <span id='error_password' class="error_input"></span>
                    </div>

                    <div class="d-flex">
                        <div class="form-check">
                            <input 
                            class="form-check-input" 
                            type="radio" 
                            name="gender" 
                            id="gender-male">
                            <label class="form-check-label" for="flexRadioDefault1">
                              Male
                            </label>
                        </div>

                        <div class="form-check" style="margin-left: 20px">
                            <input 
                            class="form-check-input" 
                            type="radio" 
                            name="gender" 
                            id="gender-female">
                            <label class="form-check-label" for="flexRadioDefault1">
                              Female
                            </label>
                        </div>
                        <span id='error_gender' class="error_input"></span>
                    </div>

                    <div class="form-floating mb-3">
                        <input 
                        type="text" 
                        class="form-control" 
                        id="address"
                        name="address"
                        placeholder="Address">
                        <label for="address">Address</label>
                        <span id='error_address' class="error_input"></span>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input 
                        type="text" 
                        class="form-control" 
                        id="phone"
                        name="phone"
                        placeholder="phone">
                        <label for="phone">Phone</label>
                        <span id='error_phone' class="error_input"></span>
                    </div>

                    <button type="submit" class="btn btn-dark" id="signup-btn">Signup</button>
                    
                </form>
                <a href="login.jsp">Login</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="layout/footer.jsp" />