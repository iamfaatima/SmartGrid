<%@ page session="false" %>
<%@ page import="smartgrid.services.ServiceDAO" %>
<%@ page import="smartgrid.services.SingleService" %>
<%@ page import="smartgrid.authentication.UserDAO" %>
<%@ page import="smartgrid.authentication.User" %>
<%@ page import="java.util.ArrayList" %>

<%
    HttpSession ns = request.getSession( false );
    if ( ns == null ) {
        response.sendRedirect( "login.jsp" );
    }
%>

<% String service_name = request.getParameter( "name" ); %>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />

<div class="services-wrapper">
    <div class="services">
        <div class="services-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <a href="services.jsp">< Services</a>
                        <div class="page-title">
                            <h1><%= service_name %></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="services-list">
            <div class="container">
                <div class="row">
                    <%
                        ArrayList<SingleService> t = ServiceDAO.getAllServices( service_name );
                        for ( SingleService service: t ) {
                            User user = UserDAO.getUser( service.getUser_id() );
                    %>
                        <div class="col-lg-8 offset-lg-2">
                            <div class="services-list-single-wrapper">
                                <div class="services-list-single services-list-single-1">
                                    <div class="services-list-single-content">
                                        <h3><%= service.getName() %></h3>
                                        <h5>Provided by: <%= user.getName() %></h5>
                                        <div class="rating" data-rating="<%= ( service.getRating() * 20 ) %>"></div>
                                    </div>
                                    <div class="services-list-single-button">
                                        <a class="button" href="single-service.jsp?id=<%= service.getId() %>">
                                            <span>Read More</span>    
                                        </a>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>        
    </div>
</div>



<jsp:include page="layout/footer.jsp" />
