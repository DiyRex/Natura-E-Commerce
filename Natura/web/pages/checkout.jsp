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
            .fixed-bottom {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                /*          margin: 20px 20% 20px 20%;*/
                padding-bottom: 50px;
            }
            .title-margin{
                margin-top: 8rem;
            }
            #checkboxError {
                color: red;
                height: 20px;
                visibility: hidden;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <%@ include file="../components/navbar.jsp" %>
        <div class="container mt-5">
            <h2 class="text-center title-margin mb-4 mb-md-5 pb-md-2">Checkout</h2>
            <div class="row">
                <!-- Left Column for Data Entry -->
                <div class="col-12 col-md-8">
                    <form>
                        <!-- User Info and Address Selection -->
                        <h5 class="mx-0">Shipping Address</h5>
                        <div class="mb-3">
                            <label class="form-label d-block">Default Address:</label>
                            <div class="input-group">
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="addressOption" id="defaultAddress" value="default" checked aria-label="Default address">
                                </div>
                                <textarea id="defaddr" class="form-control" aria-label="Default address" disabled style="height: 150px;">
                                    <%= session.getAttribute("addressLine") != null ? session.getAttribute("addressLine") : "No Address Added"%>
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
                        <div class="mt-5">
                            <h5 class="mx-0">Payment Method</h5>
                            <div class="mb-3">
                                <label class="form-label">Select Payment Method:</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentMethod" id="cashOnDelivery" value="cash" checked>
                                    <label class="form-check-label" for="cashOnDelivery">
                                        Cash on Delivery
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentMethod" id="cardPayment" value="card">
                                    <label class="form-check-label" for="cardPayment">
                                        Card Payment
                                    </label>
                                </div>
                            </div>
                            <!-- Card Details Form, initially hidden -->
                            <div class="card-details pb-5" style="display: none;">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">Enter Card Details</h6>
                                        <form>
                                            <div class="mb-3">
                                                <label for="cardNumber" class="form-label">Card Number</label>
                                                <input type="text" class="form-control" id="cardNumber" placeholder="Card Number">
                                            </div>
                                            <div class="row">
                                                <div class="col mb-3">
                                                    <label for="cardExpiry" class="form-label">Expiration Date</label>
                                                    <input type="text" class="form-control" id="cardExpiry" placeholder="MM/YY">
                                                </div>
                                                <div class="col mb-3">
                                                    <label for="cardCVV" class="form-label">CVV</label>
                                                    <input type="text" class="form-control" id="cardCVV" placeholder="CVV">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </form>
                </div>

                <!-- Right Column for Cost Summary -->
                <div class="col-12 col-md-4 mb-3">
                    <div class="text-center h3 mb-5">Order Details</div>
                    <div class="sticky-top" style="top: 20px;"> <!-- Sticky positioning -->
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label class="h5">Total Cost:</label>
                                <span class="h5">LKR <%= request.getAttribute("total")%></span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <label class="h5">Shipping Cost:</label>
                                <span class="h5">LKR 200.00</span>
                            </div>
                            <div class="d-flex justify-content-between font-weight-bold">
                                <label class="h5">Total Payment:</label>
                                <%
                                    String totalStr = (String) request.getAttribute("total");
                                    double total = 0.00;
                                    try {
                                        total = Double.parseDouble(totalStr);
                                        total += 200; // Shipping cost
                                    } catch (NumberFormatException e) {
                                        total = 200; // Default shipping cost if parsing fails
                                    }
                                    String formattedTotal = String.format("%.2f", total); // Formatting the total to two decimal places
                                %>
                                <span class="h5">LKR <%= formattedTotal%></span>
                            </div>
                        </div>
                    </div>
                    <p class="text-muted">*Orders can take up to 2 business days according to your location</p>
                    <!-- Checkbox for User Agreements -->
                    <div class="mb-3">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="termsCheckbox">
                            <label class="form-check-label" for="termsCheckbox">I understand the terms and conditions.</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="confirmCheckbox">
                            <label class="form-check-label" for="confirmCheckbox">I confirm that the above information is correct.</label>
                        </div>
                        <div id="checkboxError">Please check both boxes to proceed.</div>
                    </div>
                    <!-- Place Order Button -->
                    <div class="row">
                        <button type="submit" onclick="validateCheckboxes()" class="btn btn-lg btn-primary p-2 mt-3">Place Order</button>
                    </div>
                </div>

            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                            document.getElementById('newAddress').addEventListener('change', function () {
                                document.querySelector('.address-details').style.display = this.checked ? 'block' : 'none';
                            });
                            document.getElementById('defaultAddress').addEventListener('change', function () {
                                document.querySelector('.address-details').style.display = !this.checked ? 'block' : 'none';
                            });

                            document.addEventListener('DOMContentLoaded', function () {
                                document.getElementById('cardPayment').addEventListener('change', function () {
                                    document.querySelector('.card-details').style.display = this.checked ? 'block' : 'none';
                                });

                                document.getElementById('cashOnDelivery').addEventListener('change', function () {
                                    document.querySelector('.card-details').style.display = !this.checked ? 'block' : 'none';
                                });
                            });

                            function sendOrderDetails(userId,totalCost,shippingAddress,paymentMethod, cartId) {
                                const postData = {
                                    userId: userId,
                                    totalCost: totalCost,
                                    shippingAddress: shippingAddress,
                                    paymentMethod: paymentMethod,
                                    cartId:cartId
                                };

                                console.log("Sending order details:");
                                console.log("User ID:", postData.userId);
                                console.log("Total Cost:", postData.totalCost);
                                console.log("Shipping Address:", postData.shippingAddress);
                                console.log("Payment Method:", postData.paymentMethod);
                                console.log("Cart ID:", postData.cartId);

                                $.ajax({
                                    url: '/createOrder',
                                    type: 'POST',
                                    data: postData,
                                    success: function (response) {
                                        console.log("Response received:", response);
                                        console.log("Order processed successfully.");
                                    },
                                    error: function (xhr, status, error) {
                                        console.error('Failed to process order:', status, error);
                                    }
                                });
                            };



                            function validateCheckboxes() {
                                var termsChecked = document.getElementById('termsCheckbox').checked;
                                var confirmChecked = document.getElementById('confirmCheckbox').checked;
                                var errorDiv = document.getElementById('checkboxError');

                                if (!termsChecked || !confirmChecked) {
                                    errorDiv.style.visibility = 'visible'; // Show the error message
                                } else {
                                    errorDiv.style.visibility = 'hidden'; // Hide the error message
                                    const userId = "<%=(String) session.getAttribute("userID")%>";
                                    const cartId = "<%=(String) session.getAttribute("cartID")%>";
                                    const total_cost = "<%= totalStr%>";
                                    var shipping_address = "";
                                    var payment = "";
                                    if (document.getElementById('cashOnDelivery').checked) {
                                        payment = "cash";

                                    } else if (document.getElementById('cardPayment').checked) {
                                        payment = "card";
                                    }
                                    if (document.getElementById('defaultAddress').checked) {
                                        shipping_address = document.getElementById("defaddr").innerHTML.trim();

                                    } else if (document.getElementById('newAddress').checked) {
                                        let name = '<%=session.getAttribute("userName")%>';
                                        let aptNo = document.getElementById('manualApartmentNo') ? document.getElementById('manualApartmentNo').value : '';
                                        let street = document.getElementById('manualStreet') ? document.getElementById('manualStreet').value : '';
                                        let city = document.getElementById('manualCity') ? document.getElementById('manualCity').value : '';
                                        let state = document.getElementById('manualState') ? document.getElementById('manualState').value : '';
                                        let zipCode = document.getElementById('manualZipCode') ? document.getElementById('manualZipCode').value : '';

                                        shipping_address = `\${name}\n\${aptNo},\n\${street},\n\${city},\n\${state},\n\${zipCode}`;

                                    }
                                    sendOrderDetails(userId,total_cost,shipping_address,payment,cartId);
                                }
                            }

        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
