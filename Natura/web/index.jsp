<%@page import="java.util.List"%>
<%@page import="models.Product"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="models.User"%>
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
        <link rel="stylesheet" href="./css/home.css" />
        <title>Natura</title>
    </head>
    <body>
        <%@ include file="./components/navbar.jsp" %>


        <div class="container-fluid pt-5">
            <section>

                <div class="row bg-dark">

                    <div class="mt-5 d-block d-md-none" style="padding-top:100px;">

                    </div>

                    <div
                        class="col-12 col-md-6 d-flex flex-column justify-content-center align-items-center"
                        id="text-content"
                        >
                        <h1 class="text-white text-center display-3">
                            Try Some Natural <span class="text-success">Foods</span>
                        </h1>
                        <h5 class="text-muted text-center h3 mt-3">
                            Directly from our farms to your <span class="text-success">cart</span>
                        </h5>
                        <div class="d-flex flex-column btn-container">

                            <a type="button" href="/products"
                                class="btn btn-lg rounded-pill btn-success p-2 px-4 mt-5 btn-animate"
                                >
                                Shop Now
                            </a>
                        </div>
                    </div>
                    <div
                        class="col-12 col-md-6 d-flex flex-column justify-content-center align-items-center"
                        id="image-content"
                        >
                        <img
                            class="img-fluid h-75"
                            src="${pageContext.request.contextPath}/images/bag.png"
                            alt="Natural Food Bag"
                            />
                    </div>
                </div>
                <!--                <div class="cart-container">
                <%--<%@ include file="./components/cart.jsp" %>--%>
            </div>-->
            </section>
        </div>
        <section class="container mt-5 mb-5 pb-5 pt-5">
            <div
                class="row text-center hot-selling-title"
                data-aos="fade-up"
                data-aos-duration="2000"
                data-aos-once="true"
                >
                <h2><i class="bi bi-fire"></i> Hot Selling</h2>
            </div>

            <div id="productCarousel" class="carousel slide mt-5" data-bs-ride="carousel">
                <div class="carousel-inner" data-aos="fade-up" data-aos-delay="150" data-aos-duration="2000" data-aos-easing="ease-in-out" data-aos-once="true">
                    <%                        ProductDAOImpl dao = new ProductDAOImpl();
                        List<Product> products = dao.getHotItems();
                        for (int i = 0; i < products.size(); i += 4) {
                            boolean isActive = i == 0;
                    %>
                    <div class="carousel-item <%= isActive ? "active" : ""%>">
                        <div class="row d-flex justify-content-center">
                            <% for (int j = i; j < i + 4 && j < products.size(); j++) {
                                    Product product = products.get(j);
                            %>
                            <div class="col-12 col-md-3 d-flex justify-content-center align-items-center" style="height: 100%;">
                                <div class="card shadow" style="width: 18rem; height: 25rem; transform: scale(0.9); transform-origin: center;">
                                    <img src="./images/Products/<%= product.getImage()%>" class="card-img-top fit-image" style="height: 50%; width: 100%; object-fit: cover;" alt="<%= product.getTitle()%> Image" />
                                    <div class="card-body text-center">
                                        <h5 class="card-title fw-bold text-center h3"><%= product.getTitle()%></h5>
                                        <p class="card-text text-center"><small>(<%= product.getDescription()%>)</small></p>
                                        <h6 class="text-center fw-bolder h5">LKR <%= product.getPrice()%></h6>
                                        <div class="d-flex justify-content-evenly mt-4">
                                            <!--                                            <a href="#" class="btn shadow-lg border">
                                                                                            <i id="heart" class="bi bi-heart text-danger heart-icon"></i>
                                                                                        </a>-->
                                            <a href="#" class="btn shadow-lg border bg-secondary text-white"><i class="bi bi-cart-plus text-white h5 fw-bold"></i> Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <% } %>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <!-- Carousel controls -->
                <button
                    class="carousel-control-prev mr-5"
                    type="button"
                    data-bs-target="#productCarousel"
                    data-bs-slide="prev"
                    >
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                    <i class="text-dark h2 bi bi-arrow-left-circle"></i>
                </button>
                <button
                    class="carousel-control-next mx-5"
                    type="button"
                    data-bs-target="#productCarousel"
                    data-bs-slide="next"
                    >
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                    <i class="text-dark h2 bi bi-arrow-right-circle"></i>
                </button>
            </div>

        </section>
        <section class="container-fluid bg-dark pt-5 mt-5 mb-5 pb-5" >
            <div class="container mt-5">
                <div
                    class="row text-center hot-selling-title"
                    data-aos="fade-up"
                    data-aos-duration="2000"
                    data-aos-once="true"
                    >
                    <h2 class="text-white"><i class="text-white bi bi-bag"></i> Best Selling</h2>
                </div>

                <div id="productCarouselBest" class="carousel slide mt-5" data-bs-ride="carousel">
                    <div class="carousel-inner" data-aos="fade-up" data-aos-delay="150" data-aos-duration="2000" data-aos-easing="ease-in-out" data-aos-once="true">
                        <%
                            ProductDAOImpl bestdao = new ProductDAOImpl();
                            List<Product> Bestproducts = bestdao.getBestDeals();
                            for (int i = 0; i < Bestproducts.size(); i += 4) {
                                boolean isActive = i == 0;
                        %>
                        <div class="carousel-item <%= isActive ? "active" : ""%>">
                            <div class="row d-flex justify-content-center">
                                <% for (int j = i; j < i + 4 && j < products.size(); j++) {
                                        Product product = products.get(j);
                                %>
                                <div class="col-12 col-md-3 d-flex justify-content-center align-items-center" style="height: 100%;">
                                    <div class="card shadow" style="width: 18rem; height: 25rem; transform: scale(0.9); transform-origin: center;">
                                        <img src="./images/Products/<%= product.getImage()%>" class="card-img-top fit-image" style="height: 50%; width: 100%; object-fit: cover;" alt="<%= product.getTitle()%> Image" />
                                        <div class="card-body text-center">
                                            <h5 class="card-title fw-bold text-center h3"><%= product.getTitle()%></h5>
                                            <p class="card-text text-center"><small>(<%= product.getDescription()%>)</small></p>
                                            <h6 class="text-center fw-bolder h5">LKR <%= product.getPrice()%></h6>
                                            <div class="d-flex justify-content-evenly mt-4">
                                                <!--                                                <a href="#" class="btn shadow-lg border">
                                                                                                    <i id="heart" class="bi bi-heart text-danger heart-icon"></i>
                                                                                                </a>-->
                                                <a href="#" class="btn shadow-lg border bg-secondary text-white"><i class="bi bi-cart-plus text-white h5 fw-bold"></i> Add to Cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <% } %>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <!-- Carousel controls -->
                    <button
                        class="carousel-control-prev mr-5"
                        type="button"
                        data-bs-target="#productCarouselBest"
                        data-bs-slide="prev"
                        >
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                        <i class="text-light h2 bi bi-arrow-left-circle"></i>
                    </button>
                    <button
                        class="carousel-control-next mx-5"
                        type="button"
                        data-bs-target="#productCarouselBest"
                        data-bs-slide="next"
                        >
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                        <i class="text-light h2 bi bi-arrow-right-circle"></i>
                    </button>
                </div>
        </section>
        <%@ include file="./components/footer.jsp" %>
        <!--  -->
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init();
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

