<%-- 
    Document   : signup_page
    Created on : May 1, 2024, 12:48:20 AM
    Author     : Devin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            background-color: #f7f7f7;
        }
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }
        .signup-form {
            width: 100%;
            max-width: 450px; 
            padding: 15px;
            margin: auto;
            background: white;
            border-radius: 8px;
        }
        .form-control {
            position: relative;
            height: auto;
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="signup-form">
        <form action="/signup" method="post">
            <h1 class="h3 mb-3 fw-normal text-center">Please Sign Up</h1>
            <div class="mb-3">
                <label for="inputName" class="form-label">Name</label>
                <input type="text" id="inputName" name="name" class="form-control" placeholder="Full Name" required autofocus>
            </div>
            <div class="mb-3">
                <label for="inputContact" class="form-label">Contact</label>
                <input type="text" id="inputContact" name="contact" class="form-control" placeholder="Contact Number" required>
            </div>
            <div class="mb-3">
                <label for="inputAptNo" class="form-label">Apartment No</label>
                <input type="text" id="inputAptNo" name="apt_no" class="form-control" placeholder="Apartment Number">
            </div>
            <div class="mb-3">
                <label for="inputStreet" class="form-label">Street</label>
                <input type="text" id="inputStreet" name="street" class="form-control" placeholder="Street" required>
            </div>
            <div class="row g-3">
                <div class="col">
                    <label for="inputCity" class="form-label">City</label>
                    <input type="text" id="inputCity" name="city" class="form-control" placeholder="City" required>
                </div>
                <div class="col">
                    <label for="inputState" class="form-label">State</label>
                    <input type="text" id="inputState" name="state" class="form-control" placeholder="State" required>
                </div>
                <div class="col">
                    <label for="inputZip" class="form-label">Zip Code</label>
                    <input type="text" id="inputZip" name="zip" class="form-control" placeholder="Zip Code" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="inputEmail" class="form-label">Email</label>
                <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email Address" required>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label">Password</label>
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="termsCheckbox" name="terms" required>
                <label class="form-check-label" for="termsCheckbox">I understand the <a href="#">terms and conditions</a></label>
            </div>
            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

