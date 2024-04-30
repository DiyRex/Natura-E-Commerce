<%-- 
    Document   : admin_sidebar
    Created on : Apr 29, 2024, 8:15:22 PM
    Author     : Devin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <style>
        .product-img {
            width: 75px;
            height: auto;
        }
        .offcanvas-body {
          padding-bottom: 80px; /* Adjust padding to provide space for the absolute positioned button */
        }
        .fixed-bottom-button {
          position: absolute;
          bottom: 0;
          left: 0;
          right: 0;
          margin: 20px 30px 20px 30px;
        }
        .card-badge {
          position: absolute;
          left: -5px;
          top: -5px;
          border-radius: 100%;
        }
      </style>
</head>
<!-- sidebar -->
            <div
                class="offcanvas offcanvas-start"
                data-bs-scroll="true"
                data-bs-backdrop="false"
                tabindex="-1"
                id="offcanvasScrolling"
                aria-labelledby="offcanvasScrollingLabel"
                style="width: 300px"
                >
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Sidebar</h5>
                    <button
                        type="button"
                        class="btn-close text-reset"
                        data-bs-dismiss="offcanvas"
                        aria-label="Close"
                        ></button>
                </div>
                <div class="offcanvas-body position-relative">
                    <div class="row px-4 py-1">
                        <a
                            href="./index.jsp"
                            class="btn d-block btn-primary text-white"
                            >Home</a
                        >
                    </div>
                    <div class="row px-4 py-1">
                        <a
                            href="./products.jsp"
                            class="btn d-block btn-primary text-white"
                            >Products</a
                        >
                    </div>
                    <div class="row px-4 py-1">
                        <a
                            href="./orders.jsp"
                            class="btn d-block btn-primary text-white"
                            >Orders</a
                        >
                    </div>
                     <div class="row px-4 py-1">
                        <a
                            href="./users.jsp"
                            class="btn d-block btn-primary text-white"
                            >Users</a
                        >
                    </div>
                    <a
                        href="#"
                        class="btn d-block btn-primary text-white fixed-bottom-button"
                        >Logout</a
                    >
                </div>
            </div>
            <!-- end sidebar -->
