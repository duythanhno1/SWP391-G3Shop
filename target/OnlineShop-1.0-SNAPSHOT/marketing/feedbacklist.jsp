<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

        <style type="text/css">
            td{
                padding: 5px;
            }
            th{
                padding: 5px;
            }
        </style>
    </head>
    <body class="skin-black">
        <c:if test="${param['index']==null }">   
            <c:set var = "index" scope = "page" value = "1"/>
        </c:if>
        <c:if test="${param['index']!=null}">
            <c:set var = "index" scope = "page" value = "${param['index']}"/>
        </c:if>
        <!-- header logo: style can be found in header.less -->
        <div class="left-side sidebar-offcanvas"  style="height: 1200px;position: fixed; width: 220px; background-color: #39435c;left: 0; top:0;">
        </div>
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
                                    Feedback List
                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <div class="sliderList">
                                        <div class="input-group" style="margin-bottom: 10px;width: 100%; ">
                                            <form class="search-slider"
                                                  style="width: 100%; display: flex; justify-content: space-between; position: relative;"
                                                  method="get" action="FeedbackList">
                                                <div class="left-search"></div>
                                                <div class="right-search">
                                                    <select class="form-control" name="star" style="display: inline; width: 135px;">
                                                        <option value="" ${param['star']==""?'selected':''}>All Rate Star</option>
                                                        <option value="1" ${param['star']==1?'selected':''}>1</option>
                                                        <option value="2" ${param['star']==2?'selected':''}>2</option>
                                                        <option value="3" ${param['star']==3?'selected':''}>3</option>
                                                        <option value="4" ${param['star']==4?'selected':''}>4</option>
                                                        <option value="5" ${param['star']==5?'selected':''}>5</option>
                                                    </select>
                                                    <select class="form-control" name="status" style="display: inline; width: 110px;">
                                                        <option value="">All Status</option>
                                                        <option value="1" ${param['status']==1?'selected':''}>Active</option>
                                                        <option value="0"${param['status']==0?'selected':''}>Inactive</option>
                                                    </select>
                                                    <input type="text" name="search"  class="form-control"
                                                           style="width: 250px;" placeholder="Search" value="${param['search']}"/>
                                                    <select name="type-search" class="form-control input-sm" 
                                                            style="display: inline; width: 90px; border:none; position:absolute; right:50px;top:2px;">
                                                        <option value="0" ${param['type-search']==0?'selected':''}>Fullname</option>
                                                        <option value="1" ${param['type-search']==1?'selected':''}>Product</option>
                                                    </select>
                                                    <button class="btn btn-default">Go</button>
                                                </div>
                                            </form>
                                        </div>
                                        <table class="panel-body table-responsive" id="slidetable" cellspacing="0" style="width: 100%;">
                                            <thead>
                                                <tr style="cursor: pointer; font-size: 15px; border-bottom: 1px solid #ccc; text-align: center;">
                                                    <th>ID <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Fullname <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Image</th>
                                                    <th>Product <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Rated star <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Status 
                                                        <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th  width="3%">Edit</th>
                                                    <th  width="3%">View</th>
                                                    <th width="3%">Switch</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="f" items="${feedbackList}">
                                                    <tr>
                                                        <td>${f.feedback_id}</td>
                                                        <td>${f.user.fullname}</td>
                                                        <td><img src="${f.product.img}" width="100px"></td>
                                                        <td>${f.product.title}</td>
                                                        <td>${f.rated}</td>
                                                        <c:if test="${f.active}">
                                                            <td><span class="label label-success" style="font-size: 15px">Acive</span></td>
                                                        </c:if>
                                                        <c:if test="${!f.active}">
                                                            <td><span class="label label-danger" style="font-size: 15px">Inacive</span></td>
                                                        </c:if>
                                                        <td><a class="btn btn-primary"  data-toggle="modal" data-target="#EditModalUP${f.feedback_id}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
                                                        <td><a class="btn btn-danger" data-toggle="modal" data-target="#View${f.feedback_id}"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                                                        <c:if test="${f.active==true}">
                                                            <td><a class="btn btn-warning" href="FeedbackList?action=switch&fid=${f.feedback_id}&status=0">InActive</a></td>
                                                        </c:if>
                                                        <c:if test="${f.active==false}">
                                                            <td><a class="btn btn-success" href="FeedbackList?action=switch&fid=${f.feedback_id}&status=1">Active</a></td>
                                                        </c:if>
                                                    </tr>
                                                    <!-- Show detail modal -->

                                                <div class="modal fade" id="EditModalUP${f.feedback_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                     data-keyboard="false">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <form action="FeedbackList">
                                                                    <input type="hidden" readonly="" name="action" value="edit">
                                                                    <div class="row">
                                                                        <div class="form-group  col-md-12">
                                                                            <span class="thong-tin-thanh-toan">
                                                                                <h5>Edit Feedback Information</h5>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Fullname</label>
                                                                            <input class="form-control" type="text" readonly="" value="${f.user.fullname}">
                                                                            <input class="form-control" type="hidden" name="fid" readonly="" value="${f.feedback_id}">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label for="exampleSelect1" class="control-label">Email</label>
                                                                            <input class="form-control" type="text" id="stitle" value="${f.user.email}" readonly="">
                                                                            <span id="invalid1" style="color: red;"> </span>

                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Phone</label>
                                                                            <input class="form-control" type="text" readonly="" value="${f.user.phone}">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label for="exampleSelect1" class="control-label">Rate Star</label>
                                                                            <input class="form-control" type="text" value="${f.rated}" readonly="">
                                                                            <span id="invalid1" style="color: red;"> </span>

                                                                        </div>
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label">Feedback</label>
                                                                            <textarea readonly="" class="form-control" >${f.fb_content}</textarea>
                                                                            <span id="invalid3" style="color: red;"> </span>
                                                                        </div><div class="form-group col-md-12" style="
                                                                                   text-align: center;
                                                                                   ">
                                                                            <label class="control-label">Image</label>
                                                                            <img src="${f.product.img}" alt="" width="150">
                                                                            <span id="invalid3" style="color: red;"> </span>
                                                                        </div>

                                                                        <div class="form-group col-md-12" style="
                                                                             text-align: center;
                                                                             ">
                                                                            <label class="control-label">Status</label><br>
                                                                            <input  type="radio" name="status" required="" value="1" ${f.active?"checked":""}>Active
                                                                            <input  type="radio" name="status" required="" value="0" ${f.active==false?"checked":""}> Inactive
                                                                        </div>

                                                                    </div>
                                                                    <br>
                                                                    <input class="btn btn-primary" type="submit" value="Save">
                                                                    <a class="btn btn-danger" data-dismiss="modal" href="#">Cancel</a>
                                                                    <br>
                                                                </form>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="modal fade" id="View${f.feedback_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                     data-keyboard="false">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <div class="row">
                                                                    <div class="form-group  col-md-12">
                                                                        <span class="thong-tin-thanh-toan">
                                                                            <h5>View Feedback Information</h5>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Fullname</label>
                                                                        <input class="form-control" type="text" readonly="" value="${f.user.fullname}">
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label for="exampleSelect1" class="control-label">Email</label>
                                                                        <input class="form-control" type="text" value="${f.user.email}" readonly="">
                                                                        <span id="invalid1" style="color: red;"> </span>

                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Phone</label>
                                                                        <input class="form-control" type="text" readonly="" value="${f.user.phone}">
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label for="exampleSelect1" class="control-label">Rate Star</label>
                                                                        <input class="form-control" type="text" id="stitle" value="${f.rated}" readonly="">
                                                                        <span id="invalid1" style="color: red;"> </span>

                                                                    </div>
                                                                    <div class="form-group col-md-12">
                                                                        <label class="control-label">Feedback</label>
                                                                        <textarea readonly="" class="form-control" >${f.fb_content}</textarea>
                                                                        <span id="invalid3" style="color: red;"> </span>
                                                                    </div><div class="form-group col-md-12" style="
                                                                               text-align: center;
                                                                               ">
                                                                        <label class="control-label">Image</label>
                                                                        <img src="${f.product.img}" alt="" width="150">
                                                                        <span id="invalid3" style="color: red;"> </span>
                                                                    </div>



                                                                </div>
                                                                <div class="form-group col-md-12" style="
                                                                     text-align: center;
                                                                     ">
                                                                    <label class="control-label">Status: </label> 
                                                                    <c:if test="${f.active}">
                                                                        <span class="label label-success" style="font-size: 15px">Active</span>
                                                                    </c:if>
                                                                    <c:if test="${f.active==false}">
                                                                        <span class="label label-danger" style="font-size: 15px">False</span>
                                                                    </c:if>

                                                                </div>

                                                                <br>
                                                                <a class="btn btn-danger" data-dismiss="modal" href="#">Close</a>
                                                                <br>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="pagination-arena " style="margin-left: 40%">
                                            <ul class="pagination">
                                                <li class="page-item"><a href="./FeedbackList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=1"" class="page-link"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                                <li class="page-item">
                                                    <a href="./FeedbackList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index-2}"" class="page-link " style="${index-2<1?"display:none;":""}">${index-2}</a></li>
                                                <li class="page-item">
                                                    <a href="./FeedbackList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index-1}"" class="page-link " style="${index-1<1?"display:none;":""}">${index-1}</a></li>
                                                <li class="page-item active">
                                                    <a href="./FeedbackList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index}"" class="page-link">${index}</a></li>
                                                <li class="page-item">
                                                    <a href="./FeedbackList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index+1}"" class="page-link " style="${index+1>numberPage?"display:none;":""}" >${index+1}</a></li>
                                                <li class="page-item">
                                                    <a href="./FeedbackList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index+2}"" class="page-link " style="${index+2>numberPage?"display:none;":""}">${index+2}</a></li>
                                                <li><a href="./FeedbackList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${numberPage}"" class="page-link"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div> 
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div>
                        </div>

                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#slidetable").DataTable({bFilter: false, bInfo: false, paging: false});
            });
        </script>
        <script>

        </script>
        <!-- Bootstrap -->
        <script src="./marketing/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="./marketing/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>


