<%-- 
    Document   : products
    Created on : Apr 29, 2024, 8:12:34 PM
    Author     : Devin
--%>

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
            <a href="./add_product.html" class="btn btn-primary mb-4 mt-4"><i class="h6 bi bi-plus"></i> Add Product</a>
        </div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Image</th>
                    <th scope="col">Product Title</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Example Row 1 -->
                <tr>
                    <th scope="row">1</th>
                    <td><img src="../images/product1.jpg" class="img-fluid product-img" alt="Product 1"></td>
                    <td>Product 1</td>
                    <td>$10.00</td>
                    <td>100</td>
                    <td>
                        <button class="btn btn-primary btn-sm">Edit</button>
                        <button class="btn btn-danger btn-sm">Delete</button>
                    </td>
                </tr>
                <!-- Example Row 2 -->
                <tr>
                    <th scope="row">2</th>
                    <td><img src="../images/product2.jpg" class="img-fluid product-img" alt="Product 2"></td>
                    <td>Product 2</td>
                    <td>$20.00</td>
                    <td>150</td>
                    <td>
                        <button class="btn btn-primary btn-sm">Edit</button>
                        <button class="btn btn-danger btn-sm">Delete</button>
                    </td>
                </tr>
                <!-- More rows can be added similarly -->
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

