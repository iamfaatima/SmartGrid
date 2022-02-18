<%@ page session="false" %>
<%@ page import="smartgrid.entertainmentPlaces.EntertainmentPlaceDAO" %>
<%@ page import="smartgrid.entertainmentPlaces.SingleEntertainmentPlace" %>
<%@ page import="java.util.ArrayList" %>

<%
    HttpSession ns = request.getSession( false );
    if ( ns == null ) {
        response.sendRedirect( "login.jsp" );
    }
%>

<% String place_name = request.getParameter( "name" ); %>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />

<div class="services-wrapper">
    <div class="services">
        <div class="services-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <a href="entertainment-places.jsp">< Entertainment Places</a>
                        <div class="page-title">
                            <h1><%= place_name %></h1>
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
                        ArrayList<SingleEntertainmentPlace> t = dao.getPlaces( place_name );
                        for ( SingleEntertainmentPlace place: t ) {
                    %>
                        <div class="col-lg-8 offset-lg-2">
                            <div class="services-list-single-wrapper">
                                <div class="services-list-single services-list-single-1">
                                    <div class="services-list-single-content">
                                        <h3><%= place.getName() %></h3>
                                        <div class="rating" data-rating="<%= ( place.getRating() * 20 ) %>"></div>
                                    </div>
                                    <div class="services-list-single-button">
                                        <a class="button" href="single-entertainment-place.jsp?id=<%= place.getId() %>">
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
