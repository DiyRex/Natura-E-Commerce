<%-- 
    Document   : index
    Created on : Apr 29, 2024, 8:10:37 PM
    Author     : Devin
--%>

<%@page import="models.Order"%>
<%@page import="models.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            />
        <title>Admin Dashboard</title>
    </head>
    <body>
        <div class="container-lg px-5">
            <div class="mt-5">
                <h2 class="text-center">Natura Admin Dashboard</h2>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <!-- Left side - Menu Toggle Button -->
                <div>
                    <button class="btn rounded-pill" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">
                        <i class="text-black fw-bolder h3 bi bi-list"></i>
                    </button>
                </div>

                <!-- Right side - Notification and Profile Icons -->
                <div>
                    <button class="btn rounded-pill  me-2" type="button">
                        <i class="h3 bi bi-bell"></i>
                    </button>
                    <button class="btn rounded-pill" type="button">
                        <i class="h3 bi bi-person-circle"></i>
                    </button>
                </div>
            </div>

            <%@ include file="../../components/admin_sidebar.jsp" %>
            <div class="row text-center g-4 mt-4">
                <!-- Total Sales -->
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="card text-white bg-success">
                        <div class="badge bg-white text-success position-absolute card-badge">
                            <i class="h4 bi bi-graph-up"></i>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Total Sales</h5>
                            <p class="card-text fw-bold h1" style="min-height: 3rem"><%=request.getAttribute("salesCount")%></p>
                        </div>
                    </div>
                </div>
                <!-- Products -->
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="card text-white bg-primary">
                        <div class="badge bg-white text-primary position-absolute card-badge">
                            <i class="h4 bi bi-bag"></i>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Products</h5>
                            <p class="card-text fw-bold h1" style="min-height: 3rem"><%=request.getAttribute("productsCount")%></p>
                        </div>
                    </div>
                </div>
                <!-- Users -->
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="card text-white bg-danger">
                        <div class="badge bg-white text-danger position-absolute card-badge">
                            <i class="h4 bi bi-person"></i>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Users</h5>
                            <p class="card-text fw-bold h1" style="min-height: 3rem"><%=request.getAttribute("usersCount")%></p>
                        </div>
                    </div>
                </div>
                <!-- Repeat Total Sales for Symmetry -->
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="card text-white bg-info">
                        <div class="badge bg-white text-info position-absolute card-badge">
                            <i class="h4 bi bi-currency-dollar"></i>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Total Cost</h5>
                            <p class="card-text fw-bold h3" style="min-height: 3rem">LKR <%=request.getAttribute("totalCost")%></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Top Selling Products -->
            <h4 class="mt-5 mb-5 text-center">Top Selling Products</h4>
            <div id="productCarousel" class="carousel slide mt-5" data-bs-ride="carousel">
                <div class="carousel-inner" data-aos="fade-up" data-aos-delay="150" data-aos-duration="2000" data-aos-easing="ease-in-out" data-aos-once="true">
                    <%                        ProductDAOImpl dao = new ProductDAOImpl();
                        List<Product> products = dao.getHotItems();
                        for (int i = 0; i < products.size(); i += 4) {
                            boolean isActive = i == 0;
                    %>
                    <div class="carousel-item <%= isActive ? "active" : ""%>">
                        <div class="row d-flex justify-content-center">
                            <% for (int j = i; j < i + 4 && j < products.size(); j++) {
                                    Product product = products.get(j);
                            %>
                            <div class="col-12 col-md-3 d-flex justify-content-center align-items-center" style="height: 100%;">
                                <div class="card shadow" style="width: 18rem; height: 25rem; transform: scale(0.9); transform-origin: center;">
                                    <img src="./images/Products/<%= product.getImage()%>" class="card-img-top fit-image" style="height: 50%; width: 100%; object-fit: cover;" alt="<%= product.getTitle()%> Image" />
                                    <div class="card-body text-center">
                                        <h5 class="card-title fw-bold text-center h3"><%= product.getTitle()%></h5>
                                        <p class="card-text text-center"><small>(100g)</small></p>
                                        <h6 class="text-center fw-bolder h5">LKR <%= product.getPrice()%></h6>
                                    </div>
                                </div>
                            </div>

                            <% } %>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <!-- Carousel controls -->
                <button
                    class="carousel-control-prev mr-5"
                    type="button"
                    data-bs-target="#productCarousel"
                    data-bs-slide="prev"
                    style="transform: translateX(-75%);"
                    >
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                    <i class="text-dark h2 bi bi-arrow-left-circle"></i>
                </button>
                <button
                    class="carousel-control-next mx-5"
                    type="button"
                    data-bs-target="#productCarousel"
                    data-bs-slide="next"
                    style="transform: translateX(75%);"
                    >
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                    <i class="text-dark h2 bi bi-arrow-right-circle"></i>
                </button>
            </div>

            <!-- Recent Orders Section -->
            <h4 class="mt-5 mb-5 text-center">Recent Orders</h4>
            <div class="table-responsive mb-5 pb-5">
                <table class="table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<Order> orders = (List<Order>) request.getAttribute("orders");
                            if (orders != null) {
                                for (Order order : orders) {
                        %>
                        <tr>
                            <td><%=order.getId()%></td>
                            <td><%=order.getOrderdate()%></td>
                            <% if (order.getOrder_status().equals("pending")) {%>
                            <td><span class="badge bg-warning"><%=order.getOrder_status()%></span></td>
                                <% } else {%>
                            <td><span class="badge bg-success"><%=order.getOrder_status()%></span></td>
                                <%}%>
                            <td>LKR <%=order.getTotal_cost()%></td>
                        </tr>
                        <%}
                        } else {%>
                        <tr>
                            <td colspan="4" class="text-center">
                                No Orders Found
                            </td>
                        </tr>
                        <%}%>
                        <!-- More rows as needed -->
                    </tbody>
                </table>
            </div>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
