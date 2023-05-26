<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product List</title>
        <link rel="shortcut icon" type="image/x-icon" href="https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36682/36682.png" />
        <link rel="stylesheet" href="./css/main.css">

        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">

    </head>

    <body class="biolife-body">

        <jsp:include page="./layout/header.jsp"/>
        <!--Navigation  section-->
        <section class="section-product-list">
            <div class="container">

                <div class="main-section-content">
                    <div class="sider">
                        <div class="search">


                            <div class="latest-product">
                                <h5>Latest  Post</h5>
                                <c:forEach var="pro" items="${reList}">
                                    <div style="border: 1px solid lightgray;padding: 5px;">
                                        <h5 class="latest-product-title"  ><a href="BlogDetail?id=${pro.blog_id}" class="product-name" style="font-weight: bold;text-decoration: none; color: black">${pro.blog_title}</a></h5>
                                        <div class="latest-product-item">
                                            <a href="BlogDetail?id=${pro.blog_id}" title="product thumbnail" style="width: 45%;"><img src="${pro.image}" alt="" width="100%"></a>
                                            <div class="latest-product-info">
                                                <p class="latest-product-title product-description" style="padding-left: 8px;" ><a href="BlogDetail?id=${pro.blog_id}" class="product-name" style="font-size: 12px;">${pro.description}....</a></p>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="display-list">

                        <div class="product-list">

                            <div class="product-item" style="height: 90%;width: 90%">
                                <h1 class="product-title" style="text-align: center; color: black;margin-bottom: 15px;">${blog.blog_title}</h1>

                                <div title="product thumbnail" style="display: flex; justify-content: center;"><img src="${blog.image}" alt="" width="60%"></div>
                                <div class="product-info">
                                    <h4 class="product-title "><a class="product-name blog-cate">Category: ${blog.blogCategory}</a></h4>
                                    <h4 class="product-title "><a class="product-name blog-cate">Author: ${blog.userName}</a></h4>
                                    <h4 class="product-title "><a class="product-name mid">Post Date: ${blog.post_date.toString()}</a></h4>
                                    <br>
                                    <div class="product-description">
                                        <span>${blog.description}</span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="./layout/footer.jsp"/>
        <!-- Scroll Top Button -->
        <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

        <script src="./js/bootstrap.js"></script>
        <script src="./js/main.js"></script>

    </body>

</html>