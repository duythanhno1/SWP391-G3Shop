<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .dropdown-menu{
        background-color: Black;
    }
    .btn-danger{
        padding: 0;
    }
    .form-group .btn-danger{
        padding: 6px 15px;
        float: right;
    }
    .main-content a, .header-top a {
        font-family: monospace;
        font-weight: bold;
        padding: 0px 15px;
    }

    .main-content a:hover, .header-top a:hover {
        color: white;
        cursor: pointer;
        background-color: gray;
        padding: 5px 15px;
        border-radius: 5px;
    }
    .menu-active{
        color: white !important;
        cursor: pointer;
        background-color: gray;
        padding: 5px 15px !important;
        border-radius: 5px;
    }

    .header-bottom{
        margin-bottom: 25px;
        box-shadow: rgb(100 100 111 / 20%) 0px 7px 29px 0px;
        padding: 25px 0;
        border-bottom: none;
    }
    .logo:hover{
        cursor: pointer;
        transform: scale(1.05);
        box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
    }

    .modal-header button{
        border: none;
    }
    .modal-header button:hover{
        transform: scale(1.05);
    }
    .profile-pic{

        display: flex;
        align-items: center;

    }

    .-label{
        margin-right: 12px;
    }

    .form-group {
        margin: 18px 0;
    }
