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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/home.css" />
    <title>Natura</title>
  </head>
  <body>
    <div class="container-fluid">
        <%@ include file="./components/nav.jsp" %>
      <section>
        <div class="row bg-dark">
          <div
            class="col-12 col-md-6 d-flex flex-column justify-content-center align-items-center"
            id="text-content"
          >
            <h1 class="text-white text-center display-3">
              Try Some Natural <span class="text-success">Foods</span>
            </h1>
            <div class="d-flex flex-column btn-container">
              <button
                class="btn btn-lg rounded-pill btn-success p-2 px-4 mt-5 btn-animate"
              >
                Shop Now
              </button>
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
        <div
          class="carousel-inner"
          data-aos="fade-up"
          data-aos-delay="150"
          data-aos-duration="2000"
          data-aos-easing="ease-in-out"
          data-aos-once="true"
        >
          <!-- First slide with 4 cards -->
          <div class="carousel-item active">
            <div class="row d-flex justify-content-center">
              <div class="col-6 col-md-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 5" />
                  <div class="card-body">
                    <h5 class="card-title">Product 24</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 6" />
                  <div class="card-body">
                    <h5 class="card-title">Product 25</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 7" />
                  <div class="card-body">
                    <h5 class="card-title">Product 26</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 8" />
                  <div class="card-body">
                    <h5 class="card-title">Product 27</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Second slide with 4 new cards (repeat layout) -->
          <div class="carousel-item">
            <div class="row d-flex justify-content-center">
              <div class="col-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 5" />
                  <div class="card-body">
                    <h5 class="card-title">Product 24</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 6" />
                  <div class="card-body">
                    <h5 class="card-title">Product 25</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 7" />
                  <div class="card-body">
                    <h5 class="card-title">Product 26</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 8" />
                  <div class="card-body">
                    <h5 class="card-title">Product 27</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
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

      <div id="productCarousel" class="carousel slide mt-5" data-bs-ride="carousel">
        <div
          class="carousel-inner"
          data-aos="fade-up"
          data-aos-delay="150"
          data-aos-duration="2000"
          data-aos-easing="ease-in-out"
          data-aos-once="true"
        >
          <!-- First slide with 4 cards -->
          <div class="carousel-item active">
            <div class="row d-flex justify-content-center">
              <div class="col-6 col-md-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 5" />
                  <div class="card-body">
                    <h5 class="card-title">Product 24</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 6" />
                  <div class="card-body">
                    <h5 class="card-title">Product 25</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 7" />
                  <div class="card-body">
                    <h5 class="card-title">Product 26</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-6 col-md-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 8" />
                  <div class="card-body">
                    <h5 class="card-title">Product 27</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Second slide with 4 new cards (repeat layout) -->
          <div class="carousel-item">
            <div class="row d-flex justify-content-center">
              <div class="col-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 5" />
                  <div class="card-body">
                    <h5 class="card-title">Product 24</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 6" />
                  <div class="card-body">
                    <h5 class="card-title">Product 25</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 7" />
                  <div class="card-body">
                    <h5 class="card-title">Product 26</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
              <div class="col-3">
                <div class="card">
                  <img src="./images/Carrots.jpg" class="card-img-top" alt="Image 8" />
                  <div class="card-body">
                    <h5 class="card-title">Product 27</h5>
                    <p class="card-text">Description here.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
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
          <i class="text-white h2 bi bi-arrow-left-circle"></i>
        </button>
        <button
          class="carousel-control-next mx-5"
          type="button"
          data-bs-target="#productCarousel"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
          <i class="text-white h2 bi bi-arrow-right-circle"></i>
        </button>
      </div>
    </div>
    </section>
<!-- footer -->
<div class="">

    <footer class="bg-dark text-center text-white">
    <!-- Grid container -->
    <div class="container p-4 pb-0">
        <h2 class="mt-2 mb-4 text-center">Natura</h2>
      <!-- Section: Social media -->
      <section class="mb-4">
        <!-- Facebook -->
        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
          ><i class="fab fa-facebook-f"></i
        ></a>
  
        <!-- Twitter -->
        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
          ><i class="fab fa-twitter"></i
        ></a>
  
        <!-- Google -->
        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
          ><i class="fab fa-google"></i
        ></a>
  
        <!-- Instagram -->
        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
          ><i class="fab fa-instagram"></i
        ></a>
  
        <!-- Linkedin -->
        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
          ><i class="fab fa-linkedin-in"></i
        ></a>
  
        <!-- Github -->
        <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
          ><i class="fab fa-github"></i
        ></a>
      </section>
      <!-- Section: Social media -->
    </div>
    <!-- Grid container -->
  
    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
      © 2024 Copyright:
      <a class="text-white" href="https://natura.com/">Natura.com</a>
    </div>
    <!-- Copyright -->
  </footer>
    
  </div>
  <!-- End of .container -->
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

