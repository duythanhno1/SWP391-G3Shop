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
            .left-aside{
                height: 1550px;
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
        <div class="wrapper row-offcanvas row-offcanvas-left" style="height: 100%;">
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
                                    Product List
                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <div class="sliderList">
                                        <div class="input-group" style="margin-bottom: 10px;width: 100%; ">
                                            <form class="search-slider"
                                                  style="width: 100%; display: flex; justify-content: space-between; position: relative;"
                                                  method="get" action="productmanagement">
                                                <div class="left-filter">
                                                    <a class="btn btn-primary" data-toggle="modal" data-target="#addpro">Add New Product</a>
                                                </div>

                                                <div class="right-search">
                                                    <label class="form-control"
                                                           style="border:none;display: inline;">Category</label>
                                                    <select class="form-control" name="categoryId" style="display: inline; width: 100px;">
                                                        <option value="">All</option>
                                                        <c:forEach var="cate" items="${cate}">
                                                            <option value="${cate.getSetting_id()}" ${cate.getSetting_id()==param['categoryId']?"selected":""}>${cate.getValue()}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-control"
                                                           style="border:none;display: inline;">Brands</label>
                                                    <select class="form-control" name="brandId" style="display: inline; width: 100px;">
                                                        <option value="">All</option>
                                                        <c:forEach var="brand" items="${brand}">
                                                            <option value="${brand.getSetting_id()}" ${brand.getSetting_id()==param['brandId']?"selected":""}>${brand.getValue()}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="form-control"
                                                           style="border:none;display: inline;">Status</label>
                                                    <select class="form-control" name="status" style="display: inline; width: 100px;">
                                                        <option value="">All</option>
                                                        <option value="1" ${param['status']==1?'selected':''}>Active</option>
                                                        <option value="0" ${param['status']==0?'selected':''}>Inactive</option>
                                                    </select>
                                                    <input type="text" name="search" class="form-control" value="${param['search']} "
                                                           style="width: 250px;" placeholder="Search" />
                                                    <select class="form-control input-sm" name="type-search"
                                                            style="display: inline; width: 90px; border:none; position:absolute; right:50px;top:2px;">
                                                        <option value="0" ${param['type-search']==0?'selected':''}>Title</option>
                                                        <option value="1" ${param['type-search']==1?'selected':''}>Brief</option>
                                                    </select>
                                                    <button class="btn btn-default">Go</button>
                                                </div>
                                            </form>
                                        </div>
                                        <table class="table table-hover " id="tablepro">
                                            <thead>
                                                <tr style="cursor: pointer; font-size: 15px;  text-align: center;">
                                                    <th style="width: 55px;">ID<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Name<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th style="width: 240px;">Image</th>
                                                    <th style="width: 340px;">Brief information<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Category<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Brand<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Stock<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Price<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Sale Price<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Status<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th  width="20px">Edit</th>
                                                    <th  width="20px">Del</th>
                                                    <th width="3%">Switch</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="s" items="${prolist}">
                                                    <tr>
                                                        <td style="width: 55px;">${s.getId()}</td>
                                                        <td data-toggle="modal" data-target="#Show${s.getId()}" style="cursor: pointer;">${s.getTitle()}</td>
                                                        <td style="width: 240px;"><image  src="${s.getImg()}" width="150px"></td>
                                                        <td style="width: 340px;">${s.getBrief()}...</td>
                                                        <td>${s.getCategory()}</td>
                                                        <td>${s.getBrand()}</td>
                                                        <td>${s.getStock()}</td>
                                                        <td>${s.getPrice()}$</td>
                                                        <td>${s.getSalePrice()}$</td>
                                                        <c:if test="${s.isActive()}">
                                                            <td><span class="label label-success" style="font-size: 15px">Acive</span></td>
                                                        </c:if>
                                                        <c:if test="${!s.isActive()}">
                                                            <td><span class="label label-danger" style="font-size: 15px">Inacive</span></td>
                                                        </c:if>
                                                        <td width="20px"><a class="btn btn-primary"  data-toggle="modal" data-target="#EditModalUP${s.getId()}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
                                                        <td Width="20px"><a class="btn btn-danger" data-toggle="modal" data-target="#Delete${s.getId()}"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                                                                <c:if test="${s.isActive()}">
                                                            <td><a class="btn btn-warning" href="productmanagement?action=switch&pid=${s.getId()}&sstatus=0&index=${index}">Inctive</a></td>
                                                        </c:if>
                                                        <c:if test="${!s.isActive()}">
                                                            <td ><a class="btn btn-success" href="productmanagement?action=switch&pid=${s.getId()}&sstatus=1&index=${index}">Active</a></td>
                                                        </c:if>
                                                    </tr>
                                                    <!-- Show detail modal -->

                                                <div class="modal fade" id="Delete${s.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Confirm delete Slide</h5>

                                                            </div>
                                                            <div class="modal-body">
                                                                <div style="text-align: center">Do you want delete Product?</div>
                                                                <div style="text-align: center">Product Id: ${s.getId()}</div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button onclick="window.location = 'productmanagement?action=delete&pid=${s.getId()}&index=${index}'" type="button" class="btn btn-primary">Delete Product</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> 

                                                <div class="modal fade" id="Show${s.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Product Detail</h5>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <h3>ID : ${s.getId()} </h3>
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <h3>Title : ${s.getTitle()} </h3>
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Category:</label>
                                                                        <p>${s.getCategory()}</p>
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Brand:</label>
                                                                        <p>${s.getBrand()}</p>
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Price:</label>
                                                                        <p>${s.getPrice()}</p>
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Sale Price:</label>
                                                                        <p>${s.getSalePrice()}</p>
                                                                    </div>

                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Stock:</label>
                                                                        <p>${s.getStock()}</p>    
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label class="control-label">Create Date:</label>
                                                                        <p>${s.getCreateDate()}</p>
                                                                    </div>
                                                                    <div class="form-group col-md-12">
                                                                        <label class="control-label">Status: </label>${s.isActive()?'<span class="label label-success" style="font-size: 15px;" >Acive</span>':'<span class="label label-danger" style="font-size: 15px;width: 50px;">Inacive</span>'}
                                                                    </div>

                                                                    <div class="form-group col-md-12">
                                                                        <label class="control-label">Description:</label>
                                                                        <p>${s.getDescription()}</p>
                                                                    </div>
                                                                    <div class="form-group col-md-12">
                                                                        <label class="control-label">Image:</label><br>
                                                                        <image  src="${s.getImg()}" width="50%">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- edit modal -->
                                                <div class="modal fade" id="EditModalUP${s.getId()}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                                     data-keyboard="false">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <form action="productmanagement?action=edit" method="post">
                                                                    <div class="row">
                                                                        <div class="form-group  col-md-12">
                                                                            <span class="thong-tin-thanh-toan">
                                                                                <h5>Edit Product Information</h5>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">ID</label>
                                                                            <input class="form-control" type="text" readonly name="proid" value="${s.getId()}">
                                                                            <input class="form-control" type="hidden"  name="index" value="${index}">

                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label for="exampleSelect1" class="control-label">Title</label>
                                                                            <input class="form-control" type="text" maxlength="50" name="protitle" required value="${s.getTitle()}">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Category:</label>
                                                                            <select class="form-control" name="categoryId" style="display: inline; width: 100px;">
                                                                                <c:forEach var="cate" items="${cate}">
                                                                                    <option value="${cate.getSetting_id()}" ${cate.getValue()==s.getCategory()?"selected":""}>${cate.getValue()}</option>
                                                                                </c:forEach>
                                                                            </select>

                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Brand:</label>
                                                                            <select class="form-control" name="brandId" style="display: inline; width: 100px;">
                                                                                <c:forEach var="brand" items="${brand}">
                                                                                    <option value="${brand.getSetting_id()}" ${brand.getValue()==s.getBrand()?"selected":""}>${brand.getValue()}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Price:</label>
                                                                            <input class="form-control" type="number" step="0.01" min="1" max="100000" name="price" required value="${s.getPrice()}">

                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Sale Price:</label>
                                                                            <input class="form-control" type="number" step="0.01" min="1" max="100000"name="salePrice" required value="${s.getSalePrice()}">

                                                                        </div>

                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Stock:</label>
                                                                            <input class="form-control" type="number" name="stock" min="1" max="100000" required value="${s.getStock()}">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Create Date:</label>
                                                                            <input class="form-control" type="date" name="createDate" required value="${s.getCreateDate()}">
                                                                        </div>
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label">Status</label><br>
                                                                            <input  type="radio" name="prodstatus" required value="1" ${s.isActive()?'Checked':''}>Active
                                                                            <input  type="radio" name="prodstatus" required value="0" ${!s.isActive()?'Checked':''}> Inactive
                                                                        </div>
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label">Description:</label>
                                                                            <textarea class="form-control" name="Description" maxlength="300" style="height: 95px;">${s.getDescription()}</textarea>
                                                                        </div>
                                                                        <div class="form-group col-md-10">
                                                                            <label class="control-label" >Image</label>

                                                                            <input class="form-control" id="img${s.getId()}" onchange="changeimg${s.getId()}()" name="image" type="file" >
                                                                            <input name="proimage" id="image${s.getId()}" value="${s.getImg()}" type="hidden" >
                                                                            <image  src="${s.getImg()}" id="demoimg${s.getId()}" style="margin-top: 5px;" width="50%">
                                                                        </div>
                                                                    </div>
                                                                    <BR>
                                                                    <button class="btn btn-primary" type="submit">Save</button>
                                                                    <a class="btn btn-danger" data-dismiss="modal" href="#">Cancel</a>
                                                                    <BR>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <script>
                                                    function changeimg${s.getId()}() {
                                                        var file = document.getElementById("img${s.getId()}").files[0];
                                                        if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                                                            if (file.size / (1024 * 1024) < 5) {
                                                                var fileReader = new FileReader();
                                                                fileReader.readAsDataURL(file);
                                                                fileReader.onload = function () {
                                                                    document.getElementById("image${s.getId()}").value = (fileReader.result);
                                                                    document.getElementById("demoimg${s.getId()}").src = (fileReader.result);
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
                                                        document.getElementById("img${s.getId()}").files[0].value = ''
                                                        document.getElementById("img${s.getId()}").type = '';
                                                        document.getElementById("img${s.getId()}").type = 'file';
                                                    }
                                                </script>

                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="pagination-arena " style="margin-left: 40%">
                                            <ul class="pagination">
                                                <li class="page-item"><a href="./productmanagement?categoryId=${param['categoryId']}&brandId=${param['brandId']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=1" class="page-link"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                                <li class="page-item">
                                                    <a href="./productmanagement?categoryId=${param['categoryId']}&brandId=${param['brandId']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index-2}" class="page-link " style="${index-2<1?"display:none;":""}">${index-2}</a></li>
                                                <li class="page-item">
                                                    <a href="./productmanagement?categoryId=${param['categoryId']}&brandId=${param['brandId']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index-1}" class="page-link " style="${index-1<1?"display:none;":""}">${index-1}</a></li>
                                                <li class="page-item active">
                                                    <a href="./productmanagement?categoryId=${param['categoryId']}&brandId=${param['brandId']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index}" class="page-link">${index}</a></li>
                                                <li class="page-item">
                                                    <a href="./productmanagement?categoryId=${param['categoryId']}&brandId=${param['brandId']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index+1}" class="page-link " style="${index+1>numberPage?"display:none;":""}" >${index+1}</a></li>
                                                <li class="page-item">
                                                    <a href="./productmanagement?categoryId=${param['categoryId']}&brandId=${param['brandId']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index+2}" class="page-link " style="${index+2>numberPage?"display:none;":""}">${index+2}</a></li>
                                                <li><a href="./productmanagement?categoryId=${param['categoryId']}&brandId=${param['brandId']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${numberPage}" class="page-link"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
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
            <div class="modal fade" id="addpro" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                 data-keyboard="false">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="productmanagement?action=add" method="post">
                                <div class="row">
                                    <div class="form-group  col-md-12">
                                        <span class="thong-tin-thanh-toan">
                                            <h5>Add New Product </h5>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="form-group col-md-6">
                                        <label for="exampleSelect1" class="control-label">Title</label>
                                        <input class="form-control" type="text" maxlength="50" name="protitle" required value="">
                                        <input class="form-control" type="hidden"  name="index" value="${index}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Stock:</label>
                                        <input class="form-control" type="number" min="1" name="stock" required value="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Category:</label>
                                        <select class="form-control" name="categoryId" style="display: inline; width: 100px;">
                                            <c:forEach var="cate" items="${cate}">
                                                <option value="${cate.getSetting_id()}" ${cate.getValue()==s.getCategory()?"selected":""}>${cate.getValue()}</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Brand:</label>
                                        <select class="form-control" name="brandId" style="display: inline; width: 100px;">
                                            <c:forEach var="brand" items="${brand}">
                                                <option value="${brand.getSetting_id()}" ${brand.getValue()==s.getBrand()?"selected":""}>${brand.getValue()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Price:</label>
                                        <input class="form-control" type="number" step="0.01" min="1" name="price" required value="">

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Sale Price:</label>
                                        <input class="form-control" type="number" step="0.01" min="1" name="salePrice" required value="">

                                    </div>
                                    <div class="form-group col-md-12">
                                        <label class="control-label">Status</label><br>
                                        <input  type="radio" name="prodstatus" required value="1" >Active
                                        <input  type="radio" name="prodstatus" required value="0" > Inactive
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label class="control-label">Description:</label>
                                        <textarea class="form-control" name="Description" maxlength="300" style="height: 95px;"></textarea>
                                    </div>
                                    <div class="form-group col-md-10">
                                        <label class="control-label" >Image</label>

                                        <input class="form-control" id="imgadd" required onchange="changeimgadd()" name="image" type="file" >
                                        <input name="proimage" id="imageadd" value="" type="hidden" >
                                        <image  src="" id="demoimgadd" style="margin-top: 5px;" width="50%">
                                    </div>
                                </div>
                                <BR>
                                <button class="btn btn-primary" type="submit">Save</button>
                                <a class="btn btn-danger" data-dismiss="modal" href="#">Cancel</a>
                                <BR>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function changeimgadd() {
                    var file = document.getElementById("imgadd").files[0];
                    if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                        if (file.size / (1024 * 1024) < 5) {
                            var fileReader = new FileReader();
                            fileReader.readAsDataURL(file);
                            fileReader.onload = function () {
                                document.getElementById("imageadd").value = (fileReader.result);
                                document.getElementById("demoimgadd").src = (fileReader.result);
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
                    document.getElementById("imgadd").files[0].value = ''
                    document.getElementById("imgadd").type = '';
                    document.getElementById("imgadd").type = 'file';
                }

            </script>
        </div><!-- ./wrapper -->

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

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#tablepro").DataTable({bFilter: false, bInfo: false, paging: false});
            });
        </script>
        <!-- Bootstrap -->
        <script src="./marketing/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="./marketing/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>