<%@ page session="false" %>
<%@ page import="smartgrid.services.ServiceDAO" %>
<%@ page import="smartgrid.services.SingleService" %>
<%@ page import="smartgrid.services.ServiceType" %>
<%@ page import="java.util.ArrayList" %>

<%
    HttpSession ns = request.getSession( false );
    if ( ns == null ) {
        response.sendRedirect( "login.jsp" );
    }

    int service_id = Integer.parseInt( request.getParameter( "id" ) );
    SingleService service_main = ServiceDAO.getSingleService( service_id );
%>

<jsp:include page="layout/header.jsp" />
<jsp:include page="layout/navigation.jsp" />

<div class="services-wrapper">
    <div class="services">
        <div class="services-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3">
                        <a href="my-services.jsp">< My Services</a>
                        <div class="page-title">
                            <h1>Edit Service</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="services-form">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3">
                        <form class="provide-service-form">
                            <div class="form-floating">
                                <input 
                                type="text" 
                                class="form-control" 
                                name="name" 
                                id="floatingServiceName" 
                                placeholder="Name"
                                value="<%= service_main.getName() %>" 
                                required>
                                <label for="floatingServiceName">Name</label>
                            </div>
                            <div class="form-floating">
                                <input 
                                type="number" 
                                class="form-control" 
                                name="price" 
                                id="floatingServicePrice"
                                value="<%= service_main.getPrice() %>"  
                                placeholder="Price" 
                                required>
                                <label for="floatingServicePrice">Price</label>
                            </div>
                            <div class="form-floating">
                                <textarea 
                                class="form-control" 
                                name="description" 
                                id="floatingServiceDescription" 
                                placeholder="Description"  
                                required><%= service_main.getDescription() %>
                                </textarea>
                                <label for="floatingServiceDescription">Description</label>
                            </div>
                            <div class="form-floating">
                                <input 
                                type="text" 
                                class="form-control" 
                                name="contact_number" 
                                id="floatingServiceContactNumber"
                                value="<%= service_main.getContact_number() %>"  
                                placeholder="Contact Number" 
                                required>
                                <label for="floatingServiceContactNumber">Contact Number</label>
                            </div>
                            <input type="hidden" name="service_id" value="<%= service_main.getId() %>">
                            <input type="hidden" name="service_rating" value="<%= service_main.getRating() %>">
                            <select class="form-select mt-3" name="service_type" required>
                                <option>Open this select menu</option>
                                <%
                                    ArrayList<ServiceType> t = ServiceDAO.getServiceTypes();
                                    for ( ServiceType service: t ) {
                                %>
                                <option 
                                value="<%= service.getName() %>"
                                <%= service.getName().equals( service_main.getService_type() ) ? "selected": "" %>
                                >
                                    <%= service.getName() %>
                                </option>                                
                                <% } %>
                              </select>
                            <div>
                                <button type="submit" class="btn btn-outline-dark">Create Service</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelector( '.provide-service-form' )
    .addEventListener( 'submit', async (e) => {
        e.preventDefault();

        let data = new FormData( e.target );
        let response = await fetch( 'UpdateService', {
            method: 'POST',
            body: data
        } );

        let text = await response.text();
        window.location.href = 'my-services.jsp';
    } )
</script>

<jsp:include page="layout/footer.jsp" />
