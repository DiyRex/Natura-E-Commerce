<%-- 
    Document   : edit_user
    Created on : May 9, 2024, 4:59:40 PM
    Author     : Devin
--%>

<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User)request.getAttribute("user");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add User</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="w-100 d-flex align-items-center mb-4">
                <div class="col-3">
                    <button onclick="history.back()" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Back
                    </button>
                </div>
                <div class="col-6 text-center">
                    <h2 class="mb-0">Edit User</h2>
                </div>
                <div class="col-3"> <!-- Empty column for balance -->
                </div>
            </div>
  
            <form action="/admin/users/editUser" method="post" class="p-3 mb-5 bg-body">
                <input type="hidden" name="id" value="<%=user.getId()%>">
                <div class="mb-3">
                    <label for="inputName" class="form-label">Name</label>
                    <input type="text" id="inputName" name="name" class="form-control" placeholder="Full Name" value="<%=user.getName()%>" required autofocus>
                </div>
                <div class="mb-3">
                    <label for="inputContact" class="form-label">Contact</label>
                    <input type="text" id="inputContact" name="contact" class="form-control" placeholder="Contact Number" value="<%=user.getContact()%>" required>
                </div>
                <div class="mb-3">
                    <label for="inputAptNo" class="form-label">Apartment No</label>
                    <input type="text" id="inputAptNo" name="apt_no" class="form-control" placeholder="Apartment Number" value="<%=user.getApt_no()%>">
                </div>
                <div class="mb-3">
                    <label for="inputStreet" class="form-label">Street</label>
                    <input type="text" id="inputStreet" name="street" class="form-control" placeholder="Street" value="<%=user.getStreet()%>" required>
                </div>
                <div class="row g-3 mb-3">
                    <div class="col">
                        <label for="inputCity" class="form-label">City</label>
                        <input type="text" id="inputCity" name="city" class="form-control" placeholder="City" value="<%=user.getCity()%>" required>
                    </div>
                    <div class="col">
                        <label for="inputState" class="form-label">State</label>
                        <input type="text" id="inputState" name="state" class="form-control" placeholder="State" value="<%=user.getState()%>" required>
                    </div>
                    <div class="col">
                        <label for="inputZip" class="form-label">Zip Code</label>
                        <input type="text" id="inputZip" name="zip" class="form-control" placeholder="Zip Code" value="<%=user.getZip_code()%>" required>
                    </div>
                    <div class="mb-3">
                        <label for="inputEmail" class="form-label">Email</label>
                        <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email Address" value="<%=user.getEmail()%>" required>
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">Password</label>
                        <input type="text" id="inputPassword" name="password" class="form-control" placeholder="Password" value="<%=user.getPassword()%>" required>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Update User</button>
                        <button type="button" onclick="history.back()" class="btn btn-secondary ms-2">Back</button>
                    </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

