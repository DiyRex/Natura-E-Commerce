<%@page import="models.Cart"%>
<%@page import="java.util.List"%>
<%@page import="dao.CartDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Assuming the user's ID is stored in the session

    String userId = (String) session.getAttribute("userID");

    if (userId == null) {
        // Handle the case where the userID is not set in the session
        // For example, redirect to login page or show an error message
        response.sendRedirect("/login"); // Redirects to a login page
        return; // Stops further execution of the JSP
    }

    CartDAOImpl cartDao = new CartDAOImpl();
    List<Cart> cartItems = null;

    try {
        cartItems = cartDao.getCartProducts(userId);
        session.setAttribute("cartItems", cartItems); // Optional: store in session for other uses
    } catch (Exception e) {
        out.println("<p>Error retrieving cart items: " + e.getMessage() + "</p>");
    }

    // Calculate total cost
    int totalCost = 0;
    if (cartItems != null) {
        for (Cart item : cartItems) {
            totalCost += item.getPrice() * item.getQty();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%-- Ensure Bootstrap CSS is included --%>
        <% if (application.getAttribute("bootstrapCssIncluded") == null) { %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <% application.setAttribute("bootstrapCssIncluded", "true"); %>
        <% } %>
        <style>
            .offcanvas-body {
                display: flex;
                flex-direction: column;
                height: 100%;
            }
            .cart-items {
                flex-grow: 1;
                overflow-y: auto;
            }
            .total-cost {
                flex-shrink: 0;
                padding: 20px;
                background-color: #f8f9fa;
                border-top: 1px solid #dee2e6;
            }
            .offcanvas.offcanvas-end {
                z-index: 1055; /* This value may need to be higher than the navbar or other elements */
            }
            .list-group-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 15px;
                border: none;
                background-color: #f8f9fa;
                border-radius: 10px;
                margin-bottom: 8px;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            }

            .item-details {
                flex-grow: 1;
            }

            .product-name {
                font-weight: 600;
            }

            .product-price {
                font-size: 0.9rem;
                color: #666;
            }

            .input-group {
                display: flex;
            }

            .input-group .btn {
                border-radius: 50%;
                padding: 5px 8px;
            }


            .list-group-item {
                display: flex;
                justify-content: space-between; /* This ensures elements are spaced from one to another end */
                align-items: center;
                width: 100%; /* Ensures the container takes full width */
                padding: 10px 15px;
                border-radius: 10px;
                margin-bottom: 8px;
                background-color: #f8f9fa;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            }



            .input-group .btn {
                border-radius: 50%;
                padding: 5px 8px;
            }

            .input-group .form-control {
                text-align: left;
                padding: 0.375rem 0.75rem;
                margin: 0 5px;
                font-size: 1rem;
                width: auto; /* Control width directly to prevent stretching */
            }

        </style>
    </head>
    <body>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="cartOffcanvas" style="visibility: visible;" aria-labelledby="cartOffcanvasLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="cartOffcanvasLabel">Shopping Cart</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="cart-items">
                    <% if (cartItems != null && !cartItems.isEmpty()) {
                            for (Cart item : cartItems) {%>
                    <div class="list-group-item d-flex justify-content-between align-items-center cart-item">
                        <div class="item-details w-100">
                            <span class="product-name font-weight-bold"><%= item.getProduct()%></span> - 
                            <span class="product-price">LKR <%= item.getPrice()%></span>
                        </div>
                        <div class="input-group ml-5"> <!-- ml-auto to push to the right -->
                            <button class="btn btn-outline-secondary btn-decrement" type="button" data-product-id="<%= item.getCart_id()%>">
                                <i class="bi bi-dash-circle"></i>
                            </button>
                            <input type="text" class="form-control product-count text-center" value="<%= item.getQty()%>" data-price="<%= item.getPrice()%>" readonly style="max-width: 60px;">
                            <button class="btn btn-outline-secondary btn-increment" type="button" data-product-id="<%= item.getCart_id()%>">
                                <i class="bi bi-plus-circle"></i>
                            </button>
                        </div>
                    </div>


                    <% }
                    } else { %>
                    <p>Your cart is empty.</p>
                    <% }%>
                </div>
                <div class="total-cost-container">
                    <div class="d-flex justify-content-between align-items-center total-cost">
                        <h5>Total Cost:</h5>
                        <span id="totalCost">LKR <%= totalCost%></span>
                    </div>
                    <div class="d-flex justify-content-center mt-3">
                        <button type="button" class="btn btn-success">Checkout <i class="bi bi-arrow-right"></i></button>
                    </div>
                </div>

            </div>
        </div>

        <%-- Ensure Bootstrap JS is included --%>
        <% if (application.getAttribute("bootstrapJsIncluded") == null) { %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <% application.setAttribute("bootstrapJsIncluded", "true"); %>
        <% }%>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                function updateTotalCost() {
                    let totalCost = 0;
                    document.querySelectorAll('.product-count').forEach(function (productCountInput) {
                        const price = parseFloat(productCountInput.getAttribute('data-price'));
                        const count = parseInt(productCountInput.value);
                        totalCost += price * count;
                        console.log(totalCost);
                    });
                    document.getElementById('totalCost').textContent = 'LKR ' + totalCost.toFixed(2);
                }

                document.querySelectorAll('.btn-increment').forEach(function (button) {
                    button.addEventListener('click', function () {
                        const input = button.parentElement.querySelector('.product-count');
                        let count = parseInt(input.value);
                        count++;
                        input.value = count;
                        updateTotalCost();
                    });
                });

                document.querySelectorAll('.btn-decrement').forEach(function (button) {
                    button.addEventListener('click', function () {
                        const input = button.parentElement.querySelector('.product-count');
                        let count = parseInt(input.value);
                        if (count > 1) {
                            count--;
                            input.value = count;
                            updateTotalCost();
                        }
                    });
                });

                updateTotalCost(); // Update total cost on page load
            });
        </script>
    </body>
</html>
