<%-- 
    Document   : login_page
    Created on : May 1, 2024, 12:05:48 AM
    Author     : Devin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Natura Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            />

        <style>
            html, body {
                height: 100%; /* Ensure the full height of the window */
            }
            body {
                display: flex;
                align-items: center; /* Align vertically center */
                justify-content: center; /* Align horizontally center */
                padding: 10px;
                background-color: #f7f7f7; /* Light grey background */
            }
            .login-form {
                width: 100%;
                max-width: 360px; /* Maximum width of the form */
                padding: 45px;
                margin: auto;
            }
            .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                font-size: 16px;
            }
            .form-control:focus {
                z-index: 2; /* Highlight focus */
            }
            .login-button {
                background-color: #007bff; /* Bootstrap primary color */
                border-color: #007bff;
            }
            .logo-img{
                width: 40%;
            }
            @media (min-width: 400px) and (max-width: 767.98px) {
                .logo-img{
                    width: 30%;
                }
            }
        </style>
    </head>
    <body>
        <%@ include file="../../components/navbar.jsp" %>
        <div class="login-form shadow-lg align-items-center">
<!--            <div  class="text-center mb-5" >
                <img src="../../images/natura_web.png" class="logo-img" alt="alt"/>
            </div>-->
            <form action="/login" method="post">
                <h1 class="h2 mb-5 fw-normal text-center">Login</h1>
                <div class="form-group">
                    <label for="inputEmail" class="visually-hidden">Email address</label>
                    <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                </div>
                <div class="form-group mt-3">
                    <label for="inputPassword" class="visually-hidden">Password</label>
                    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                </div>
                <div class="text-center row px-3">
                    <button class="btn btn-lg btn-primary btn-block mt-4 login-button" type="submit">Login</button>
                </div>
                <!-- Sign up link -->
                <div class="mt-3 text-center">
                    <p>Don't have an account? <a href="/signup">Sign up</a></p>
                </div>
            </form>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

