<%-- 
    Document   : orders
    Created on : Apr 29, 2024, 8:13:03 PM
    Author     : Devin
--%>

<%@page import="models.Order"%>
<%@page import="java.util.List"%>
<%@page import="models.OrderItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Orders</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="../../components/admin_sidebar.jsp" %>
    </div>
    <div class="container-md mt-5">
        <div class="w-100 d-flex align-items-center  mb-5">
                <div class="col-3">
                    <div>
                        <button class="btn rounded-pill" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">
                            <i class="text-black fw-bolder h3 bi bi-list"></i>
                        </button>
                    </div>
                </div>
                <div class="col-6 text-center">
                    <h2 class="mb-0">Orders List</h2>
                </div>
                <div class="col-3"> <!-- Empty column for balance -->
                </div>
            </div>
        <div class="accordion" id="ordersAccordion" style="margin-top: 70px!important;">
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders"); // Assume this attribute is passed correctly
                int count = 0;
                for (Order order : orders) {
                    count++;
            %>
            <div class="accordion-item my-2 py-2">
                <h2 class="accordion-header" id="heading<%=count%>">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex justify-content-between w-100 align-items-center">
                            <div class="h5 align-items-center">Order No : <span class="fw-bold h5"><%= order.getId()%></span>
                                <% if (order.getOrder_status().equals("pending")) {
                                %>
                                <span class="mx-3 badge bg-warning"><%= order.getOrder_status()%></span>
                                <%
                                    } else {%>
                                <span class="mx-3 badge bg-success"><%= order.getOrder_status()%></span>
                                <%}%>

                            </div>

                            <div class="mx-4 h6 text-muted">Date: <%= order.getOrderdate()%>
                                <% if (order.getOrder_status().equals("completed")) {
                                %>
                                <a class="btn btn-sm btn-info mx-1" data-bs-toggle="modal" data-bs-target="#completeOrderModal" style="pointer-events: none; min-width: 21%">Done <i class="bi bi-truck"></i></a>
                                <%
                             } else {%>
                                <a class="btn btn-sm btn-success mx-1" data-row-id="<%=order.getId()%>" data-bs-toggle="modal" data-bs-target="#completeOrderModal">Complete</a>
                                <%}%>
                                <a class="btn btn-sm btn-danger" data-row-id="<%=order.getId()%>" data-bs-toggle="modal" data-bs-target="#deleteOrderModal">Delete</a>
                                <a class="btn collapsed" data-bs-toggle="collapse" data-bs-target="#collapse<%=count%>" aria-expanded="false" aria-controls="collapse<%=count%>">
                                    <i class="bi bi-caret-down-fill"></i>
                                </a>
                            </div>
                        </div>
                    </div>
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

    <!-- Complete Order Modal -->
    <div class="modal fade" id="completeOrderModal" tabindex="-1" aria-labelledby="completeOrderModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="completeOrderModalLabel">Complete Order</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="complete-modal-body">
                    Are you sure you want to mark this order as complete?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <a href="#" id="complete-btn" type="button" class="btn btn-success">Complete Order</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Order Modal -->
    <div class="modal fade" id="deleteOrderModal" tabindex="-1" aria-labelledby="deleteOrderModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteOrderModalLabel">Delete Order</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="delete-modal-body">
                    Are you sure you want to delete this order?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <a href="#" type="button" id="delete-btn" class="btn btn-danger">Delete Order</a>
                </div>
            </div>
        </div>
    </div>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var completeButtons = document.querySelectorAll('a[data-bs-target="#completeOrderModal"]');
            var deleteButtons = document.querySelectorAll('a[data-bs-target="#deleteOrderModal"]');

            completeButtons.forEach(function (button) {
                button.addEventListener('click', function (event) {
                    var id = button.getAttribute("data-row-id");
                    console.log(id);
                    document.getElementById("complete-modal-body").innerHTML = `Are you sure you want to mark \${id} order as complete?`;
                    document.getElementById("complete-btn").href = `/admin/manageOrder?id=\${id}&method=complete`;
                });
            });

            deleteButtons.forEach(function (button) {
                button.addEventListener('click', function (event) {
                    var id = button.getAttribute("data-row-id");
                    console.log(id);
                    document.getElementById("delete-modal-body").innerHTML = `Are you sure you want to delete order \${id}?`;
                    document.getElementById("delete-btn").href = `/admin/manageOrder?id=\${id}&method=delete`;
                });
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

