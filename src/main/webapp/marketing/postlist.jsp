<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
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


    </head>
    <body class="skin-black">

        <jsp:include page="./header.jsp"/>

        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="./aside.jsp"/>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    Post List
                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <a style="cursor:pointer" class="label label-primary"  data-toggle="modal" data-target="#Add">Add new post</a>
                                    <div class="modal fade" id="Add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Add new post</h5>
                                                </div>
                                                <form action="actionPost" method="post" onsubmit="return checkAdd();">
                                                    <div class="modal-body">

                                                        <div class="row">

                                                            <div class="form-group col-md-12">
                                                                <textarea style="width: 100%;height: 100%" name="titleAdd" required id="titleAdd" placeholder="Input title"></textarea>
                                                                <span  id="invalid4" style="color: red;" > </span><br>
                                                            </div>
                                                            </br>
                                                            <div class="form-group col-md-12 ">
                                                                <textarea  style="width: 100%;height: 100%" name="descriptionAdd"  required id="desAdd" placeholder="Input description"></textarea>
                                                                <span  id="invalid5" style="color: red;" > </span><br>

                                                            </div>
                                                            </br>
                                                            <div class="form-group col-md-12">
                                                                <label class="control-label">Status</label><br>
                                                                <input  type="radio" name="status3" required value="1">Active
                                                                <input  type="radio" name="status3" required value="0"> Inactive
                                                            </div>
                                                            </br>
                                                            <div  class="form-group col-md-12">
                                                                <select class="form-control" name="categoryAdd" style="display: inline; width: 120px;">

                                                                    <c:forEach items="${catList}" var="c">
                                                                        <option value="${c}">${c}</option>
                                                                    </c:forEach>

                                                                </select>
                                                            </div>

                                                            </br>
                                                            <div class="form-group col-md-12">
                                                                <input type="file" id="fbimg" name="fbimg" onchange="changeFbimg()" accept=".jpg, .jpeg, .png"><br>

                                                                <span  id="invalid6" style="color: red;" > </span><br>
                                                                <input name="img" id="sendimg" type="hidden" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="action" value="add"> 
                                                    <div>
                                                        <button class="btn btn-primary" type="submit">Save</button>
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>

                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-tools m-b-15">
                                        <div class="input-group" style="margin-bottom: 10px;width: 100%; ">
                                            <form class="search-slider"
                                                  style="width: 100%; display: flex; justify-content: space-between; position: relative;"
                                                  method="post" action="PostList">
                                                <div class="left-search">
                                                    <label class="form-control"
                                                           style="border:none;display: inline;">Filter Category</label>
                                                    <select class="form-control" name="category" style="display: inline; width: 120px;">
                                                        <option value="-1">All</option>
                                                        <c:forEach items="${catList}" var="c">
                                                            <option value="${c}" ${param['category']==c?'selected':''}>${c}</option>
                                                        </c:forEach>

                                                    </select>
                                                    <label class="form-control"
                                                           style="border:none;display: inline;">Filter Author</label>
                                                    <select class="form-control" name="author" style="display: inline; width: 160px;">
                                                        <option value="-1">All</option>
                                                        <c:forEach items="${userList}" var="u">
                                                            <option value="${u.user_id}" ${param['author']==u.user_id?'selected':''}>${u.fullname}</option>
                                                        </c:forEach>


                                                    </select>
                                                    <label class="form-control"
                                                           style="border:none;display: inline;">Filter Status</label>
                                                    <select class="form-control" name="status" style="display: inline; width: 100px;">
                                                        <option value="-1">All</option>
                                                        <option value="1" ${param['status']==1?'selected':''}>Active</option>
                                                        <option value="0" ${param['status']==0?'selected':''}>Inactive</option>
                                                    </select>
                                                    <label class="form-control"
                                                           style="border:none;display: inline;">Sort By</label>
                                                    <select class="form-control" name="sort" style="display: inline; width: 130px;">
                                                        <option value="-1">Nothing</option>
                                                        <option value="1" ${param['sort']==1?'selected':''}>Title</option>
                                                        <option value="2" ${param['sort']==2?'selected':''}>Category</option>
                                                        <option value="3" ${param['sort']==3?'selected':''}>Author</option>
                                                        <option value="4" ${param['sort']==4?'selected':''}>Description</option>
                                                        <option value="5" ${param['sort']==5?'selected':''}>Status</option>
                                                    </select>

                                                    <select class="form-control" name="order" style="display: inline; width: 100px;">

                                                        <option value="0" ${param['order']==0?'selected':''}>Up</option> 
                                                        <option value="1" ${param['order']==1?'selected':''}>Down</option>



                                                    </select>
                                                </div>

                                                <div class="right-search">

                                                    <input type="text" name="search" class="form-control" value="${param['search']}"
                                                           style="width: 170px;" placeholder="Search By Title" />

                                                    <button class="btn btn-danger">Go</button>
                                                </div>
                                            </form>
                                        </div>


                                    </div>
                                    <table class="table table-hover">
                                        <tr>
                                            <th>ID</th>
                                            <th >User</th>
                                            <th >Title</th>
                                            <th class="text-center">Thumbnail</th>
                                            <th class="text-center">Description</th>
                                            <th>Category</th>
                                            <th class="text-center">Status</th>

                                            <th class="text-center">Action</th>

                                        </tr>
                                        <c:forEach items="${listBlog}" var="c">
                                            <tr>
                                                <td>${c.blog_id}</td>
                                                <td>${c.userName}</td>
                                                <td style="width: 20%">${c.blog_title}</td>
                                                <td style="width: 10%"><img src="${c.image}" style="height: 20%;width: 100%"></td>
                                                <td style="width: 30%">${c.description}</td>  
                                                <th>${c.blogCategory}</th>

                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${c.active == true}">
                                                            <div ><a href="" id="father"><span class="label label-success" id="active" onmouseover="" onmouseout="">Active</span></a></td></div>


                                                    </c:when>
                                                    <c:otherwise>

                                                    <div ><a href="" id="father"><span class="label label-warning" id="inactive" onmouseover="" onmouseout="">Inactive</span></a></td></div>

                                                </c:otherwise>
                                            </c:choose>




                                            <td><a style="cursor: pointer" href="actionPost?action=change&value=1&id=${c.blog_id}&page=${page}&category=${param['category']}&author=${param['author']}&status=${param['status']}&sort=${param['sort']}&search=${param['search']}&order=${param['order']}"><span class="label label-success" >Show</span></a>|
                                                <a  href="actionPost?action=change&value=0&id=${c.blog_id}&page=${page}&category=${param['category']}&author=${param['author']}&status=${param['status']}&sort=${param['sort']}&search=${param['search']}&order=${param['order']}"><span class="label label-danger">Hide</span></a>|
                                                <a style="cursor:pointer" class="label label-primary"  data-toggle="modal" data-target="#EditModalUP${c.blog_id}">Edit</a>|
                                                <a style="cursor:pointer" class="label label-info"  data-toggle="modal" data-target="#Show${c.blog_id}">View</a></td>
                                            </tr>
                                            <div class="modal fade" id="EditModalUP${c.blog_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                 data-keyboard="false">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-body">
                                                            <form action="actionPost" method="post" onsubmit="return checkInput();">

                                                                <div class="row">
                                                                    <div class="form-group  col-md-12">
                                                                        <span class="thong-tin-thanh-toan">
                                                                            <h5>Edit</h5>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">ID</label>
                                                                        <input class="form-control" type="text" name="id" readonly  value="${c.blog_id}">
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label for="exampleSelect1" class="control-label">Title</label>
                                                                        <textarea class="form-control" style="height: 80px;" type="text" name="title" id="title" required value="${c.blog_title}">${c.blog_title}</textarea>
                                                                        <span id="invalid" style="color:red;"></span>
                                                                    </div>
                                                                    <div class="form-group col-md-12">
                                                                        <label class="control-label">Author</label>
                                                                        <input class="form-control" type="text" readonly  required value="${c.userName}">
                                                                    </div>
                                                                    <div class="form-group col-md-12">
                                                                        <label class="control-label">Description</label>
                                                                        <textarea class="form-control" style="height: 100px;" type="text" name="description" id="description" required value="${c.description}">${c.description}</textarea>
                                                                        <span id="invalid1" style="color:red;"></span>
                                                                    </div>

                                                                    <select class="form-control" name="categoryEdit" style="display: inline; width: 120px;">

                                                                        <c:forEach items="${catList}" var="b">
                                                                            <option value="${b}" ${b== c.blogCategory?'selected':''}>${b}</option>
                                                                        </c:forEach>

                                                                    </select>
                                                                    <div class="form-group col-md-12">
                                                                        <label class="control-label">Status</label><br>
                                                                        <input  type="radio" name="status2" required value="1" ${c.active == true?'Checked':''}>Active
                                                                        <input  type="radio" name="status2" required value="0" ${!c.active == true?'Checked':''}> Inactive
                                                                    </div>
                                                                    <div class="form-group col-md-10">
                                                                        <label class="control-label" >Image</label>
                                                                        <input class="form-control" id="img${c.getBlog_id()}" onchange="changeimg${c.getBlog_id()}()" name="image" type="file" >
                                                                        <input name="postimage" id="postimage${c.getBlog_id()}" value="${c.getImage()}" type="hidden" >
                                                                        <image  src="${c.getImage()}" id="demoimg${c.getBlog_id()}" style="margin-top: 5px;" width="100%">


                                                                    </div>
                                                                </div>
                                                                <BR>
                                                                <button class="btn btn-primary" type="submit">Save</button>
                                                                <a class="btn btn-danger" data-dismiss="modal" href="#">Cancel</a>
                                                                <BR>

                                                                <input type="hidden" name="action" value="edit">
                                                                <input type="hidden" name="order" value="${param['order']}">
                                                                <input type="hidden" name="status" value="${param['status']}">
                                                                <input type="hidden" name="sort" value="${param['sort']}">
                                                                <input type="hidden" name="author" value="${param['author']}">
                                                                <input type="hidden" name="category" value="${param['category']}">
                                                                <input type="hidden" name="page" value="${param['page']}">
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <script>
                                                function changeimg${c.getBlog_id()}() {
                                                    var file = document.getElementById("img${c.getBlog_id()}").files[0];
                                                    if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                                                        if (file.size / (1024 * 1024) < 5) {
                                                            var fileReader = new FileReader();
                                                            fileReader.readAsDataURL(file);
                                                            fileReader.onload = function () {
                                                                document.getElementById("postimage${c.getBlog_id()}").value = (fileReader.result);
                                                                document.getElementById("demoimg${c.getBlog_id()}").src = (fileReader.result);
                                                            }
                                                        } else {
                                                            uploadError();
                                                        }
                                                    } else {
                                                        uploadError();
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
                                                            };
                                                        } else {
                                                            uploadError();
                                                        }
                                                    } else {
                                                        uploadError();
                                                    }
                                                }
                                                function uploadError() {
                                                    alert('Please upload photo file < 5MB');
                                                    document.getElementById("fbimg").files[0].value = '';
                                                    document.getElementById("fbimg").type = '';
                                                    document.getElementById("fbimg").type = 'file';
                                                }

                                            </script>

                                            <div class="modal fade" id="Show${c.blog_id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Post Detail</h5>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="form-group col-md-6">
                                                                    <h3>ID : ${c.blog_id} </h3>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <h3>Title : ${c.blog_title} </h3>
                                                                </div>
                                                                <div class="form-group col-md-12 ">
                                                                    <label class="control-label ">Description:</label>

                                                                    <p>${c.description}</p>


                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <label class="control-label">Author:</label>
                                                                    <p>${c.userName}</p>
                                                                </div>

                                                                <div class="form-group col-md-12">
                                                                    <label class="control-label">Status:  </label> ${c.isActive()?'<span class="label label-success" style="font-size: 15px">Active</span>':'<span class="label label-warning" style="font-size: 15px">Inactive</span>'}
                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <label class="control-label">Image:</label><br>
                                                                    <image  src="${c.image}" width="80%">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </c:forEach>

                                    </table>
                                    <c:if test="${!listBlog.isEmpty()}">
                                        <div class="row">
                                            <div class="box-tools text-center col-xs-12">

                                                <ul class="pagination pagination-sm m-b-10 m-t-10 pull-right">
                                                    <c:if test="${page >= 2}">
                                                        <li><a href="PostList?page=${page-1}&category=${param['category']}&author=${param['author']}&status=${param['status']}&sort=${param['sort']}&search=${param['search']}&order=${param['order']}">&laquo;</a></li>
                                                        </c:if>
                                                        <c:if test="${page >= 3}">
                                                        <li><a href="PostList?page=${page-2}&category=${param['category']}&author=${param['author']}&status=${param['status']}&sort=${param['sort']}&search=${param['search']}&order=${param['order']}">${page-2}</a></li>
                                                        </c:if>
                                                        <c:if test="${page >= 2}">
                                                        <li><a href="PostList?page=${page-1}&category=${param['category']}&author=${param['author']}&status=${param['status']}&sort=${param['sort']}&search=${param['search']}&order=${param['order']}">${page-1}</a></li>
                                                        </c:if>

                                                    <li class="active"><a href="PostList?page=${page}&category=${param['category']}&author=${param['author']}&status=${param['status']}&sort=${param['sort']}&search=${param['search']}&order=${param['order']}">${page}</a></li>
                                                        <c:if test="${page < total}">
                                                        <li><a href="PostList?page=${page+1}&category=${param['category']}&author=${param['author']}&status=${param['status']}&sort=${param['sort']}&search=${param['search']}&order=${param['order']}">${page+1}</a></li>
                                                        </c:if>
                                                        <c:if test="${page < total - 1}">
                                                        <li><a href="PostList?page=${page+2}&category=${param['category']}&author=${param['author']}&status=${param['status']}&sort=${param['sort']}&search=${param['search']}&order=${param['order']}">${page+2}</a></li>
                                                        </c:if>

                                                    <c:if test="${page != total}">
                                                        <li><a href="PostList?page=${page+1}&category=${param['category']}&author=${param['author']}&status=${param['status']}&sort=${param['sort']}&search=${param['search']}&order=${param['order']}">&raquo;</a></li>
                                                        </c:if>
                                                </ul>


                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${listBlog.isEmpty()}">
                                        <div class="text-center">
                                            <h2>Can't found the result</h2>
                                        </div>
                                    </c:if>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->

            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

        <script>

                                                function checkInput() {
                                                    var des = document.getElementById("description");
                                                    var title = document.getElementById("title");
                                                    console.log(1);
                                                    var a = 0;
                                                    if (des.value === "") {
                                                        document.getElementById("invalid1").innerHTML = "Content of description must not empty";
                                                        a = 1;
                                                    }
                                                    if (des.value.length > 400) {
                                                        document.getElementById("invalid1").innerHTML = "Content of description must less than 400 character!";
                                                        a = 1;
                                                    }
                                                    if (title.value === "") {
                                                        document.getElementById("invalid").innerHTML = "Content of title must not empty";
                                                        a = 1;
                                                    }
                                                    if (title.value.length > 200) {
                                                        document.getElementById("invalid").innerHTML = "Content of title must less than 200 character!";
                                                        a = 1;
                                                    }
                                                    console.log(1);
                                                    if (a === 1) {
                                                        return false;
                                                    } else {
                                                        return true;
                                                    }

                                                }
                                                function  checksubmit() {
                                                    if (document.getElementById("feedbackContent").value.length > 200) {
                                                        document.getElementById('invalid').style.display = "block";
                                                        return false;
                                                    }
                                                    if (document.getElementById("fbimg").value === "") {
                                                        document.getElementById('invalid2').style.display = "block";
                                                        return false;
                                                    }
                                                    return true;
                                                }
                                                function checkAdd() {

                                                    var title = document.getElementById("titleAdd");
                                                    var description = document.getElementById("desAdd");
                                                    var img = document.getElementById("fbimg");
                                                    console.log(1);
                                                    var a = 0;
                                                    if (title.value === "") {
                                                        document.getElementById("invalid4").innerHTML = "Content of title not allow empty!"
                                                        a = 1;
                                                    }
                                                    if (title.value.length > 200) {
                                                        document.getElementById("invalid4").innerHTML = "Content of title must less than 200 character!"
                                                        a = 1;
                                                    }
                                                    if (description.value === "") {
                                                        document.getElementById("invalid5").innerHTML = "Content of description not allow empty!"
                                                        a = 1;
                                                    }
                                                    if (description.value.length > 400) {
                                                        document.getElementById("invalid5").innerHTML = "Content of description must less than 400 character!"
                                                        a = 1;
                                                    }
                                                    if (img.value === "") {
                                                        document.getElementById("invalid6").innerHTML = "Please choose 1 picture!"
                                                        a = 1;
                                                    }
                                                    console.log(1);
                                                    if (a === 1) {
                                                        return false;
                                                    } else {
                                                        return true;
                                                    }

                                                }


        </script>
        <!-- Bootstrap -->
        <script src="./marketing/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="./marketing/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>

<!-- edit modal -->




