<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="cartOffcanvas" aria-labelledby="cartOffcanvasLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="cartOffcanvasLabel">Shopping Cart</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div class="cart-items">
                <!-- Product entries would be dynamically generated or included here -->
                <!-- Placeholder for product entries -->
                <div class="list-group-item d-flex justify-content-between align-items-center" id="product1">
                    Product 1 - $20.00
                    <div class="input-group">
                        <button class="btn btn-outline-secondary btn-decrement" type="button">-</button>
                        <input type="text" class="form-control text-center product-count" value="1" data-price="20" readonly>
                        <button class="btn btn-outline-secondary btn-increment" type="button">+</button>
                    </div>
                </div>
                <!-- More products can be added similarly -->
            </div>
            <div class="total-cost d-flex justify-content-between align-items-center">
                <h5>Total Cost:</h5>
                <span id="totalCost">$00.00</span>
            </div>
        </div>
    </div>

    <%-- Ensure Bootstrap JS is included --%>
    <% if (application.getAttribute("bootstrapJsIncluded") == null) { %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <% application.setAttribute("bootstrapJsIncluded", "true"); %>
    <% } %>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            function updateTotalCost() {
                let totalCost = 0;
                document.querySelectorAll('.product-count').forEach(function(productCountInput) {
                    const price = parseFloat(productCountInput.getAttribute('data-price'));
                    const count = parseInt(productCountInput.value);
                    totalCost += price * count;
                });
                document.getElementById('totalCost').textContent = '$' + totalCost.toFixed(2);
            }

            document.querySelectorAll('.btn-increment').forEach(function(button) {
                button.addEventListener('click', function() {
                    const input = button.parentElement.querySelector('.product-count');
                    let count = parseInt(input.value);
                    count++;
                    input.value = count;
                    updateTotalCost();
                });
            });

            document.querySelectorAll('.btn-decrement').forEach(function(button) {
                button.addEventListener('click', function() {
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
