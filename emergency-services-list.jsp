<%@ page session="false" %>
<%@ page import="smartgrid.emergency.EmergencyServiceDAO" %>
<%@ page import="smartgrid.emergency.EmergencySingleService" %>
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
                        <a href="emergency-services.jsp">< Emergency Services</a>
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
                        ArrayList<EmergencySingleService> t = EmergencyServiceDAO.getAllServices( service_name );
                        for ( EmergencySingleService service: t ) {
                    %>
                        <div class="col-lg-8 offset-lg-2">
                            <div class="services-list-single-wrapper">
                                <div class="services-list-single services-list-single-1">
                                    <div class="services-list-single-content">
                                        <h3><%= service.getName() %></h3>
                                        
                                        
                                    </div>
                                    <div class="services-list-single-button">
                                        <a class="button" href="emergency-single-service.jsp?id=<%= service.getId() %>">
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
