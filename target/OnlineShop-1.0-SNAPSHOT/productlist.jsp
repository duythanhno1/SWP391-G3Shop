<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <c:if test="${param['index']==null }">   
            <c:set var = "index" scope = "page" value = "1"/>
        </c:if>
        <c:if test="${param['index']!=null}">
            <c:set var = "index" scope = "page" value = "${param['index']}"/>
        </c:if>
        <jsp:include page="./layout/header.jsp"/>
        <!--Navigation  section-->
        <section class="section-product-list">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./Home">Home </a></li>
                        <li class="breadcrumb-item"><a href="./ProductList?index=1">Product List</a></li>
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
                                            <div class="${cate.getSetting_id()==param['categoryId']?"":"collapse"}" id="sublist${cate.getSetting_id()}">
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
                                                <a href="./ProductDetail?pid=${pro.getId()}" style="background-color: #747474;"class="product-btn"> Show</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="display-list">
                        <div class="filter">
                            <form action="ProductList" name="frm-refine" method="get">
                                <div class="left">
                                    <span class="filter-title">Refine </span>
                                    <select name="categoryId">
                                        <option value="">Category</option>
                                        <c:forEach var="cate" items="${cate}">
                                            <option value="${cate.getSetting_id()}" ${cate.getSetting_id()==param['categoryId']?"selected":""}>${cate.getValue()}</option>
                                        </c:forEach>
                                    </select>
                                    <select name="brandId">
                                        <option value="">Brands</option>
                                        <c:forEach var="brand" items="${brand}">
                                            <option value="${brand.getSetting_id()}" ${brand.getSetting_id()==param['brandId']?"selected":""}>${brand.getValue()}</option>

                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="right" >
                                    <span class="filter-title">Sort </span>
                                    <select name="orderby">
                                        <option  ${param['orderby']==1?"selected":""} value="1" >Date</option>
                                        <option  ${param['orderby']==2?"selected":""} value="2">price: low to high</option>
                                        <option  ${param['orderby']==3?"selected":""} value="3">price: high to low</option>
                                    </select>
                                    <button type="submit" style="background-color: #242424" value="Go" id="submit_pfilter" >GO</button> 
                                </div>
                            </form>
                        </div>
                        <div class="product-list">
                            <c:forEach var="pro" items="${prolist}">
                                <div class="product-item">
                                    <a href="./ProductDetail?pid=${pro.getId()}" title="product thumbnail" ><img src="${pro.getImg()}" alt="" width="100%"></a>
                                    <div class="product-info">
                                        <b class="categories">${pro.getBrand()} - ${pro.getCategory()}</b>
                                        <h4 class="product-title"><a href="./ProductDetail?pid=${pro.getId()}" class="product-name">${pro.getTitle()}</a></h4>
                                        <div class="price">
                                            <p><span class="price-amount"><span>$</span>${pro.getSalePrice()}</span></p>
                                            <del><span class="price-amount"><span>$</span>${pro.getPrice()}</span></del>
                                        </div>
                                        <div class="product-description">
                                            <p>${pro.getDescription()}....</p>
                                        </div>
                                        <div class="btn-list">
                                            <a href="./cart?pid=${pro.getId()}&quantity=1" class="product-btn" style="background-color: #242424;"onclick="addCart()"><i class="fa fa-cart-arrow-down"></i> ADD TO CART</a>
<!--                                            <a href="./SendFeedback?pid=${pro.getId()}" id="sendfb" class="product-btn" ${sessionScope['account'] == null?"onclick='warmLogin(this)'":""}><i class="fa fa-commenting-o" ></i> FEED BACK</a>-->
                                            <a href="./ProductDetail?pid=${pro.getId()}" class="product-btn" style="background-color: #242424;"><i class="fa fa-eye" ></i> Show more</a>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="pagination-arena">
                            <ul class="pagination">
                                <li class="page-item"><a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=1&search=${param['search']}" class="page-link"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                <li class="page-item">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index-2}&search=${param['search']}" class="page-link ${index-2<1?"d-none":""}">${index-2}</a></li>
                                <li class="page-item">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index-1}&search=${param['search']}" class="page-link ${index-1<1?"d-none":""}">${index-1}</a></li>
                                <li class="page-item active">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index}&search=${param['search']}" class="page-link">${index}</a></li>
                                <li class="page-item">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index+1}&search=${param['search']}" class="page-link ${index+1>numberPage?"d-none":""}" >${index+1}</a></li>
                                <li class="page-item">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index+2}&search=${param['search']}" class="page-link ${index+2>numberPage?"d-none":""}">${index+2}</a></li>
                                <li><a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${numberPage}&search=${param['search']}" class="page-link"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                            </ul>
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