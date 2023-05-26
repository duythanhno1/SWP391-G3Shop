<%-- 
    Document   : home
    Created on : May 22, 2022, 2:59:33 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home Page</title>
        <link rel="shortcut icon" type="image/x-icon" href="https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36682/36682.png" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>

    <body class="biolife-body">
        <jsp:include page="./layout/header.jsp"/>
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">

            <div class="carousel-inner">

                <c:forEach items="${listSlide}" var="c" varStatus="count">

                    <div class="carousel-item ${count.count==1?" active":""}">
                        <a href="${c.getBacklink()}"><img src="${c.image}" class="d-block w-100" alt="value"></a>
                        <div class="carousel-caption d-none d-md-block">
                            <h1 class="text-warning">${c.getTitle()}</h1>
                            <h4 class="text-warning">${c.getDescription()}</h4>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <section class="section-product-list">
            <div class="container">
                <div class="main-section-content">
                    <div class="sider">
                        <div class="search">

                            <div class="latest-product">
                                <h5>Latest  Post</h5>
                                <c:forEach var="pro" items="${bloList}">.
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
                        <div>
                            <h1 style="text-align: center" >Featured Product</h1>
                        </div>
                        <div class="product-list">
                            <c:forEach var="pro" items="${prolist}">
                                <div class="product-item">
                                    <a href="ProductDetail?pid=${pro.getId()}" title="product thumbnail" ><img src="${pro.getImg()}" alt="" width="100%"></a>
                                    <div class="product-info">
                                        <h4 class="product-title"><a href="ProductDetail?pid=${pro.getId()}" class="product-name">${pro.getTitle()}</a></h4>
                                        <div class="price">
                                            <p><span class="price-amount"><span>$</span>${pro.getSalePrice()}</span></p>
                                            <del><span class="price-amount"><span>$</span>${pro.getPrice()}</span></del>
                                        </div>
                                        <div class="product-description">
                                            <p>${pro.getDescription()}....</p>
                                        </div>
                                        <div class="btn-list"  >
                                            <a href="ProductDetail?pid=${pro.getId()}" class="product-btn" style="background-color: #242424;"onclick=""><i class="fa fa-eye"></i> Show More</a>
                                            <a href="./cart?pid=${pro.getId()}&quantity=1" class="product-btn" style="background-color: #242424;"onclick="addCart()"><i class="fa fa-cart-arrow-down"></i> ADD TO CART</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>

                </div>
            </div>

        </section>
        <section class="section-product-list">
            <div class="container">
                <div class="main-section-content" style="justify-content: center;">
                    <div class="display-list">
                        <div>
                            <h1 class="text-center" >Hot Post</h1>
                        </div>
                        <div class="product-list">
                            <c:forEach var="p" items="${hotList}">
                                <div class="product-item" style="padding: 15px;">
                                    <a href="BlogDetail?id=${p.blog_id}" title="product thumbnail" ><img src="${p.image}" alt="" width="100%"></a>
                                    <div class="product-info">
                                        <h4 class="product-title"><a href="BlogDetail?id=${p.blog_id}" class="product-name">${p.blog_title}</a></h4>
                                        <div class="product-description">
                                            <p>${p.description}....</p>
                                        </div>

                                    </div>
                                    <div class="btn-list" style="margin-top: 15px;">
                                        <a href="BlogDetail?id=${p.blog_id}" class="product-btn" style="color: white; background-color: #242424;border-radius: 10px;padding: 5px; text-align: center;"> Show</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>

                </div>
            </div>

        </section>


        <!----------------------------------------------------------------------------------------------->

        <jsp:include page="./layout/footer.jsp"/>
        <script src="./js/slide.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="./js/bootstrap.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>

</html>


