<%-- 
    Document   : postdetail
    Created on : Jun 28, 2022, 10:22:33 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!----======== CSS ======== -->
        <link rel="stylesheet" href="style.css">

        <!----===== Iconscout CSS ===== -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

        <meta charset="UTF-8">
        <title>Director | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="./marketing/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="./marketing/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="./marketing/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>

        <!-- Theme style -->
        <link href="./marketing/css/style.css" rel="stylesheet" type="text/css" />
        <style>
            /* ===== Google Font Import - Poppins ===== */
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600&display=swap');
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            body{
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background: rgb(19, 45, 89);
            }
            .container{
                position: relative;
                max-width: 900px;
                width: 100%;
                border-radius: 6px;
                padding: 30px;
                margin: 0 15px;
                background-color: #fff;
                box-shadow: 0 5px 10px rgba(0,0,0,0.1);
            }
            .container header{
                position: relative;
                font-size: 20px;
                font-weight: 600;
                color: #333;
            }
            .container header::before{
                content: "";
                position: absolute;
                left: 0;
                bottom: -2px;
                height: 3px;
                width: 27px;
                border-radius: 8px;
                background-color: #4070f4;
            }
            .container form{
                position: relative;
                margin-top: 16px;
                min-height: 700px;
                background-color: #fff;
                overflow: hidden;
            }
            .container form .form{
                position: absolute;
                background-color: #fff;
                transition: 0.3s ease;
            }
            .container form .form.second{
                opacity: 0;
                pointer-events: none;
                transform: translateX(100%);
            }
            form.secActive .form.second{
                opacity: 1;
                pointer-events: auto;
                transform: translateX(0);
            }
            form.secActive .form.first{
                opacity: 0;
                pointer-events: none;
                transform: translateX(-100%);
            }
            .container form .title{
                display: block;
                margin-bottom: 8px;
                font-size: 16px;
                font-weight: 500;
                margin: 6px 0;
                color: #333;
            }
            .container form .fields{
                display: flex;
                align-items: center;
                justify-content: space-between;
                flex-wrap: wrap;
            }
            form .fields .input-field{
                display: flex;
                width: calc(100% / 3 - 15px);
                flex-direction: column;
                margin: 4px 0;
            }
            .input-field label{
                font-size: 12px;
                font-weight: 500;
                color: #2e2e2e;
            }
            .input-field input, select{
                outline: none;
                font-size: 14px;
                font-weight: 400;
                color: #333;
                border-radius: 5px;
                border: 1px solid #aaa;
                padding: 0 15px;
                height: 42px;
                margin: 8px 0;
            }
            .input-field input :focus,
            .input-field select:focus{
                box-shadow: 0 3px 6px rgba(0,0,0,0.13);
            }
            .input-field select,
            .input-field input[type="date"]{
                color: #707070;
            }
            .input-field input[type="date"]:valid{
                color: #333;
            }
            .container form button, .backBtn{
                display: flex;
                align-items: center;
                justify-content: center;
                height: 45px;
                max-width: 200px;
                width: 100%;
                border: none;
                outline: none;
                color: #fff;
                border-radius: 5px;
                margin: 25px 0;
                background-color: #4070f4;
                transition: all 0.3s linear;
                cursor: pointer;
            }
            .container form .btnText{
                font-size: 14px;
                font-weight: 400;
            }
            form button:hover{
                background-color: #265df2;
            }
            form button i,
            form .backBtn i{
                margin: 0 6px;
            }
            form .backBtn i{
                transform: rotate(180deg);
            }
            form .buttons{
                display: flex;
                align-items: center;
            }
            form .buttons button , .backBtn{
                margin-right: 14px;
            }

            @media (max-width: 750px) {
                .container form{
                    overflow-y: scroll;
                }
                .container form::-webkit-scrollbar{
                    display: none;
                }
                form .fields .input-field{
                    width: calc(100% / 2 - 15px);
                }
            }

            @media (max-width: 550px) {
                form .fields .input-field{
                    width: 100%;
                }
            }

        </style>
    </head>
    <body>
        <div class="container">
            <header>Post Detail</header>

            <form action="actionPost" method="post">
                <div class="form first">
                    <div class="details personal">


                        <div class="fields" style="display: flex;">
                            <div class="input-field" >
                                <label>Title</label>
                                <textarea type="text" required style="height: 100px;" name="title" >${title}</textarea>
                            </div>

                            <div>
                                <div class="input-field">
                                    <label>Status</label>
                                    <select name="status2" style="width: 200px;">
                                        <option value="1" ${status2 == true?'selected':''} >Active</option>
                                        <option value="0" ${status2 == false?'selected':''}>Inactive</option>
                                    </select>
                                </div>
                                <div class="input-field">
                                    <label>Category</label>
                                    <select name="categoryEdit" style="width: 200px;">

                                        <option value="Review" ${categoryEdit eq "Review" ?'selected':''}>Review</option>
                                        <option value="Promoted" ${categoryEdit eq "Promoted" ?'selected':''}>Promoted</option>
                                        <option value="experience" ${categoryEdit eq "experience" ?'selected':''}>experience</option>
                                    </select>
                                </div>

                            </div>

                            <div class="input-field">
                                <label>Description</label>
                                <textarea type="text" name="description" required style="height: 100px;">${description}</textarea>
                            </div>

                            <div class="row">
                                <div class="input-field col-md-12"  style="width: 100%;">
                                    <label class="control-label" >Image</label>
                                    <input class="form-control" id="img" onchange="changeimg()" name="image" type="file" accept=".jpg, .jpeg, .png" >
                                    <input name="postimage" id="postimage" value="${image}" type="hidden" >
                                    <image style="height: 320px;width: 600px;" src="${image}" id="demoimg" style="margin-top: 5px;" width="100%">


                                </div>
                            </div>



                                    
                        </div>
                        <div style="display: flex;justify-content: space-around;">
                            <div><button class="btn btn-danger" style="background-color:  red;" type="submit">Save To Edit Post</button></div>

                            <div ><button style="background-color:  yellow;" ><a href="PostList" style="text-decoration: none;color: white;">Back To Post List</a></button></div>
                        </div>




                    </div>


                </div>
                <input type="hidden" name="action" value="editLink">
                <input type="hidden" name="id" value="${id}">
            </form>
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

            <script>
                                        function changeimg() {
                                            var file = document.getElementById("img").files[0];
                                            if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                                                if (file.size / (1024 * 1024) < 5) {
                                                    var fileReader = new FileReader();
                                                    fileReader.readAsDataURL(file);
                                                    fileReader.onload = function () {
                                                        document.getElementById("postimage").value = (fileReader.result);
                                                        document.getElementById("demoimg").src = (fileReader.result);
                                                    }
                                                } else {
                                                    uploadError();
                                                }
                                            } else {
                                                uploadError();
                                            }
                                        }
            </script>
    </body>
</html>