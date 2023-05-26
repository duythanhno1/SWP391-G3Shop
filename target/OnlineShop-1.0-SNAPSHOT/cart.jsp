<%-- 
    Document   : cart
    Created on : Jun 8, 2022, 1:04:52 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart</title>
        <link rel="shortcut icon" type="image/x-icon" href="https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36682/36682.png" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
    </head>

    <body>
        <jsp:include page="./layout/header.jsp"/>
        <section class="section-product-list">




            <div class="container col-md-12">
                <div class="row">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Shopping Cart</a></li>
                        </ol>
                    </nav>
                    <div class="sider col-md-3">
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
                    <div class="col-md-9">
                        <div id="cart-summary">
                                                    </div>
                        <div class="cart-content">
                            <div class="col-md-12">
                                <table>
                                    <thead>
                                        <tr>
                                            <td>Images</td>
                                            <td>Title</td>
                                            <td>Price</td>
                                            <td>Quantity</td>
                                            <td>Total</td>
                                            <td>Delete</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.cart}" var="c">
                                            <tr>
                                                <td class="cart-item-img">
                                                    <a href="./ProductDetail?pid=${c.value.product.getId()}" style="display:block"><img
                                                            src="${c.value.product.img}"
                                                            width="100px;" alt=""></a>
                                                </td>
                                                <td class="cart-pro-title">
                                                    <h4>${c.value.product.title}</h4>
                                                </td>
                                                <td class="cart-item-price">
                                                    <p>${c.value.product.salePrice}</p>

                                                </td>
                                                <td class="cart_quantity">
                                                    <div class="cart_quantity_button">
                                                        <form action="cart">
                                                            <input onchange="this.form.submit()" type="number" name="quantity" min="1" value="${c.value.quantity}"> 
                                                            <input type="hidden" name="pid" value="${c.value.product.id}"> 
                                                        </form>  
                                                    </div>
                                                </td>
                                                <td class="cart_total">
                                                    <p class="cart_total_price">${c.value.product.salePrice*c.value.quantity}</p>
                                                </td>
                                                <td class="cart_delete">
                                                    <a class="cart_quantity_delete" href="delCart?pid=${c.value.product.id}"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-12">
                        <div id="cart-summary">
                            <table>
                                <tr>
                                    <td >Purchase amount</td>
                                    <td>${total}</td>
                                </tr>
                                <tr>
                                    <td >Number of products</td>
                                    <td>${count}</td>
                                </tr>	
                                <tr>
                                    <td >Shipping cod</td>
                                    <td>Free</td>
                                </tr>
                                <tr>
                                    <td ><a href="contact">Contact</a></td>
                                    <td><a href="ProductList">Buy more</a></td>
                                </tr>
                            </table>
                        </div>
                        </div>


                    </div>
                </div>

            </div>


        </section>
        <jsp:include page="./layout/footer.jsp"/>


        <script src="js/bootstrap.js"></script>
        <c:if test="${messageError != null}">
            <script>
                                                                alert("${messageError}")
            </script>
        </c:if>

    </body>

</html>