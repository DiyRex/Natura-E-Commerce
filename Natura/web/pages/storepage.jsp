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
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
        <link href="../css/store_page.css" rel="stylesheet" />
        <title>Store</title>

    </head>
    <body class="d-flex flex-column min-vh-100">
        <%@ include file="../components/navbar.jsp" %>
        <div class="container-md mt-5">
            <div class="popup-message">
                <span class="textMessage"><i class="bi bi-cart-check"></i> Added to cart</span>
            </div>
            <br>
            <br>
            <div class="mt-4">
                <h1 class="text-center h2 fw-bold mt-5">Products Store</h1>
            </div>
            <div class="row mt-5" >
                <!-- Start Card -->
                <%-- Retrieve the product list from request scope --%>
                <% List<Product> products = (List<Product>) request.getAttribute("products");
                    if (products != null) {
                        for (Product product : products) {
                %>
                <div class="col-sm-6 col-md-4 col-lg-3 p-2 d-flex justify-content-center"  data-aos="fade-up"
                     data-aos-anchor-placement="top-bottom">
                    <div class="card shadow" style="width: 18rem; height: 25rem;  transform: scale(0.9); transform-origin: center;">
                        <img src="./images/Products/<%= product.getImage()%>" class="card-img-top fit-image" style="height:50%;  transform: scale(0.7); transform-origin: center;" alt="<%= product.getTitle()%> Image" />
                        <div class="card-body text-center">
                            <h5 class="card-title fw-bold text-center h3"><%= product.getTitle()%></h5>
                            <p class="card-text text-center"><small>(<%= product.getDescription()%>)</small></p>
                            <h6 class="text-center fw-bolder h5">LKR <%= product.getPrice()%></h6>

                            <div class="d-flex justify-content-evenly mt-4">
                                <!--                        <a href="#" class="btn shadow-lg border">
                                                            <i id="heart" class="bi bi-heart text-danger heart-icon"></i>
                                                        </a>-->
                                <button class="addcartbtn btn shadow-lg border bg-secondary text-white" data-product-id="<%=product.getId()%>"><i class="bi bi-cart-plus text-white h5 fw-bold"></i> Add to Cart</button>
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
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init();
        </script>
        <script>
            // add product to cart

            document.querySelectorAll(".addcartbtn").forEach(button => {
                button.addEventListener('click', function () {

                    const userId = "<%=(String) session.getAttribute("userID")%>";
                    const cartId = "<%=(String) session.getAttribute("cartID")%>";
                    var productId = button.getAttribute("data-product-id");
                    // URL-encoded form data
                    const formData = new URLSearchParams();
                    formData.append('productId', productId);
                    formData.append('cartId', cartId);
                    formData.append('quantityChange', '1');
                    fetch('/cartUpdate', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: formData.toString()
                    })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok: ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                console.log('Response:', data);
                            })
                            .catch(error => {
                                console.error('Failed to add to cart:', error);
                                window.location.href = '/login';
                            });
                    window.changeCardBadge(1);
                    showAddToCartPopup();
                });
            });

            function showAddToCartPopup() {
                var popup = document.querySelector('.popup-message');
                popup.classList.add('show');

                // Automatically hide the popup after 3 seconds
                setTimeout(function () {
                    popup.classList.remove('show');
                }, 2000);
            }

            // favourite heart animation
            var heart = document.querySelectorAll(".heart-icon");
            heart.forEach(heart => {
                heart.addEventListener("mouseout", function () {
                    changeOutline(heart);
                });
            });
            heart.forEach(heart => {
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
