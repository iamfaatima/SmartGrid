<%@ page session="false" %>

<%@ page import="smartgrid.emergency.EmergencyServiceDAO" %>
<%@ page import="smartgrid.emergency.EmergencySingleService" %>

<%
    HttpSession ns = request.getSession( false );
    if ( ns == null ) {
        response.sendRedirect( "login.jsp" );
    }
%>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />

<% 
    int service_id = Integer.parseInt( request.getParameter( "id" ) ); 
    EmergencySingleService service = EmergencyServiceDAO.getSingleService( service_id );
%>

<div class="services-wrapper">
    <div class="services">
        <div class="services-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <a href="emergency-services-list.jsp?name=<%= service.getType() %>">< <%= service.getType() %></a>
                        <div class="page-title" style="margin-top: 10px;">
                            <h1><%= service.getName() %></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="services-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="services-content-inner">
                            <p style="margin-bottom: 50px"><%= service.getDescription() %></p>
                            <p>contact: 
                                <a href="tel:<%= service.getContact_number() %>">
                                    <%= service.getContact_number() %>
                                </a>
                            </p>
                            <p>response time: <%= service.getResponse_time() %> minutes</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </div>
</div>

<jsp:include page="layout/footer.jsp" />