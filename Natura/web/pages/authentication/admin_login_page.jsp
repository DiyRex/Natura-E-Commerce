<%-- 
    Document   : admin_login_page
    Created on : May 6, 2024, 12:05:48 AM
    Author     : Devin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Login</title>
        <link href="../../css/adminLogin.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            />

        
    </head>
    <body>
        <div class="login-form shadow-lg align-items-center">
            <form action="/adminLogin" method="post">
                <h1 class="h3 mb-5 fw-normal text-center"><span class="h2 fw-bold mb-5">Natura</span><br> Admin Login</h1>
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
            </form>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

