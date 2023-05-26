<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Order</title>
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>

    <body>
        <jsp:include page="./layout/header.jsp" />
        <c:if test="${param['index']==null }">
            <c:set var="index" scope="page" value="1" />
        </c:if>
        <c:if test="${param['index']!=null}">
            <c:set var="index" scope="page" value="${param['index']}" />
        </c:if>
        <section class="section-product-detail">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./Home">Home </a></li>
                        <li class="breadcrumb-item"><a href="./MyOrder">My Order</a></li>
                        <li class="breadcrumb-item active">Order Information</li>
                    </ol>
                </nav>
                <div class="main-section-content">
                    <div class="sider">
                        <div class="search">
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
                                <c:forEach var="pro" items="${latesproduct}">
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

                    <div class="orderdetails-content">
                        <div class="id-status-order">
                            <span class="id-order">Congratulations on your successful order!</span>
                            <span class="status-order">Status order: ${order.setting.value}</span>
                        </div>
                        <c:forEach items="${orderdetails}" var="o">
                            <div class="products-container">
                                <div class="left-container">
                                    <div class="img-container">
                                        <img onclick="window.location = 'ProductDetail?pid=${o.product_id}'" class="product-img" src="${o.image}" alt="">
                                    </div>
                                    <div class="product-content">
                                        <div onclick="window.location = 'ProductDetail?pid=${o.product_id}'" class="name-product">${o.title}</div>
                                        <div class="quantity-product">x${o.quantity}</div>
                                    </div>
                                </div>
                                <div class="right-container">
                                    <div class="product-price">
                                        <span class="price">${o.price}$</span>
                                        <span class="sale-price">${o.sale_price}$</span>
                                    </div>
                                    <c:if test="${order.setting.value=='Received'}">
                                        <div class="feedback-item">
                                            <button class="btn-feedback" onclick="window.location = './SendFeedback?pid=${o.product_id}'">Feedback</button>
                                        </div>
                                    </c:if>
                                </div>

                            </div>

                        </c:forEach>
                        <div class="hr"></div>
                        <div class="info-container">
                            <div class="order-info">
                                <div class="deliadd">Delivery address</div>
                                <div class="fullname">Fullname: ${order.fullname}</div>
                                <div class="address-order">
                                    ${order.phone}<br>${order.address}
                                </div>
                            </div>
                            <div class="div-right">

                                <c:if test="${canCancel!=null}">
                                    <button data-toggle="modal" data-target="#exampleModal"  style="margin-bottom: 25px; background-color:peru" class="btn-feedback">Cancel Order</button>
                                </c:if>
                                <div class="total-prices">Total Price:&nbsp;&nbsp;&nbsp; <span class="bottoms">${order.total}$</span></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Confirm Cancel Order</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div style="text-align: center">Do you want cancel your order?</div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button onclick="window.location = 'cancelorder?oid=${order.order_id}'" type="button" class="btn btn-primary">Cancel Order</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="./layout/footer.jsp" />
        <script src="./js/bootstrap.js"></script>
        <script src="./js/main.js"></script>

    </body>

</html>