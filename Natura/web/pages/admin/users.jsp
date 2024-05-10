<%-- 
    Document   : users
    Created on : Apr 30, 2024, 4:43:27 PM
    Author     : Devin
--%>

<%@page import="java.util.List"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Users</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="../../components/admin_sidebar.jsp" %>
        <div class="container mt-5">

            <div class="w-100 d-flex align-items-center mb-4">
                <div class="col-3">
                    <div>
                        <button class="btn rounded-pill" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">
                            <i class="text-black fw-bolder h3 bi bi-list"></i>
                        </button>
                    </div>
                </div>
                <div class="col-6 text-center">
                    <h2 class="mb-5 mt-3">User List</h2>
                </div>
                <div class="col-3"> <!-- Empty column for balance -->
                </div>
            </div>
            <div class="">
                <a href="/admin/users/addUser" class="btn btn-primary mb-4 mt-4"><i class="h6 bi bi-plus"></i> Add Users</a>
            </div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Contact</th>
                        <th scope="col">Email</th>
                        <th scope="col">Address</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<User> users = (List<User>) request.getAttribute("users");
                        if (users != null && !users.isEmpty()) {
                            for (User user : users) {
                    %>
                    <tr>
                        <th scope="row"><%= user.getId()%></th>
                        <td><%= user.getName()%></td>
                        <td><%= user.getContact()%></td>
                        <td><%= user.getEmail()%></td>
                        <td><%= user.getApt_no() + " " + user.getStreet() + ", " + user.getCity() + ", " + user.getState() + " " + user.getZip_code()%></td>
                        <td>
                            <button class="btn btn-primary btn-sm" id="edit-btn" data-row-id="<%=user.getId()%>" data-bs-toggle="modal" data-bs-target="#editUserModal">Edit</button>
                            <button class="btn btn-danger btn-sm" id="delete-btn" data-row-id="<%=user.getId()%>" data-bs-toggle="modal" data-bs-target="#deleteUserModal">Delete</button>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="8">No data found</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>

            </table>
        </div>

        <!-- Edit User Modal -->
        <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editUserModalLabel">Edit User Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body"  id="edit-modal-body">
                        <form>
                            <!-- Form inputs for editing user details -->
                        </form>
                    </div>
                    <div class="modal-footer">
                        <a href="#" id="btn-edit" type="button" class="btn btn-primary">Edit user</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete User Modal -->
        <div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteUserModalLabel">Delete User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="delete-modal-body">
                        Are you sure you want to delete this user?
                    </div>
                    <div class="modal-footer">
                        <button id="btn-delete" type="button" the class="btn btn-danger">Delete User</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('button[data-bs-target="#editUserModal"]').forEach(function (button) {
                    button.addEventListener('click', function (event) {
                        var id = button.getAttribute("data-row-id");
                        console.log(id);
                        document.getElementById("edit-modal-body").innerHTML = `Are you sure you want to edit user \${id}?`;
                        document.getElementById("btn-edit").href = `/admin/users/editUser?id=\${id}`;

                    });
                });
                document.querySelectorAll('button[data-bs-target="#deleteUserModal"]').forEach(function (button) {
                    button.addEventListener('click', function (event) {
                        var id = button.getAttribute("data-row-id");
                        console.log(id);
                        document.getElementById("delete-modal-body").innerHTML = `Are you sure you want to delete user \${id}?`;
                        document.getElementById("btn-delete").setAttribute("btn-data-id", id);
                    });
                });

                document.getElementById("btn-delete").addEventListener('click', function (event) {
                    console.log("hi")
                    var id = this.getAttribute("btn-data-id");
                    deleteUser(id);
                });


                function deleteUser(id) {
                    const url = '/admin/users/editUser?id=' + id;

                    fetch(url, {
                        method: 'DELETE'
                    }).then(response => {
                        if (response.ok) {
                            window.location.href = "/admin/users";
                        } else {
                            console.error('Failed to delete user with ID:', id);
                            response.text().then(text => alert('Failed to delete user: ' + text));
                        }
                    }).catch(function (err) {
                        console.error('Error sending delete request:', err, "url:", url);
                    });
                }
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
