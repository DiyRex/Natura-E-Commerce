<%-- 
    Document   : products
    Created on : Apr 29, 2024, 8:12:34 PM
    Author     : Devin
--%>

<%@page import="java.util.List"%>
<%@page import="models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Products</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <%@ include file="../../components/admin_sidebar.jsp" %>

        <div class="container mt-5">
            <div class="w-100 d-flex align-items-center  mb-4">
                <div class="col-3">
                    <div>
                        <button class="btn rounded-pill" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">
                            <i class="text-black fw-bolder h3 bi bi-list"></i>
                        </button>
                    </div>
                </div>
                <div class="col-6 text-center">
                    <h2 class="mb-0">Product List</h2>
                </div>
                <div class="col-3"> <!-- Empty column for balance -->
                </div>
            </div>
            <div class="">
                <a href="/admin/product/addProduct" class="btn btn-primary mb-4 mt-4"><i class="h6 bi bi-plus"></i> Add Product</a>
            </div>
            <table class="table table-hover">
                <thead class="text-center">
                    <tr>
                        <th scope="col">#</th>
                        <!--<th scope="col">Image</th>-->
                        <th scope="col">Product Title</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <%
                        List<Product> products = (List<Product>) request.getAttribute("products");
                        if (products != null && !products.isEmpty()) {
                            for (Product product : products) {
                    %>
                    <!-- Example Row 1 -->
                    <tr>
                        <th scope="row"><%=product.getId()%></th>
                        <!--<td><img src="../images/product1.jpg" class="img-fluid product-img" alt="Product 1"></td>-->
                        <td><%=product.getTitle()%></td>
                        <td>LKR <%=product.getPrice()%></td>
                        <td><%=product.getQty()%></td>
                        <td>
                            <button class="btn btn-primary btn-sm" id="edit-btn" data-row-id="<%=product.getId()%>" data-bs-toggle="modal" data-bs-target="#editProductModal">Edit</button>
                            <button class="btn btn-danger btn-sm" id="delete-btn" data-row-id="<%=product.getId()%>" data-bs-toggle="modal" data-bs-target="#deleteProductModal">Delete</button>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td class="text-center" colspan="5">No products available</td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
        <!-- Edit User Modal -->
        <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editProductModalLabel">Edit Product Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body"  id="edit-modal-body">
                        <form>
                            <!-- Form inputs for editing user details -->
                        </form>
                    </div>
                    <div class="modal-footer">
                        <a href="#" id="btn-edit" type="button" class="btn btn-primary">Edit Product</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete User Modal -->
        <div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteProductModalLabel">Delete User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="delete-modal-body">
                        Are you sure you want to delete this user?
                    </div>
                    <div class="modal-footer">
                        <button id="btn-delete" type="button" the class="btn btn-danger">Delete Product</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('button[data-bs-target="#editProductModal"]').forEach(function (button) {
                    button.addEventListener('click', function (event) {
                        var id = button.getAttribute("data-row-id");
                        console.log(id);
                        document.getElementById("edit-modal-body").innerHTML = `Are you sure you want to edit user \${id}?`;
                        document.getElementById("btn-edit").href = `/admin/products/editProduct?id=\${id}`;

                    });
                });
                document.querySelectorAll('button[data-bs-target="#deleteProductModal"]').forEach(function (button) {
                    button.addEventListener('click', function (event) {
                        var id = button.getAttribute("data-row-id");
                        console.log(id);
                        document.getElementById("delete-modal-body").innerHTML = `Are you sure you want to delete user \${id}?`;
                        document.getElementById("btn-delete").setAttribute("btn-data-id", id);
                    });
                });

                document.getElementById("btn-delete").addEventListener('click', function (event) {
                    var id = this.getAttribute("btn-data-id");
                    deleteProduct(id);
                });


                function deleteProduct(id) {
                    const url = `/admin/products/editProduct?id=\${id}`;

                    fetch(url, {
                        method: 'DELETE'
                    }).then(response => {
                        if (response.ok) {
                            window.location.href = "/admin/products";
                        } else {
                            console.error('Failed to delete product with ID:', id);
                            if (response.status === 204) {
                                console.log('Product deleted successfully, but no content returned.');
                                window.location.href = "/admin/products";
                            } else {
                                response.text().then(text => {
                                    window.location.href = "/admin/products";
                                });
                            }
                        }
                    }).catch(function (err) {
                        console.error('Error sending delete request:', err, "url:", url);
                        alert('Error in sending delete request.');
                    });
                }
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