</style>
<header>
    <!-- Modal login layout -->
    <div class="modal-login" ${activeLogin}>
        <div onclick="loginOutClick()" class="modal__overlay"></div>
        <div class="modal__body-login">
            <div class="modal__inner">
                <!-- Authen form -->
                <div class="auth-form">
                    <div class="auth-form__header">
                        <h3 class="au-form__heading">Login</h3>
                        <a onclick="registerClick()" class="au-form__switch-btn">Register</a>
                    </div>
                    <!--  full name, gender, email, mobile, and address -->
                    <form>
                        <div class="auth-form__form">
                            <input type="hidden" id="urlcurrent" name="pageCurrent">
                            <div class="auth-form__group">
                                <input id="emailid" required type="email" class="auth-form__input" placeholder="Email">
                            </div>
                            <div class="auth-form__group">
                                <input id="passwordid" required type="password" class="auth-form__input" placeholder="Password">
                            </div>
                        </div>
                        <div class="auth-form__forgotgroup">
                            <a href="forgotpassword" class="auth-form__forgot">Forgot password</a>
                        </div>
                        <div class="auth-form__msg"><span id="msg">${msg}</span></div>
                        <div class="auth-form__controls">
                            <input onclick="btnLogin()" type="button" class="auth-form__button" value="Login">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal register layout -->
    <div class="modal-register">
        <div onclick="registerOutClick()" class="modal__overlay"></div>
        <div class="modal__body">
            <div class="modal__inner">
                <!-- Authen form -->
                <div class="auth-form">
                    <div class="auth-form__header">
                        <a onclick="loginClick()" class="au-form__switch-btn">Login</a>
                        <h3 class="au-form__heading">Register</h3>
                    </div>
                    <!--  full name, gender, email, mobile, and address -->
                    <form>
                        <div class="auth-form__form">
                            <input type="hidden" id="urlcurrentRegister" name="pageCurrent">
                            <div class="auth-form__group">
                                <input id="fullname" required type="text" class="auth-form__input" placeholder="Full name">
                            </div>
                            <div class="auth-form__group">
                                <input id="phone" required type="text" class="auth-form__input" placeholder="Mobile number">
                            </div>
                            <div class="auth-form__group">
                                <input id="address" required type="text" class="auth-form__input" placeholder="Address">
                            </div>
                            <div class="auth-form__radio">
                                <span class="auth-form__input">Gender:  <label style="margin-left: 25px;">   <input id="male" type="radio" value="1" name="gender" required="required">  Male  </label> <label style="margin-left: 25px;"> <input id="female" type="radio" value="0" name="gender">  Femle</label></span>
                            </div>
                            <div class="auth-form__group">
                                <input  id="email" required type="email" class="auth-form__input" placeholder="Email">
                            </div>
                            <div class="auth-form__container-pass">
                                <div class="auth-form__group">
                                    <input id="password"  id="password" required type="password" class="auth-form__input" placeholder="Password">
                                </div>
                                <div class="auth-form__group">
                                    <input id="repassword"  id="repassword" required type="password" class="auth-form__input" placeholder="Re-Password">
                                </div>
                            </div>
                        </div>
                        <div class="auth-form__msg"><span id="msgregister"></div>
                        <div class="auth-form__controls">
                            <input onclick="btnRegister()" type="button" class="auth-form__button" value="Register">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="header-top" style="background-color: #242424;" >
        <div class="container">
            <div class="top-bar left">
                <ul>
                    <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i>  g3shop102@gmail.com</a></li>
                    <li><a href="#">Giao hàng miễn phí:Hãy tận dụng thời gian của chúng tôi để lưu lại sự kiện</a></li>
                </ul>
            </div>
            <div class="top-bar right">
                <ul>
                    <li style="display: none"><a href="#" class="login-link"><i class="fa fa-tasks "></i> Manager Page</a></li>
                    <li style="display: none"><a href="#" class="login-link"><i class="fa fa-user"></i></i> Profile</a></li>
                    <li <c:if test="${account!=null}">
                            style="display: none"
                        </c:if>><a  onclick="loginClick()" class="login-link">Login</a></li>
                    <li <c:if test="${account!=null}">
                            style="display: none"
                        </c:if>><a  onclick="registerClick()" class="register-link">Register</a></li>
                    <li <c:if test="${account==null}">
                            style="display: none"
                        </c:if>>
                        <div class="dropdown">
                            <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${account.fullname}
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#myModal-2" data-toggle="modal">My Profile</a>
                                <a class="dropdown-item" href="#changePass" data-toggle="modal">Change Password</a>
                                <c:if test="${account.getRole()==18}">
                                    <a class="dropdown-item" href="marketingdasboard">Marketing page</a>
                                </c:if>
                                <a class="dropdown-item" href="MyOrder">My Order</a>
                                <a class="dropdown-item" href="logout">Logout</a>
                            </div>

                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="main-content">
                <div class="logo">
                    <img onclick="window.location = 'Home'" src="images/logo.png" alt="biolife logo" width="auto" height="120">
                </div>
                <div class="main-menu">
                    <ul>
                        <li><a href="Home" class="${requestScope['javax.servlet.forward.request_uri'].toString().endsWith("Home")?"menu-active":""}">Home</a></li>
                        <li><a href="ProductList" class="${requestScope['javax.servlet.forward.request_uri'].toString().endsWith("ProductList")?"menu-active":""}">Product</a></li>
                        <li><a href="Blog" class="${requestScope['javax.servlet.forward.request_uri'].toString().endsWith("Blog")?"menu-active":""}">Blog</a></li>
                        <li><a href="CartView" class="${requestScope['javax.servlet.forward.request_uri'].toString().endsWith("CartView")?"menu-active":""}">Cart </a></li>
                    </ul>
                    <div class="search">
                        <form action="ProductList?index=1" class="form-search" method="get">
                            <input type="text" name="search" class="input-text" value="${param['search']}" placeholder="Search product here...">
                            <button type="submit" class="btn-submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <div class="cart">
                    <a href="CartView">
                        <i class="fa fa-shopping-bag"></i></a>
                </div>
            </div>
        </div>
    </div>


    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-2" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">User Profile</h4>
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                </div>
                <div class="modal-body">

                    <form>
                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="profile-pic">

                                    <img id="myAvatar" style="border-radius: 15px;" src="${account.avatar}" width="120" >

                                    <input id="fileAvatar" onchange="changeAvatar()" type="file" accept=".jpg, .jpeg, .png">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-lg-2 col-sm-2 control-label">Email<span style="color:#ff0000"> (*)</span></label>
                            <div class="col-lg-12">
                                <input type="text" class="form-control" id="emailaccount" readonly value="${account.email}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="newFullname" class="col-lg-2 col-sm-2 control-label">Fullname<span style="color:#ff0000">(*)</span></label>
                            <div class="col-lg-12">
                                <input id="fullnamepf" type="text" class="form-control" placeholder="Fullname" value="${account.fullname}">
                                <p class="help-block" style="color: red" id="errorFullName"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="
                                   margin-right: 50px;
                                   " for="newTitle" class="col-lg-2 col-sm-2 control-label">Gender<span style="color:#ff0000"> (*)</span></label>
                            <label style="margin-right: 15px"> Male
                                <input id="malepf" type="radio" name="genderpf" value="male" ${account.gender==true?"checked":""}/>
                            </label>
                            <label> Female
                                <input id="femalepf" type="radio" name="genderpf" value="female" ${account.gender==false  ?"checked":""}/>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="newMobile" class="col-lg-2 col-sm-2 control-label">Mobile<span style="color:#ff0000"> (*)</span></label>
                            <div class="col-lg-12">
                                <input id="phonepf" type="text" class="form-control" placeholder="Mobile" value="${account.phone}">
                                <p class="help-block" style="color: red" id="errorPhone"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="newAddress" class="col-lg-2 col-sm-2 control-label">Address<span style="color:#ff0000">(*)</span></label>
                            <div class="col-lg-12">
                                <input id="addresspf" type="text" class="form-control" placeholder="Address" value="${account.address}">
                                <p class="help-block" style="color: red" id="errorAddress"></p>
                            </div>
                        </div>
                        <span style="color: red;
                              font-weight: 500;" id="msgProfile">
                        </span>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-12">
                                <button type="button" class="btn btn-danger get" onclick="btnChangeProfile()" id="saveC">Save changes</button>
                            </div>
                        </div>

                    </form>

                </div>

            </div>
        </div>
    </div>

    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="changePass" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Change Password</h4>
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                </div>
                <div class="modal-body">

                    <form>
                        <div class="form-group">
                            <label>Old Password<span style="color:#ff0000"> (*)</span></label>
                            <div class="col-lg-12">
                                <input type="password" required="" id="oldpasswordcp" name="oldpassword" class="form-control" placeholder="Old password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>New Password<span style="color:#ff0000"> (*)</span></label>
                            <div class="col-lg-12">
                                <input type="password" required="" id="passwordcp" name="newpassword" class="form-control" placeholder="New password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password<span style="color:#ff0000"> (*)</span></label>
                            <div class="col-lg-12">
                                <input type="password" required="" id="cfpasswordcp" name="confirmpassword" class="form-control" placeholder="Confirm Password">
                            </div>
                        </div>
                        <span style="color: red;
                              font-weight: 500;" id="msgChangePass">
                        </span>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-12">
                                <input onclick="btnChangePass()" type="button" class="btn btn-danger" value="Save Changes">
                            </div>
                        </div>
                    </form>

                </div>

            </div>
        </div>
    </div>


