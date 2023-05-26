<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
    </head>

    <body>
        <jsp:include page="./layout/header.jsp" />

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
                    <div class="feedback-content">
                        <h1>Send Feedback</h1>
                        <div class="main-content">
                            <form action="SendFeedback" method="post" onsubmit="return checkInput();">
                                <div class="product-info">
                                    <h3>Product Information</h3>
                                    <p><b>Name: </b>${product.getTitle()}</p>
                                    <p><b>Price: </b>${product.getPrice()} $ </p>
                                    <p><b>Category: </b>${product.getCategory()}</p>
                                    <p><b>Brand: </b>${product.getBrand()}</p>
                                </div>
                                <span><b>Feedback content:</b></span>
                                <textarea name="feedbackContent" id="feedbackContent"></textarea>
                                <span id="invalid" style="color: red;"> ${sessionScope['messc']}</span>
                                <div><b>Feedback Rate: </b></div>

                                <div class="rate">
                                    <input type="radio" id="star5" name="rate" value="5" />
                                    <label for="star5" title="text">5 stars</label>
                                    <input type="radio" id="star4" name="rate" value="4" />
                                    <label for="star4" title="text">4 stars</label>
                                    <input type="radio" id="star3" name="rate" value="3"/>
                                    <label for="star3" title="text">3 stars</label>
                                    <input type="radio" id="star2" name="rate" value="2"  />
                                    <label for="star2" title="text">2 stars</label>
                                    <input type="radio" id="star1" name="rate" value="1" checked/>
                                    <label for="star1" title="text">1 star</label>
                                </div><br><br>
                                <span><b>Feedback Image:  </b></span>
                                <input type="file" id="fbimg" name="fbimg" onchange="changeFbimg()" accept=".jpg, .jpeg, .png"><br>

                                <span  id="invalid1" style="color: red;" > </span><br>
                                <input name="img" id="sendimg" type="hidden" >
                                <input name="pid" value="${product.getId()}" type="hidden">
                                <input type="submit" value="Submit" class="submit" >

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="./layout/footer.jsp" />
        <script src="./js/bootstrap.js"></script>
        <script src="./js/main.js"></script>
        <script>
                                    function checkInput() {
                                        var content = document.getElementById("feedbackContent");
                                        var img = document.getElementById("fbimg");
                                        console.log(1);
                                        var a = 0;
                                        if (content.value == "") {
                                            document.getElementById("invalid").innerHTML = "Content of feedback not allow empty!"
                                            a = 1;
                                        }
                                        if (content.value.length > 200) {
                                            document.getElementById("invalid").innerHTML = "Content of feedback must less than 200 character!"
                                            a = 1;
                                        }
                                        if (img.value == "") {
                                            document.getElementById("invalid1").innerHTML = "Please choose 1 picture!"
                                            a = 1;
                                        }
                                        console.log(1);
                                        if (a == 1) {
                                            return false;
                                        } else {
                                            return true;
                                        }

                                    }
                                    function changeFbimg() {
                                        var file = document.getElementById("fbimg").files[0];
                                        if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                                            if (file.size / (1024 * 1024) < 5) {
                                                var fileReader = new FileReader();
                                                fileReader.readAsDataURL(file);
                                                fileReader.onload = function () {
                                                    document.getElementById("sendimg").value = (fileReader.result);
                                                }
                                            } else {
                                                uploadError();
                                            }
                                        } else {
                                            uploadError();
                                        }
                                    }
                                    function uploadError() {
                                        alert('Please upload photo file < 5MB')
                                        document.getElementById("fbimg").files[0].value = ''
                                        document.getElementById("fbimg").type = '';
                                        document.getElementById("fbimg").type = 'file';
                                    }
                                    function  checksubmit() {
                                        if (document.getElementById("feedbackContent").value.length > 200) {
                                            document.getElementById('invalid').style.display = "block";
                                            return false;
                                        }
                                        if (document.getElementById("fbimg").value == "") {
                                            document.getElementById('invalid2').style.display = "block";
                                            return false;
                                        }
                                        return true;
                                    }
        </script>
    </body>

</html>