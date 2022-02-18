<%@ page session="false" %>
<%@ page import="smartgrid.transport.TransportDAO" %>
<%@ page import="smartgrid.transport.TransportType" %>
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
                                <h1>Transport</h1>
                            </div>
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
                        ArrayList<TransportType> t = dao.getTransportTypes();
                        for ( TransportType transport: t ) {
                    %>
                        <div class="col-lg-8 offset-lg-2">
                            <a 
                            href="transport-list.jsp?name=<%= transport.getName() %>"
                            class="services-list-single-wrapper services-list-single-hover-1-wrapper"
                            >
                                <div class="services-list-single services-list-single-hover-1">
                                    <h3><%= transport.getName() %></h3>    
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
