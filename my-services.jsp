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

    int id = (int) ns.getAttribute( "id" );
%>

<% String service_name = request.getParameter( "name" );
ArrayList<SingleService> t = ServiceDAO.getUserServices( id ); %>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />

<div class="services-wrapper">
    <div class="services">
        <div class="services-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 offset-lg-2">
                        <a href="home.jsp">< Home</a>
                        <div class="page-title">
                            <h1>My Services</h1>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <a class="button mt-3" href="provide-service.jsp">
                            <span>Provide Service</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="services-list">
            <div class="container">
                <div class="row">
                    <%
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
                                        <a class="button mt-3" href="edit-service.jsp?id=<%= service.getId() %>">
                                            <span>Edit</span>    
                                        </a>
                                        <a class="button mt-3" href="DeleteService?id=<%= service.getId() %>">
                                            <span>Delete</span>    
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
