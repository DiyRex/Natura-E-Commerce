<%-- 
    Document   : add_product
    Created on : Apr 29, 2024, 8:13:35 PM
    Author     : Devin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="w-100 d-flex align-items-center  mb-4">
            <div class="col-3">
                <button onclick="history.back()" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Back
                </button>
            </div>
            <div class="col-6 text-center">
                <h2 class="mb-0">Add Product</h2>
            </div>
            <div class="col-3"> <!-- Empty column for balance -->
            </div>
        </div>
        <form action="/addProduct" method="POST" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="productTitle" class="form-label">Product Title</label>
                <input type="text" class="form-control" name="title" id="productTitle" placeholder="Enter product title">
            </div>
            <div class="mb-3">
                <label for="productDescription" class="form-label">Description</label>
                <textarea class="form-control" name="description" id="productDescription" rows="3" placeholder="Enter product description"></textarea>
            </div>
            <div class="mb-3">
                <label for="productPrice" class="form-label">Price</label>
                <input type="number" class="form-control" name="price" id="productPrice" placeholder="Enter product price">
            </div>
            <div class="mb-3">
                <label for="productQuantity" class="form-label">Quantity</label>
                <input type="number" class="form-control" name="qty" id="productQuantity" placeholder="Enter product quantity">
            </div>
            <div class="mb-3">
                <label for="productImage" class="form-label">Product Image</label>
                <input class="form-control" name="file" type="file" id="productImage">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <!-- Cancel Button -->
            <button type="button" onclick="history.back()" class="btn btn-secondary ms-2" onclick="window.location.reload();">Back</button>
        </form>
    </div>

    <!-- Icons Support from Bootstrap Icons (for back arrow) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

