<%-- 
    Document   : nav
    Created on : May 1, 2024, 7:36:31 AM
    Author     : Devin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
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
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about">About Us</a>
                </li>
            </ul>
            <!-- Left links -->

            <!-- Search form -->
            <form class="d-flex input-group w-auto">
                <input type="search" class="form-control" placeholder="Search.." aria-label="Search" />
                <button class="btn btn-outline-none" type="button" data-mdb-ripple-color="dark" style="padding: .45rem 1.5rem .35rem;">
                    <i class="text-white h5 bi bi-search"></i>
                </button>
            </form>

            <!-- Right links -->
            <ul class="navbar-nav mb-2 mb-lg-0">
                <!-- Notifications Dropdown -->
                <li class="nav-item dropdown d-flex flex-row justify-content-center align-items-center">
                    <a class="nav-link dropdown-toggle hidden-arrow" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="h5 text-white  fas fa-bell"></i>
                    </a>
                    <!-- Dropdown menu -->
                    <ul class="dropdown-menu dropdown-menu-end notifications-list p-1" aria-labelledby="navbarDropdown">
                        <!-- Notification items here -->
                    </ul>
                </li>
                <!-- User Profile Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarProfileDropdown" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(2).jpg" class="rounded-circle img-fluid"
                             height='35' width='35'>
                    </a>
                    <!-- Dropdown menu -->
                    <ul class="dropdown-menu dropdown-menu-end p-1" aria-labelledby="navbarProfileDropdown">
                        <!-- Profile Name -->


                        <li><a class="dropdown-item" href="#"><%= session.getAttribute("userName") != null ? (String) session.getAttribute("userName") : "Guest"%></a></li>

                        <!-- Divider (optional) -->
                        <li><hr class="dropdown-divider"></li>

                        <%
                            // Safely retrieve the userName attribute from the session
                            String username = (String) session.getAttribute("userName");

                            // Check if userName is "Guest" or null, show Login; otherwise, show Logout
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

