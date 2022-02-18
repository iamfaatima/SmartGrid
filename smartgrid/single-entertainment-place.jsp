<%@ page session="false" %>

<%@ page import="smartgrid.entertainmentPlaces.EntertainmentPlaceDAO" %>
<%@ page import="smartgrid.entertainmentPlaces.SingleEntertainmentPlace" %>

<%
    HttpSession ns = request.getSession( false );
    if ( ns == null ) {
        response.sendRedirect( "login.jsp" );
    }
%>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />

<% 
    int place_id = Integer.parseInt( request.getParameter( "id" ) );
    EntertainmentPlaceDAO dao = EntertainmentPlaceDAO.getInstance(); 
    SingleEntertainmentPlace place = dao.getSinglePlace( place_id );
%>

<div class="services-wrapper">
    <div class="services">
        <div class="services-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <a href="entertainment-places-list.jsp?name=<%= place.getType() %>">< <%= place.getType() %></a>
                        <div class="page-title">
                            <h1><%= place.getName() %></h1>
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
                            <p style="margin-bottom: 50px"><%= place.getDescription() %></p>
                            <p>Location: <%= place.getLocation() %></p>
                            <div class="rating" data-rating="<%= ( place.getRating() * 20 ) %>"></div>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3402.5892566461353!2d74.26301031467304!3d31.48048325626134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391903ccac08143b%3A0x9b0637753efd261e!2sPUCIT-New%20Campus%20(New%20Building)!5e0!3m2!1sen!2s!4v1644169688632!5m2!1sen!2s" style="border:0; width: 100%; min-height: 500px; margin-top: 30px;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </div>
</div>

<jsp:include page="layout/footer.jsp" />