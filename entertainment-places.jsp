<%@ page session="false" %>
<%@ page import="smartgrid.entertainmentPlaces.EntertainmentPlaceDAO" %>
<%@ page import="smartgrid.entertainmentPlaces.EntertainmentPlaceType" %>
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
                                <h1>Entertainment Services</h1>
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
                        EntertainmentPlaceDAO dao = EntertainmentPlaceDAO.getInstance();
                        ArrayList<EntertainmentPlaceType> t = dao.getPlaceTypes();
                        for ( EntertainmentPlaceType place: t ) {
                    %>
                        <div class="col-lg-8 offset-lg-2">
                            <a 
                            href="entertainment-places-list.jsp?name=<%= place.getName() %>"
                            class="services-list-single-wrapper services-list-single-hover-1-wrapper"
                            >
                                <div class="services-list-single services-list-single-hover-1">
                                    <h3><%= place.getName() %></h3>    
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
