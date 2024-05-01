<%-- 
    Document   : checkout
    Created on : May 1, 2024, 8:04:37 PM
    Author     : Devin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Checkout Page</title>
    <style>
        .address-details {
            display: none; /* Initially hide the manual address fields */
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Checkout</h2>
        <form>
            <!-- User Info and Address Selection -->
            <div class="mb-3">
                <label class="form-label d-block">Default Address:</label>
                <div class="input-group">
                    <div class="input-group-text">
                        <input class="form-check-input mt-0" type="radio" name="addressOption" id="defaultAddress" value="default" checked aria-label="Default address">
                    </div>
                    <textarea class="form-control" aria-label="Default address" disabled style="height: 150px;">
John Doe
Apartment No. 4B
123 Main St
City, State, 90210
                    </textarea>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label d-block">New Address:</label>
                <div class="input-group">
                    <div class="input-group-text">
                        <input class="form-check-input mt-0" type="radio" name="addressOption" id="newAddress" value="new" aria-label="New address">
                    </div>
                    <label class="form-control">Enter new address</label>
                </div>
                <div class="address-details">
                    <input type="text" class="form-control mb-2" id="manualApartmentNo" placeholder="Apartment No." aria-label="Apartment No.">
                    <input type="text" class="form-control mb-2" id="manualStreet" placeholder="Street" aria-label="Street">
                    <input type="text" class="form-control mb-2" id="manualCity" placeholder="City" aria-label="City">
                    <input type="text" class="form-control mb-2" id="manualState" placeholder="State" aria-label="State">
                    <input type="text" class="form-control mb-2" id="manualZipCode" placeholder="Zip Code" aria-label="Zip Code">
                </div>
            </div>
            <!-- Payment Section -->
            <div class="mb-3">
                <label class="form-label">Payment Method:</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="cashOnDelivery" checked>
                    <label class="form-check-label" for="cashOnDelivery">
                        Cash on Delivery
                    </label>
                </div>
            </div>
            <!-- Cost Summary -->
            <div class="mb-3">
                <div class="d-flex justify-content-between">
                    <label>Total Cost:</label>
                    <span>$100</span>
                </div>
                <div class="d-flex justify-content-between">
                    <label>Shipping Cost:</label>
                    <span>$20</span>
                </div>
                <div class="d-flex justify-content-between font-weight-bold">
                    <label>Total Payment:</label>
                    <span>$120</span>
                </div>
            </div>
            <!-- Place Order Button -->
            <button type="submit" class="btn btn-primary">Place Order</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('newAddress').addEventListener('change', function() {
            document.querySelector('.address-details').style.display = this.checked ? 'block' : 'none';
        });
        document.getElementById('defaultAddress').addEventListener('change', function() {
            document.querySelector('.address-details').style.display = !this.checked ? 'block' : 'none';
        });
    </script>
</body>
</html>
