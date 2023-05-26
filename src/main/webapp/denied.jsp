<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>404 Page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/main.css">

    </head>

    <body class="biolife-body" style="margin: 0;">
        <div class="header-top">
            <div class="container">
                <div class="top-bar left">
                    <ul>
                        <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i> thientm01@gmail.com</a></li>
                        <li><a href="#">Free Shipping for all Order of $99</a></li>
                    </ul>
                </div>
                <div class="top-bar right">
                    <ul>
                    </ul>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="container">
                <div class="main-content">
                    <div class="logo">
                        <img onclick="window.location = 'Home'" src="images/logo.png" alt="biolife logo" width="auto" height="120">
                    </div>
                    <div class="main-menu">
                        <ul>
                            <li><a href="Home">Home</a></li>
                            <li><a href="ProductList">Product</a></li>
                            <li><a href="Blog">Blog</a></li>
                            <li><a href="CartView">Cart</a></li>
                        </ul>
                        <div class="search">
                            <form action="BlogSearch" class="form-search" method="GET">
                                <input type="text" name="blogName" class="input-text" value=""
                                       placeholder="Search blog here...">
                                <button type="submit" class="btn-submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="cart">
                        <a href="CartView"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main content -->
        <div class="page-contain page-404">

            <div id="main-content" class="main-content">
                <div class="container">

                    <div class="row">

                        <div class="content-404">
                            <h1 class="heading">404</h1>
                            <h2 class="title">Oops! That page can't be found.</h2>
                            <p>Sorry, but the page you are looking for is not found. Please, make sure you have typed the current URL.</p>
                            <div class="button"><a  href="./Home">Go to Home</a> </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>

        <jsp:include page="./layout/footer.jsp"/>


        <!-- Scroll Top Button -->
        <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

        <script src="assets/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>