</header>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

                                    var registerForm = document.getElementsByClassName('modal-register')[0];
                                    var loginForm = document.getElementsByClassName('modal-login')[0];
                                    function registerClick() {
                                        registerForm.style.display = 'flex';
                                        loginForm.style.display = 'none';
                                    }
                                    function registerOutClick() {
                                        registerForm.style.display = 'none';

                                    }
                                    function loginClick() {
                                        loginForm.style.display = 'flex';
                                        registerForm.style.display = 'none';
                                    }
                                    function loginOutClick() {
                                        loginForm.style.display = 'none';
                                    }

                                    function btnLogin() {
                                        axios.get('login', {
                                            params: {
                                                email: document.getElementById("emailid").value,
                                                password: document.getElementById("passwordid").value
                                            }
                                        }).then((response) => {
                                            if (response.data.startsWith("success")) {
                                                if (response.data.endsWith("18")||response.data.endsWith("19")||response.data.endsWith("21")) {
                                                    window.location.assign("marketingdasboard");
                                                } else {
                                                    window.location.assign("Home");
                                                }

                                            } else {
                                                document.getElementById("msg").innerHTML = response.data;
                                            }
                                        })
                                    }

                                    function btnChangePass() {
                                        axios.get('changepassword', {
                                            params: {
                                                oldPassword: document.getElementById("oldpasswordcp").value,
                                                password: document.getElementById("passwordcp").value,
                                                rePassword: document.getElementById("cfpasswordcp").value,
                                            }
                                        }).then((response) => {
                                            document.getElementById("msgChangePass").innerHTML = response.data;
                                        })
                                    }

                                    function btnRegister() {
                                        axios.get('register', {
                                            params: {
                                                fullname: document.getElementById("fullname").value,
                                                phone: document.getElementById("phone").value,
                                                address: document.getElementById("address").value,
                                                male: document.getElementById("male").checked,
                                                female: document.getElementById("female").checked,
                                                email: document.getElementById("email").value,
                                                password: document.getElementById("password").value,
                                                repassword: document.getElementById("repassword").value,

                                            }
                                        }).then((response) => {

                                            document.getElementById("msgregister").innerHTML = response.data;
                                        })
                                    }

//                                    ChangeAvatar
                                    function changeAvatar() {
                                        var file = document.getElementById("fileAvatar").files[0];
                                        if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                                            if (file.size / (1024 * 1024) < 5) {
                                                var fileReader = new FileReader();
                                                fileReader.readAsDataURL(file);
                                                fileReader.onload = function () {
                                                    document.getElementById("myAvatar").src = (fileReader.result);
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
                                        document.getElementById("fileAvatar").files[0].value = ''
                                        document.getElementById("fileAvatar").type = '';
                                        document.getElementById("fileAvatar").type = 'file';
                                    }



                                    function btnChangeProfile() {
                                        $.ajax({
                                            url: "profile",
                                            type: "post", //send it through get method
                                            data: {
                                                fullnamepf: document.getElementById("fullnamepf").value,
                                                malepf: document.getElementById("malepf").checked,
                                                femalepf: document.getElementById("femalepf").checked,
                                                phonepf: document.getElementById("phonepf").value,
                                                addresspf: document.getElementById("addresspf").value,
                                                myAvatar: document.getElementById("myAvatar").src
                                            },
                                            success: function (data) {
                                                document.getElementById("msgProfile").innerHTML = data;
                                            }
                                        });
                                    }
</script>


