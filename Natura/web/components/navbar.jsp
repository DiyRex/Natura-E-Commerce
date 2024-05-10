<%-- 
    Document   : nav
    Created on : May 1, 2024, 7:36:31 AM
    Author     : Devin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String username = (String) session.getAttribute("userName");%>
<head>
    <link rel="stylesheet" href="../css/navbar.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
        />

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
                    <a class="nav-link" href="/"><span class="h6">Home</span></a>
                </li>
                <hr class="dropdown-divider d-md-none">
                <li class="nav-item">
                    <a class="nav-link" href="/products"><span class="h6">Store</span></a>
                </li>
                <hr class="dropdown-divider d-md-none">
                <li class="nav-item">
                    <a class="nav-link" href="/about"><span class="h6">About Us</span></a>
                </li>
            </ul>
            <!-- Left links -->

            <!-- Search form -->
            <form class="d-flex input-group w-auto px-5 px-md-0 position-relative" action="/searchProduct" method="GET">
                <input type="text" name="searchKey" class="form-control rounded-pill pt-2" placeholder="Search.." aria-label="Search" style="padding-right: 3rem;" required>
                <button class="btn btn-success rounded-circle position-absolute" style="right: 10px; top: 50%; transform: translateY(-50%); z-index: 100;" type="submit">
                    <i class="bi bi-search text-white"></i>
                </button>
            </form>


            <!-- Right Nav links -->
            <ul class="navbar-nav mb-2 mb-lg-0 align-items-start justify-content-start px-5 px-md-0">
                 <%
                    if (username != null && !username.trim().equals("Guest")) {
                %>
                <!-- Notifications Dropdown -->
                <li class="nav-item dropdown d-flex flex-row justify-content-start align-items-center">
                    <button class="btn nav-link dropdown-toggle hidden-arrow" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="h3 px-md-1 pt-2 text-white  fas fa-bell"></i>
                    </button>
                    <!-- Dropdown menu -->
                    <ul class="dropdown-menu dropdown-menu-end notifications-list p-1" aria-labelledby="navbarDropdown">
                        <li>No new notifications</li>
                    </ul>
                </li>


                <!-- Cart Button -->
               
                <li class="nav-item d-flex flex-row justify-content-start align-items-center">
                    <button class="nav-link btn relative" id="cartbtn" type="button" data-bs-toggle="offcanvas" data-bs-target="#cartOffcanvas" aria-controls="cartOffcanvas" onclick="window.fetchData()">
                        <i class="bi h3 text-white bi-cart"></i>
                        <span id="cartCount" class="badge-cart absolute badge rounded-pill badge-notification bg-danger">0</span>
                    </button>
                </li>
                <%}%>

                <!-- User Profile Section -->
                <li class="nav-item dropdown d-flex flex-row justify-content-start align-items-center mx-1">
                    <button class="btn nav-link dropdown-toggle hidden-arrow" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="h3 px-md-1 pt-2 text-white  fa-regular fa-circle-user"></i>
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
                        <li><a class="dropdown-item" href="/myOrders">My orders</a></li>

                        <!-- Divider -->
                        <li><hr class="dropdown-divider"></li>

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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        initializeCartCount();
    });

    function initializeCartCount() {
        console.log("Initializing cart count...");

        var badge = document.getElementById("cartCount");
        if (badge) {
            getCartItemsCount().then(count => {
                console.log("Cart items count:", count);
                badge.innerHTML = count;
            }).catch(error => {
                console.error("Error getting cart items count:", error);
            });
        } else {
            console.error("Badge element not found");
        }
    }

    function getCartItemsCount() {
        return new Promise((resolve, reject) => {
            const xhr = new XMLHttpRequest();
            xhr.open('GET', '/cartUpdate', true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        var cartItemsJS = JSON.parse(xhr.responseText);
                        var itemCount = cartItemsJS.reduce((total, item) => {
                            return total + parseInt(item.qty, 10);
                        }, 0);
                        resolve(itemCount);
                    } else {
                        reject(new Error('Failed to fetch cart items: ' + xhr.status));
                    }
                }
            };
            xhr.send();
        });
    }

    window.updateCartBadge = function (count) {
        var badge = document.getElementById("cartCount");
        badge.innerHtml = count;
    };

    window.changeCardBadge = function (val) {
        if (document.readyState === "loading") { 
            document.addEventListener('DOMContentLoaded', () => updateBadge(val));
        } else {
            updateBadge(val);
        }
    };

    function updateBadge(val) {
        console.log("Triggered updateBadge");

        var badge = document.getElementById("cartCount");

        if (badge) {
           
            var currentBadgeValue = badge.innerHTML.trim();

            var currentVal = parseInt(currentBadgeValue, 10);
            if (isNaN(currentVal)) {
                console.error("Current badge value is not a number:", currentBadgeValue);
                currentVal = 0;
            }

           
            var additionalVal = parseInt(val, 10);
            if (!isNaN(additionalVal)) {
            
                badge.innerHTML = currentVal + additionalVal;
            } else {
                console.error("Invalid value passed to updateBadge:", val);
            }
        } else {
            console.error("Badge element not found");
        }
    }
</script>
<!-- Navbar -->

