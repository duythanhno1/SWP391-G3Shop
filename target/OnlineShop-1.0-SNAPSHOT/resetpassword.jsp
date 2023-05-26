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
        <title>Reset password</title>
        <link rel="shortcut icon" type="image/x-icon" href="https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36682/36682.png" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">

    </head>

    <body class="biolife-body">
        <jsp:include page="./layout/header.jsp"/>



        <form action="resetpassword" method="post">
            <div class="container-forgot">
                <div class="title-forgot">
                    <h2 class="forgotpassword">Reset Password</h2>
                </div>
                <input type="hidden" name="email" value="${email}">
                <div class="input-forgot"><input name="password" required="" type="password" class="email" placeholder="Password"></div>
                <div class="input-forgot"><input name="repassword" required="" type="password" class="email" placeholder="Re-Password"></div>
                <div class="error-forgot"><span class="msg">${msg}</span></div>
                <div class="btn-forgot"><input type="submit" class="submit" value="Submit"></div>
            </div>
        </form>


        <!----------------------------------------------------------------------------------------------->

        <jsp:include page="./layout/footer.jsp"/>


        <script src="js/main.js"></script>
        <script src="./js/bootstrap.js"></script>
    </body>

</html>