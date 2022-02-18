<%@ page session="false" %>
<%@ page import="smartgrid.services.ServiceDAO" %>
<%@ page import="smartgrid.services.ServiceType" %>
<%@ page import="java.util.ArrayList" %>

<%
    HttpSession ns = request.getSession( false );
    if ( ns == null ) {
        response.sendRedirect( "login.jsp" );
    }
%>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />

<div class="services-wrapper">
    <div class="services">
        <div class="services-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 services-row">
                        <div class="col-lg-6">
                            <div class="page-title">
                                <h1>Services</h1>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <a class="button" href="provide-service.jsp">
                                <span>Provide Service</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="services-list">
            <div class="container">
                <div class="row">
                    <%
                        ArrayList<ServiceType> t = ServiceDAO.getServiceTypes();
                        for ( ServiceType service: t ) {
                    %>
                        <div class="col-lg-8 offset-lg-2">
                            <a 
                            href="services-list.jsp?name=<%= service.getName() %>"
                            class="services-list-single-wrapper services-list-single-hover-1-wrapper"
                            >
                                <div class="services-list-single services-list-single-hover-1">
                                    <h3><%= service.getName() %></h3>    
                                </div>
                            </a>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>        
    </div>
</div>



<jsp:include page="layout/footer.jsp" />
