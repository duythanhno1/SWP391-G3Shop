<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biolife - Organic Food</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/slick.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/main-color.css">

</head>

<body class="biolife-body">

                  <jsp:include page="./layout/header.jsp"/>


    <!--Navigation section-->
    <div class="container">
        <nav class="biolife-nav">
            <ul>
                <li class="nav-item"><a href="home.html" class="permal-link">Home</a></li>
                <li class="nav-item"><span class="current-page">Login</span></li>
            </ul>
        </nav>
    </div>

    <div class="page-contain login-page">

        <!-- Main content -->
        <div id="main-content" class="main-content">
            <div class="container">

                <div class="row">

                    <!--Form Sign In-->
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="signin-container">
                            <form action="#" name="frm-login" method="post">
                                <p class="form-row">
                                    <label for="fid-name">Username<span class="requite">*</span></label>
                                    <input type="text" id="fid-name" name="name" value="" class="txt-input">
                                </p>
                                <p class="form-row">
                                    <label for="fid-pass">Password:<span class="requite">*</span></label>
                                    <input type="email" id="fid-pass" name="email" value="" class="txt-input">
                                </p>
                                <p class="form-row wrap-btn">
                                    <button class="btn btn-submit btn-bold" type="submit">sign in</button>
                                    <a href="forgotpassword.html">Forgot your password</a>
                                </p>
                            </form>
                        </div>
                    </div>

                    <!--Go to Register form-->
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="register-in-container">
                            <div class="intro">
                                <h4 class="box-title">New Customer?</h4>

                                <a href="register.html" class="btn btn-bold">Create an account</a>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    </div>
               <jsp:include page="./layout/footer.jsp"/>


    <!-- Scroll Top Button -->
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

    <script src="assets/js/jquery-3.4.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.countdown.min.js"></script>
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <script src="assets/js/jquery.nicescroll.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/biolife.framework.js"></script>
    <script src="assets/js/functions.js"></script>
</body>

</html>