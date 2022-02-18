<%@ page session="false" %>
<%@ page import="smartgrid.transport.TransportDAO" %>
<%@ page import="smartgrid.transport.SingleTransport" %>
<%@ page import="java.util.ArrayList" %>

<%
    HttpSession ns = request.getSession( false );
    if ( ns == null ) {
        response.sendRedirect( "login.jsp" );
    }
%>

<% String transport_name = request.getParameter( "name" ); %>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />

<div class="services-wrapper">
    <div class="services">
        <div class="services-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <a href="transport.jsp">< Transport</a>
                        <div class="page-title">
                            <h1><%= transport_name %></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="services-list">
            <div class="container">
                <div class="row">
                    <%
                        TransportDAO dao = TransportDAO.getInstance();
                        ArrayList<SingleTransport> t = dao.getTransports( transport_name );
                        for ( SingleTransport transport: t ) {
                    %>
                        <div class="col-lg-8 offset-lg-2">
                            <div class="services-list-single-wrapper">
                                <div class="services-list-single services-list-single-1">
                                    <div class="services-list-single-content">
                                        <h3><%= transport.getName() %></h3>
                                    </div>
                                    <div class="services-list-single-button">
                                        <a class="button" href="single-transport.jsp?id=<%= transport.getId() %>">
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
