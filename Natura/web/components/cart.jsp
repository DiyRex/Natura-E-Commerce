<%@page import="models.Cart"%>
<%@page import="java.util.List"%>
<%@page import="dao.CartDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Assuming the user's ID is stored in the session

    String userId = (String) session.getAttribute("userID");

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
        <% }%>
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

                </div>
                <div class="total-cost-container">
                    <div class="d-flex justify-content-between align-items-center total-cost">
                        <h5>Total Cost:</h5>
                        <span id="totalCost">LKR <%= totalCost%></span>
                    </div>
                    <div class="d-flex justify-content-center mt-3">
                        <form action="/checkout" method="get">
                            <input type="hidden" id="hiddenTotal" name="total" value="<%= totalCost%>">
                            <button type="submit" class="btn btn-success">Checkout <i class="bi bi-arrow-right"></i></button>
                        </form>
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
            let cartItemsJS = [];

            function getCartItems() {
                const xhr = new XMLHttpRequest();
                xhr.open('GET', '/cartUpdate', true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        cartItemsJS = JSON.parse(xhr.responseText);
                        createCartItemCards();
                        updateTotalCost();
                    } else if (xhr.readyState === 4) {
                        console.error('Failed to fetch cart items:', xhr.status);
                    }
                };
                xhr.send();
            }
            window.fetchData = function () {
                    getCartItems();
                };
            function createCartItemCards() {
                const cartItemsContainer = document.querySelector('.cart-items');
                cartItemsContainer.innerHTML = '';
                if (cartItemsJS.length === 0) {
                    cartItemsContainer.innerHTML = '<p>Your cart is empty.</p>';
                } else {
                    cartItemsJS.forEach(item => {
                        const card = document.createElement('div');
                        card.className = 'list-group-item d-flex justify-content-between align-items-center cart-item';
                        card.innerHTML = `
                            <div class="item-details w-100">
                                <span class="product-name font-weight-bold">\${item.product}</span> -
                                <span class="product-price">LKR \${item.price}</span>
                            </div>
                            <div class="input-group ml-5">
                                <button class="btn btn-outline-secondary btn-decrement" type="button" data-item-id="\${item.id}" data-product-id="\${item.product_id}" data-cart-id="\${item.cart_id}">
                                    <i class="bi bi-dash-circle"></i>
                                </button>
                                <input type="text" class="form-control product-count text-center" value="\${item.qty}" data-price="\${item.price}" readonly style="max-width: 60px;">
                                <button class="btn btn-outline-secondary btn-increment" type="button" data-item-id="\${item.id}" data-product-id="\${item.product_id}" data-cart-id="\${item.cart_id}">
                                    <i class="bi bi-plus-circle"></i>
                                </button>
                            </div>
                        `;
                        cartItemsContainer.appendChild(card);
                    });
                }
                attachEventListeners();
            }
            
            function updateTotalCost() {
                let totalCost = 0;
                document.querySelectorAll('.product-count').forEach(input => {
                    totalCost += parseFloat(input.getAttribute('data-price')) * parseInt(input.value);
                });
                document.getElementById('totalCost').textContent = `LKR \${totalCost}`;
            }

            function updateCart(productId, quantityChange, cartId, itemId, type) {
                const url = (type === "update") 
                            ? `/cartUpdate?productId=\${productId}&cartId=\${cartId}&quantityChange=\${quantityChange}` 
                            : `/cartUpdate?itemID=\${itemId}`;
                fetch(url, {
                    method: type === "update" ? 'PUT' : 'DELETE'
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Response:', data);
                    getCartItems(); // Refresh cart items
                    updateTotalCost(); // Update cost display
                })
                .catch(error => {
                    console.error('Failed to update cart:', error);
                });
            }

            function attachEventListeners() {
                document.querySelectorAll('.btn-increment').forEach(button => {
                    button.removeEventListener('click', handleIncrement); // Prevent duplicate listeners
                    button.addEventListener('click', handleIncrement);
                });
                document.querySelectorAll('.btn-decrement').forEach(button => {
                    button.removeEventListener('click', handleDecrement); // Prevent duplicate listeners
                    button.addEventListener('click', handleDecrement);
                });
            }

            function handleIncrement(event) {
                const button = event.currentTarget;
                const input = button.parentElement.querySelector('.product-count');
                const productId = button.getAttribute('data-product-id');
                const cartId = button.getAttribute('data-cart-id');
                const itemId = button.getAttribute('data-item-id');
                let count = parseInt(input.value);
                count++;
                input.value = count;
                updateCart(productId, 1, cartId, itemId, "update");
            }

            function handleDecrement(event) {
                const button = event.currentTarget;
                const input = button.parentElement.querySelector('.product-count');
                const productId = button.getAttribute('data-product-id');
                const cartId = button.getAttribute('data-cart-id');
                const itemId = button.getAttribute('data-item-id');
                let count = parseInt(input.value);
                count--;
                input.value = count;
                if (count === 0) {
                    // Delete item
                    updateCart(productId, -1, cartId, itemId, "delete");
                } else {
                    updateCart(productId, -1, cartId, itemId, "update");
                }
            }

            getCartItems();
        });
    </script>
    </body>
</html>
