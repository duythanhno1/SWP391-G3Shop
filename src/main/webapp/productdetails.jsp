<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${product.getTitle()}</title>
        <link rel="shortcut icon" type="image/x-icon" href="https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36682/36682.png" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    </head>

    <body>
        <jsp:include page="./layout/header.jsp"/>

        <!--Navigation section-->
        <section class="section-product-detail">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./Home">Home </a></li>
                        <li class="breadcrumb-item"><a href="./ProductList?index=1">Product List</a></li>
                        <li class="breadcrumb-item active">Product details</li>
                    </ol>   
                </nav> 
                <div class="main-section-content">
                    <div class="sider">
                        <div class="search">
                            <form action="ProductList?index=1" class="form-search" method="get">
                                <input type="text" name="search" class="input-text" value="${param['search']}" placeholder="Search product here...">
                                <button type="submit" class="btn-submit"><i class="fa fa-search"></i></button>
                            </form>
                            <div class="side-item">
                                <h5>Category</h5>
                                <ul class="cat-list">
                                    <c:forEach var="cate" items="${cate}">
                                        <li class="cat-list-item "><a href="#sublist${cate.getSetting_id()}" data-bs-toggle="collapse" class="${cate.getSetting_id()==param['categoryId']?"fw-bold":""}">${cate.getValue()}</a>
                                            <div class="collapse" id="sublist${cate.getSetting_id()}">
                                                <div class="card card-body " style="border: none;">
                                                    <c:forEach var="brand" items="${brand}">
                                                        <a href="./ProductList?brandId=${brand.getSetting_id()}&categoryId=${cate.getSetting_id()}&orderby=&index=1&search=${param['search']}" 
                                                           class="${brand.getSetting_id()==param['brandId']&&cate.getSetting_id()==param['categoryId']?"fw-bold":""} sub-cate-item" >- ${brand.getValue()}</a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="latest-product">
                                <h5>Latest  Product</h5>
                                <c:forEach var="pro" items="${prolist5}">
                                    <div class="latest-product-item">
                                        <a href="./ProductDetail?pid=${pro.getId()}" title="product thumbnail" style="width: 45%;"><img src="${pro.getImg()}" alt="" width="100%"></a>
                                        <div class="latest-product-info">
                                            <h4 class="latest-product-title"><a href="./ProductDetail?pid=${pro.getId()}" class="product-name">${pro.getTitle()}</a></h4>
                                            <div class="latest-product-price">
                                                <p><span class="price-amount"><span>$</span>${pro.getSalePrice()} </span></p>
                                                <del><span class="price-amount"><span>$</span>${pro.getPrice()}</span></del>
                                            </div>
                                            <div class="btn-list">
                                                <a href="./ProductDetail?pid=${pro.getId()}" class="product-btn"> Show</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="product-details">
                        <div class="product-img">
                            <a href="#"><img src="${product.getImg()}" width="100%"></a>
                        </div>
                        <div class="product-detail-info">
                            <h1>${product.getTitle()}</h1>
                            <div class="star-ratings">
                                <div class="fill-ratings" >
                                    <p>${numberFb}</p>
                                </div>
                            </div>
                            <h5>Category: ${product.getCategory()}</h5>
                            <h5>Brand: ${product.getBrand()}</h5>
                            <div class="product-price">
                                <p><span class="price-amount"><span class="currencySymbol">$</span>${product.getSalePrice()}</span></p>
                                <del><span class="price-amount"><span class="currencySymbol">$</span>${product.getPrice()}</span></del>
                            </div>
                            <div class="details-description">
                                <p><b>Available in stock:</b> ${product.getStock()}</p>
                                <p><b>Description: </b>${product.getDescription()}</p>
                            </div>
                            <div class="btn-pro-details">
                                <form action="cart" >
                                    <input type="number"  name="quantity"  min="1" value="1"  max="${product.getStock()-quantityincart}">
                                    <input type="hidden" name="pid" value="${product.id}"> 
                                    <button class="submit" style="background-color: #242424;" type="submit" value="Add To Cart">Add To Cart</button>
                                </form>
                            </div>
                        </div>
                        <div class="display-feedback">
                            <h2 style="padding: 10px; border-bottom: 1px solid lightgray; margin-top: 20px;">Feed Back list</h2>
                            <c:forEach items="${fblist}" var="fb">
                                <div class="feedback-item" style="height: 180px;">
                                    <div class="fb-content">
                                        <div class="avatar"><img src="${fb.getUser().getAvatar()}" class="rounded-circle" alt="avatar" height="50px" width="50px"> <span >${fb.getUser().getFullname()} - ${fb.getRated()}<i class="fa fa-star" style="color: red;"></i></span></div>
                                        <p>Date: ${fb.getFeedback_date()}</p>
                                        <span class="description" style="width:70% ">${fb.getFb_content()}</span>
                                    </div>
                                    <div class="fb-img"> 
                                        <image src="${fb.getImage()}" height="120px;" >
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="recommend-items">
                            <h2 style="text-align: center;padding: 10px; border-bottom: 1px solid lightgray;">Recommend items</h2>
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="row">
                                            <c:forEach items="${recommend1}" var="pro">
                                                <div class="product-item col-4">
                                                    <a href="./ProductDetail?pid=${pro.getId()}" title="product thumbnail" ><img src="${pro.getImg()}" alt="" width="100%"></a>
                                                    <div class="product-info">
                                                        <b class="categories">${pro.getBrand()} - ${pro.getCategory()}</b>
                                                        <h4 class="product-title"><a href="./ProductDetail?pid=${pro.getId()}" class="product-name">${pro.getTitle()}</a></h4>
                                                        <div class="price">
                                                            <p><span class="price-amount"><span>$</span>${pro.getSalePrice()}</span></p>
                                                            <del><span class="price-amount"><span>$</span>${pro.getPrice()}</span></del>
                                                        </div>

                                                        <div class="btn-list">
                                                            <a href="./cart?pid=${pro.getId()}&quantity=1" class="product-btn" style="background-color: #242424;"onclick="addCart()"><i class="fa fa-cart-arrow-down"></i> ADD TO CART</a>
                                                            <a href="./ProductDetail?pid=${pro.getId()}" class="product-btn" style="background-color: #242424;"><i class="fa fa-eye" ></i> Show more</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="carousel-item ">
                                        <div class="row">
                                            <c:forEach items="${recommend2}" var="pro">
                                                <div class="product-item col-4">
                                                    <a href="./ProductDetail?pid=${pro.getId()}" title="product thumbnail" ><img src="${pro.getImg()}" alt="" width="100%"></a>
                                                    <div class="product-info">
                                                        <b class="categories">${pro.getBrand()} - ${pro.getCategory()}</b>
                                                        <h4 class="product-title"><a href="./ProductDetail?pid=${pro.getId()}" class="product-name">${pro.getTitle()}</a></h4>
                                                        <div class="price">
                                                            <p><span class="price-amount"><span>$</span>${pro.getSalePrice()}</span></p>
                                                            <del><span class="price-amount"><span>$</span>${pro.getPrice()}</span></del>
                                                        </div>

                                                        <div class="btn-list">
                                                            <a href="./cart?pid=${pro.getId()}&quantity=1" class="product-btn" onclick="addCart()"><i class="fa fa-cart-arrow-down"></i> ADD TO CART</a>
                                                            <a href="./ProductDetail?pid=${pro.getId()}" class="product-btn"><i class="fa fa-eye" ></i> Show more</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
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