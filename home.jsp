<%@ page session="false" %>

<%
    HttpSession ns = request.getSession( false );
    if ( ns == null ) {
        response.sendRedirect( "login.jsp" );
    }
%>

<jsp:include page="layout/header.jsp" />

<jsp:include page="layout/navigation.jsp" />

<div class="home-wrapper">
    <div class="home">
        <div class="home-heading">
            <div class="container">
                <div class="col-lg-8 offset-lg-2">
                    <h1>SmartGrid</h1>
                </div>
            </div>
        </div>
        <div class="home-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="row">
                            <div class="col-lg-6">
                                <a href="services.jsp" class="type-box-wrapper">
                                    <div class="type-box">
                                        <h3>Services</h3>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-6">
                                <a href="emergency-services.jsp" class="type-box-wrapper">
                                    <div class="type-box">
                                        <h3>Emergency Services</h3>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-6 mt-3">
                                <a href="transport.jsp" class="type-box-wrapper">
                                    <div class="type-box">
                                        <h3>Transport</h3>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-6 mt-3">
                                <a href="entertainment-places.jsp" class="type-box-wrapper">
                                    <div class="type-box">
                                        <h3>Entertainment Places</h3>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="layout/footer.jsp" />