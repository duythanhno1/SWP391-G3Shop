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
        <title>Cart</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <style>
            /*cart-content*/
            #cart-summary{
                width: 30%;
                margin: 0 auto;
                background-color: #f0f0e9d9;
            }
            #cart-summary table{
                text-align: center;
                width: 100%;
            }
            #cart-summary table tr td{
                padding: 10px;
            }
            #cart-summary table a{
                background-color:#4a90e2 ;
                color: #fff;
                border-radius: 50px;
                padding: 8px;
                text-decoration: none;
            }
            .cart-content {
                width: 100%;
            }
            .cart-content table {
                width: 100%;
                margin: 10px 0;
            }
            .cart-content table tr td{
                padding: 5px 0;
                text-align: center;
            }
            .cart-content table thead tr td{
                background-color:#4a90e2;
                padding: 10px 20px;
                font-size: 17px;
                font-weight: 600;
            }
            .cart-content .cart-pro-title a{
                text-decoration: none;
                color: black;
            }
            .cart-item-price span{
                padding: 5px;

            }
            .cart-item-price p{
                width: 40%;
                margin: none;
                display: inline-block;
                font-weight: 500;
            }
            .cart-item-price del{
                color:gray;
            }
            .cart_quantity {
                position: relative;
            }
            .cart_quantity_button{
                width: 100%;
                padding: 0 20px;

            }
            .cart_quantity input{
                font-size: 18px;
                color: #888888;
                text-align: left;
                background-color: #f3f3f3;
                line-height: 1;
                border: none;
                width: 100%;
                height: auto;
                outline: none;
                padding: 10px 15px;
                border-radius: 50px;
            }
            .cart_quantity a{
                text-decoration: none;
                font-weight: bold;
                font-size: 20px;	
                display: inline-block;
                position: absolute;
                right: 32px;	
            }
            .cart_quantity_up{
                top: 33px;

            }
            .cart_quantity_down{
                top: 45px;
            }
            .cart_delete a{
                text-decoration: none;
                color:red;
                font-size: 30px;
                font-weight: 100;
            }
        </style>
    </head>

    <body>
        <jsp:include page="./layout/header.jsp"/>
        <section class="section-product-list">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shopping Cart</a></li>
                    </ol>
                </nav>
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
                            <td ><a>Check out</a></td>
                            <td><a>Buy more</a></td>
                        </tr>
                    </table>
                </div>
                <div class="cart-content">
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
                            <c:forEach items="${cart}" var="c">
                                <tr>
                                    <td class="cart-item-img">
                                        <a href="" style="display:block"><img
                                                src="${c.value.product.img}"
                                                width="100px;" alt=""></a>
                                    </td>
                                    <td class="cart-pro-title">
                                        <h4>${c.value.product.title}</h4>
                                    </td>
                                    <td class="cart-item-price">
                                        <p>${c.value.product.salePrice}</p><del>${c.value.product.price}</del>

                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <form action="updateQuan">
                                                <input onchange="this.form.submit()" type="number" name="quantity" value="${c.value.quantity}"> 
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
                    <nav aria-label="...">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <span class="page-link">Previous</span>
                            </li>
                            <li class="page-item  active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item">
                                <span class="page-link">
                                    2
                                    <span class="sr-only">(current)</span>
                                </span>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </section>

        <footer>
            <div class="container">
                <div class="footer-left">
                    <h4>Useful Links</h4>
                    <a href="#">Login</a><br />
                    <a href="#">Home</a><br />
                    <a href="#">Product</a><br />
                    <a href="#">Blog</a>

                </div>
                <div class="footer-right">
                    <h4>Contact To Us</h4>
                    <p>Address: Number 325, Kim Nguu, Quan Hai Ba Trung,Ha Noi</p>
                    <p>Phone: (+84) 378387188</p>
                    <p>Email: thientm01@gmail.com</p>
                </div>
            </div>
            <div class="footer-bottom">
                Copyright © 2022. Designed by Group2
            </div>
        </footer>
        <script src="js/bootstrap.js"></script>
    </body>

</html>