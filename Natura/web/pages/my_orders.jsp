
<%@page import="models.OrderItem"%>
<%@page import="models.Order"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="d-flex flex-column min-vh-100">
        <div class="mb-4">
            <%@ include file="../components/navbar.jsp" %>
        </div>
        <div class="container-md mt-5">
            <br>
            <br>
            <div class="mt-4">
                <h1 class="text-center h2 fw-bold mt-5">My Orders</h1>
            </div>
            <div class="accordion mt-4" id="ordersAccordion">
                <%            List<Order> orders = (List<Order>) request.getAttribute("orders");
                    if (orders == null) {
                        response.sendRedirect("/login");
                    }
                    int count = 0;
                    for (Order order : orders) {
                        count++;
                %>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading<%=count%>">
                        <button class="accordion-button collapsed d-flex justify-content-between" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%=count%>" aria-expanded="false" aria-controls="collapse<%=count%>">
                            <div class="d-flex justify-content-between w-100">
                                <div>Order No : <span class="fw-bold"><%= order.getId()%></span></div>
                                <div class="mx-4 text-muted small">Date: <%= order.getOrderdate()%></div>
                            </div>
                        </button>
                    </h2>
                    <div id="collapse<%=count%>" class="accordion-collapse collapse" aria-labelledby="heading<%=count%>" data-bs-parent="#ordersAccordion">
                        <div class="accordion-body">
                            <table class="table">
                                <tr>
                                    <th>Shipping Address:</th>
                                    <td><%= order.getShipping_Address()%></td>
                                </tr>
                                <tr>
                                    <th>Payment Method:</th>
                                    <td><%= order.getPayment()%></td>
                                </tr>
                                <tr>
                                    <th>Total Cost:</th>
                                    <td>LKR <%= order.getTotal_cost()%></td>
                                </tr>
                                <tr>
                                    <th>Status:</th>
                                        <% if (order.getOrder_status().equals("pending")) {
                                        %>
                                    <td><span class="badge bg-warning"><%= order.getOrder_status()%></span></td>
                                        <%
                    } else {%>
                                    <td><span class="badge bg-success"><%= order.getOrder_status()%></span></td>
                                        <%}%>
                                </tr>
                            </table>
                            <div class="col-12 col-md-6">
                                <h5>Items:</h5>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Product Name</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (OrderItem item : order.getOrder_item()) {%>
                                        <tr>
                                            <td><%= item.getProduct_name()%></td>
                                            <td><%= item.getQty()%></td>
                                            <td>LKR <%= item.getPrice()%></td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <% }%>
            </div>
        </div>
        <div class="mt-auto">
            <%@ include file="../components/footer.jsp" %>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

