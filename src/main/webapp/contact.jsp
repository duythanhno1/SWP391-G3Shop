<%-- 
    Document   : contact
    Created on : Jun 14, 2022, 1:00:44 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cart Contact</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <body>
        <jsp:include page="./layout/header.jsp"/>
        <div class="container">
            <div class="row">
                <div class="sider col-md-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Shopping Cart</a></li>
                        </ol>
                    </nav>
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

                    <div class="orderdetails-content">
                        <div class="id-status-order">
                            <span class="status-order">Cart Contact</span>
                        </div>

                        <form action="MyOrder" method="post">

                            <c:forEach items="${cart}" var="c">
                                <div class="products-container">
                                    <div class="left-container">
                                        <div class="img-container">
                                            <img class="product-img" onclick="window.location = 'ProductDetail?pid=${c.value.product.id}'" src="${c.value.product.img}" alt="">
                                        </div>
                                        <div class="product-content">
                                            <div onclick="window.location = 'ProductDetail?pid=${c.value.product.id}'" class="name-product">${c.value.product.title}</div>
                                            <div onclick="window.location = 'ProductDetail?pid=${c.value.product.id}'" class="quantity-product">x${c.value.quantity}</div>
                                        </div>
                                    </div>
                                    <div class="right-container">
                                        <div class="product-price">
                                            <span class="price">${c.value.product.salePrice*c.value.quantity}$</span>
                                            <span class="sale-price">${c.value.product.salePrice}$</span>
                                        </div>
                                    </div>
                                </div>   
                                     
                                        <input type="hidden" name="order_id" value="${order_id}">
                                        <input type="hidden" name="quantity" value="${c.value.quantity}">
                                        <input type="hidden" name="product_id" value="${c.value.product.id}">
                                        <input type="hidden" name="author_id" value="${account.user_id}">
                                        <input type="hidden" name="title" value="${c.value.product.title}">
                                        <input type="hidden" name="brand_id" value="${c.value.product.brand}">
                                        <input type="hidden" name="price" value="${c.value.product.price}">
                                        <input type="hidden" name="sale_price" value="${c.value.product.salePrice}">
                                        <input type="hidden" name="stock" value="${c.value.product.stock}">
                                        <input type="hidden" name="description" value="${c.value.product.description}">
                                        <input type="hidden" name="img" value="${c.value.product.img}">
                                        <input type="hidden" name="category_id" value="${c.value.product.category}">
                             
                            </c:forEach>
                            <div class="hr"></div>
                            <div class="info-container">
                                <div class="order-info">
                                    <div class="img-container">
                                    </div>

                                    <div class="deliadd">Delivery address</div>
                                    <div class="fullname-container">Fullname: <span class="fullname">${account.fullname}</span></div>
                                    <input type="hidden" name="action" value="addOrder">
                                    <input class="fullname" type="hidden" name="fullname">

                                    <div class="phone-address">
                                        <span class="phone">${account.phone}</span><br><span class="address">${account.address}</span>
                                        <input class="phone" type="hidden" name="phone">
                                        <input class="address" type="hidden" name="address">

                                    </div>
                                    <div class="email-container">Email: <span class="emaila">${account.email}</span></div>
                                    <input class="emaila" type="hidden" name="emaila">

                                    <div href="#changeAddress" data-toggle="modal" class="change-container"><div class="changeda">Change</div></div>

                                </div>
                                <div class="div-mid">

                                    <div class="form-check">
                                        <input class="form-check-input" value="8" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Payment on delivery
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" value="9" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Payment by bank
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label style="font-weight: bold" for="exampleFormControlTextarea1">Notes</label>
                                        <textarea name="textarea" maxlength="50" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="div-right">

                                    <div class="total-prices">Total Price:&nbsp;&nbsp;&nbsp; <span class="bottoms">${total}$</span></div>
                                    <input type="hidden" name="total" value="${total}">
                                    <input type="submit" style="margin-top: 25px; background-color:peru" class="btn-feedback" value="Order">


                                </div>
                            </div>
                        </form>

                    </div>
                </div>




            </div>
        </div>
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="changeAddress" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Change Delivery Address</h4>
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                    </div>
                    <div class="modal-body">

                        <form>
                            <div class="form-group">
                                <label>Fullname</label>
                                <div class="col-lg-12">
                                    <input type="text" maxlength="50" required="" id="fullnamect" class="form-control" placeholder="Fullname">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Phone number</label>
                                <div class="col-lg-12">
                                    <input type="text" maxlength="11" required="" id="phonect" class="form-control" placeholder="Phone number">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <div class="col-lg-12">
                                    <input type="text" maxlength="100" required="" id="addressct" class="form-control" placeholder="Address">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <div class="col-lg-12">
                                    <input type="email" maxlength="100" required="" id="emailct" class="form-control" placeholder="Email">
                                </div>
                            </div>
                            <span style="color: red;
                                  font-weight: 500;" id="msgChangePass">
                            </span>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-12">
                                    <input onclick="btnChangeAddress()" type="button" class="btn btn-danger" value="Save Changes">
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <jsp:include page="./layout/footer.jsp"/>

        <script src="js/bootstrap.js"></script>
        <script>
                                        document.getElementsByClassName("fullname")[1].value = document.getElementsByClassName("fullname")[0].innerHTML;
                                        document.getElementsByClassName("phone")[1].value = document.getElementsByClassName("phone")[0].innerHTML;
                                        document.getElementsByClassName("address")[1].value = document.getElementsByClassName("address")[0].innerHTML;
                                        document.getElementsByClassName("emaila")[1].value = document.getElementsByClassName("emaila")[0].innerHTML;


                                        function btnChangeAddress() {
                                            if(document.getElementById("fullnamect").value==''||document.getElementById("phonect").value==''||document.getElementById("addressct").value==''||document.getElementById("emailct").value==''){
                                                alert('Please do not enter blank');
                                                return;
                                            }
                                            document.getElementsByClassName("fullname")[0].innerHTML = document.getElementById("fullnamect").value;
                                            document.getElementsByClassName("phone")[0].innerHTML = document.getElementById("phonect").value;
                                            document.getElementsByClassName("address")[0].innerHTML = document.getElementById("addressct").value;
                                            document.getElementsByClassName("emaila")[0].innerHTML = document.getElementById("emailct").value;

                                            document.getElementsByClassName("fullname")[1].value = document.getElementsByClassName("fullname")[0].innerHTML;
                                            document.getElementsByClassName("phone")[1].value = document.getElementsByClassName("phone")[0].innerHTML;
                                            document.getElementsByClassName("address")[1].value = document.getElementsByClassName("address")[0].innerHTML;
                                            document.getElementsByClassName("emaila")[1].value = document.getElementsByClassName("emaila")[0].innerHTML;


                                            document.getElementById("changeAddress").style.display = "none";
                                            document.querySelector('body > div.modal-backdrop.fade.show').style.display = "none";
                                        }
        </script>
    </body>
</html>


