<%@ page session="false" %>

<%
    HttpSession ns = request.getSession( false );
    if ( ns == null ) {
        response.sendRedirect( "login.jsp" );
    }
%>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />

<div class="main-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2">
                <h1>Error</h1>
                <h3><%= request.getParameter( "message" ) %></h3>
                <a href="home.jsp">Home</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="layout/footer.jsp" />