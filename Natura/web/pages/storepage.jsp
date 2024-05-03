<%@page import="java.util.List"%>
<%@page import="models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            />
        <title>Store</title>
        <style>
            .fit-image {
                width: 100%;
                height: 200px; 
                object-fit: cover;
                object-position: center;
            }

        </style>
    </head>
    <body>
        <%@ include file="../components/navbar.jsp" %>
        <div class="container-md mt-5">
            <br>
            <br>
            <div class="mt-4">
                <h1 class="text-center h2 fw-bold mt-5">Products Store</h1>
            </div>
            <div class="row mt-5">
                <!-- Start Card -->
                <%-- Retrieve the product list from request scope --%>
        <% List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                for (Product product : products) {
        %>
        <div class="col-sm-6 col-md-4 col-lg-3 p-2 d-flex justify-content-center">
            <div class="card shadow" style="width: 18rem; height: 25rem">
                <img src="./images/Products/<%= product.getImage() %>" class="card-img-top fit-image" style="height:50%;" alt="<%= product.getTitle() %> Image" />
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold text-center h3"><%= product.getTitle() %></h5>
                    <p class="card-text text-center"><small>(100g)</small></p>
                    <h6 class="text-center fw-bolder h5">LKR <%= product.getPrice() %></h6>
                    <div class="d-flex justify-content-evenly mt-4">
<!--                        <a href="#" class="btn shadow-lg border">
                            <i id="heart" class="bi bi-heart text-danger heart-icon"></i>
                        </a>-->
                        <a href="#" class="btn shadow-lg border bg-secondary text-white"><i class="bi bi-cart-plus text-white h5 fw-bold"></i> Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <%      }
            }
        %>

                <!-- end Card -->
            </div>
        </div>
         <div class="mt-5">
            <%@ include file="../components/footer.jsp" %>
        </div>
            <!-- Script -->
            <script>
                var heart = document.querySelectorAll(".heart-icon");
                heart.forEach(heart = > {
                heart.addEventListener("mouseout", function(){
                changeOutline(heart);
                });
                });
                heart.forEach(heart = > {
                heart.addEventListener("mouseover", function () {
                changeFill(heart);
                });
                });
                function changeFill(heart) {
                heart.className = "bi bi-heart-fill text-danger";
                }
                function changeOutline(heart) {
                heart.className = "bi bi-heart text-danger"; //
                }
            </script>
            <script
                src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
                crossorigin="anonymous"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
                crossorigin="anonymous"
            ></script>
    </body>
</html>
