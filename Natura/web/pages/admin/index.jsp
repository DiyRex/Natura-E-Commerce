<%-- 
    Document   : index
    Created on : Apr 29, 2024, 8:10:37 PM
    Author     : Devin
--%>

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
        <div class="container-lg">
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
                            <i class="h4 bi bi-currency-dollar"></i>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Total Sales</h5>
                            <p class="card-text fw-bold h1">2500</p>
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
                            <p class="card-text fw-bold h1">100</p>
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
                            <p class="card-text fw-bold h1">50</p>
                        </div>
                    </div>
                </div>
                <!-- Repeat Total Sales for Symmetry -->
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="card text-white bg-info">
                        <div class="badge bg-white text-info position-absolute card-badge">
                            <i class="h4 bi bi-graph-up"></i>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Growth</h5>
                            <p class="card-text fw-bold h1">30%</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Top Selling Products -->
            <h4 class="mt-5 mb-5 text-center">Top Selling Products</h4>
            <div class="row text-center g-4">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title fw-bold">Carrot</h5>
                            <p class="card-text"><small>(100g)</small></p>
                            <h6 class="fw-bolder">LKR 120.00</h6>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title fw-bold">Carrot</h5>
                            <p class="card-text"><small>(100g)</small></p>
                            <h6 class="fw-bolder">LKR 120.00</h6>
                        </div>
                    </div>
                </div>
                <!-- Add more products here -->
            </div>

            <!-- Recent Orders Section -->
            <h4 class="mt-5 mb-5 text-center">Recent Orders</h4>
            <div class="table-responsive">
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
                        <tr>
                            <td>1001</td>
                            <td>2023-01-15</td>
                            <td><span class="badge bg-success">Completed</span></td>
                            <td>$150.00</td>
                        </tr>
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
