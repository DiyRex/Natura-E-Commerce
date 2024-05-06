<%-- 
    Document   : nav
    Created on : May 1, 2024, 7:36:31 AM
    Author     : Devin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String username = (String) session.getAttribute("userName");%>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
     <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            />
    <style>
        .navbar-dark .nav-item .nav-link {
            color: #fff;
        }

        .navbar-dark .nav-item .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            border-radius: 0.25rem;
            color: #fff;
        }

        .fa-li {
            position: relative;
            left: 0;
        }
        
    </style>
</head>
<div class="cart-container">
<%@ include file="./cart.jsp" %>
</div>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-success">
    <!-- Container wrapper -->
    <div class="container-fluid">
        <!-- Navbar brand -->
        <a class="navbar-brand mx-4" href="#">
            <img src="./images/naturaLogo.png" height="60" alt="" loading="lazy" />
        </a>

        <!-- Toggle button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 px-5 px-md-0">
                <hr class="dropdown-divider d-md-none">
                <li class="nav-item">
                    <a class="nav-link" href="/"><span class="h5">Home</span></a>
                </li>
                <hr class="dropdown-divider d-md-none">
                <li class="nav-item">
                    <a class="nav-link" href="/products"><span class="h5">Store</span></a>
                </li>
                <hr class="dropdown-divider d-md-none">
                <li class="nav-item">
                    <a class="nav-link" href="/about"><span class="h5">About Us</span></a>
                </li>
            </ul>
            <!-- Left links -->

            <!-- Search form -->
            <form class="d-flex input-group w-auto px-5 px-md-0 position-relative">
                <input type="text" class="form-control rounded-pill pt-2" placeholder="Search.." aria-label="Search" style="padding-right: 3rem;">
                <button class="btn btn-success rounded-circle position-absolute" style="right: 10px; top: 50%; transform: translateY(-50%); z-index: 100;" type="button">
                    <i class="bi bi-search text-white"></i>
                </button>
            </form>


            <!-- Right Nav links -->
            <ul class="navbar-nav mb-2 mb-lg-0 align-items-start justify-content-start px-5 px-md-0">
                <!-- Notifications Dropdown -->
                <li class="nav-item dropdown d-flex flex-row justify-content-start align-items-center">
                    <button class="btn nav-link dropdown-toggle hidden-arrow" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="h3 pt-2 text-white  fas fa-bell"></i>
                    </button>
                    <!-- Dropdown menu -->
                    <ul class="dropdown-menu dropdown-menu-end notifications-list p-1" aria-labelledby="navbarDropdown">
                        <!-- Notification items here -->
                    </ul>
                </li>
                <!-- Cart Button -->
                <%
                            if (username != null && !username.trim().equals("Guest")) {
                        %>
                <li class="nav-item d-flex flex-row justify-content-start align-items-center">
                    <button class="nav-link btn" id="cartbtn" type="button" data-bs-toggle="offcanvas" data-bs-target="#cartOffcanvas" aria-controls="cartOffcanvas" onclick="window.fetchData()">
                    <i class="bi h3 text-white bi-cart"></i>
                </button>
                </li>
                 <%}%>
                 
                <!-- User Profile Section -->
                <li class="nav-item dropdown">
                    <button class="btn nav-link dropdown-toggle" href="#" id="navbarProfileDropdown" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(2).jpg" class="rounded-circle img-fluid"
                             height='35' width='35'>
                    </button>
                    <!-- Dropdown menu -->
                    <ul class="dropdown-menu dropdown-menu-end p-1" aria-labelledby="navbarProfileDropdown">
                        <!-- Profile Name -->


                        <li><a class="dropdown-item" href="#"><%= session.getAttribute("userName") != null ? (String) session.getAttribute("userName") : "Guest"%></a></li>

                        <!-- Divider -->
                        <li><hr class="dropdown-divider"></li>
                        
                        <!-- Profile Dropdown Items -->
                        <%
                            if (username == null || username.equals("Guest")) {
                        %>
                        <li><a class="dropdown-item" href="/login">Login</a></li>
                            <%
                            } else {
                            %>
                        <!-- If the user is not "Guest" and hence logged in, show Logout -->
                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                            <%
                                }
                            %>

                    </ul>

                </li>
            </ul>
        </div>
        <!-- Collapsible wrapper -->
    </div>
    <!-- Container wrapper -->
</nav>
<!-- Navbar -->

