
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Marketing | Dashboard</title>
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

        </style>
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="./header.jsp"/>

        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="./aside.jsp"/>
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">

                    <div class="row" style="margin-bottom:5px;">


                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-red"><i class="fa fa-check-square-o"></i></span>
                                <div class="sm-st-info">
                                    <span>${numOrder}</span>
                                    Total Order
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-violet"><i class="fa fa-envelope-o"></i></span>
                                <div class="sm-st-info">
                                    <span>${numFeedback}</span>
                                    Total Feedback
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-user"></i></span>
                                <div class="sm-st-info">
                                    <span>${numUser}</span>
                                    Total User
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
                                <div class="sm-st-info">
                                    <span>${numProduct}</span>
                                    Total Product
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Main row -->
                    <div class="row">

                        <div class="col-md-8">
                            <!--earning graph start-->
                            <section class="panel" style="padding-right: 15px;">
                                <header class="panel-heading">
                                    Customer trend Graph in last 7 days
                                </header>
                                <div class="panel-body">
                                    <canvas id="linechart" width="500" height="320"></canvas>
                                </div>
                            </section>
                            <!--earning graph end-->


                        </div>
                        <div class="col-lg-4">
                            <div class="stat" >
                                <div class="stat-icon" style="color:#AC75F0">
                                    <i class="fa fa-dollar fa-3x stat-elem"></i>
                                </div>
                                <h5 class="stat-info" ><fmt:formatNumber type="number" minFractionDigits  = "2" value="${profit}"/>$ Profits</h5>
                            </div><br >
                            <div class="panel">
                                <header class="panel-heading">
                                    Percentage of order status

                                </header>
                                <div class="panel-body no-padding">
                                    <table class="table table-condensed">
                                        <tr>
                                            <th style="width: 55px">Status</th>
                                            <th >Progress</th>
                                            <th style="width: 50px">Number</th>
                                        </tr>
                                        <c:forEach var="s" items="${allOrderStatus}">
                                            <tr>
                                                <td>${s.getStatus()}</td>
                                                <td>
                                                    <div class="progress xs">
                                                        <c:if test="${s.getStatus()=='Pending'}"> <div class="progress-bar progress-bar-warning" style="width: ${s.getNumberOrder()/numOrder*100}%"></div> </c:if>
                                                        <c:if test="${s.getStatus()=='Shipping'}"> <div class="progress-bar progress-bar-blue" style="width: ${s.getNumberOrder()/numOrder*100}%"></div> </c:if>
                                                        <c:if test="${s.getStatus()=='Received'}"> <div class="progress-bar progress-bar-success" style="width: ${s.getNumberOrder()/numOrder*100}%"></div> </c:if>
                                                        <c:if test="${s.getStatus()=='Canceled'}"> <div class="progress-bar progress-bar-danger" style="width: ${s.getNumberOrder()/numOrder*100}%"></div> </c:if>
                                                        </div>
                                                    </td>
                                                <c:if test="${s.getStatus()=='Pending'}"> <td><span class="badge bg-yellow">${s.getNumberOrder()} Order</span></td> </c:if>
                                                <c:if test="${s.getStatus()=='Shipping'}"> <td><span class="badge bg-blue">${s.getNumberOrder()} Order</span></td> </c:if>
                                                <c:if test="${s.getStatus()=='Received'}"> <td><span class="badge bg-green">${s.getNumberOrder()} Order</span></td> </c:if>
                                                <c:if test="${s.getStatus()=='Canceled'}"> <td><span class="badge bg-red">${s.getNumberOrder()} Order</span></td></c:if>
                                                </tr>
                                        </c:forEach>
                                    </table>
                                </div><!-- /.panel-body -->
                            </div><!-- /.panel -->
                        </div><!-- /.col -->

                        <!-- Main row -->
                        <div class="row">

                            <div class="col-md-6">
                                <!--earning graph start-->
                                <section class="panel" style="padding-right: 15px;">
                                    <header class="panel-heading">
                                        New Product Graph in last 7 days
                                    </header>
                                    <div class="panel-body">
                                        <canvas id="linechart1" width="500" height="320"></canvas>
                                    </div>
                                </section>
                                <!--earning graph end-->
                            </div>
                            <div class="col-md-6">
                                <!--earning graph start-->
                                <section class="panel" style="padding-right: 15px;">
                                    <header class="panel-heading">
                                        New Feedback Graph in last 7 days
                                    </header>
                                    <div class="panel-body">
                                        <canvas id="linechart2" width="500" height="320"></canvas>
                                    </div>
                                </section>
                                <!--earning graph end-->
                            </div><!-- /.col -->
                        </div>
<!-- Main row -->
                        <div class="row">

                            <div class="col-md-12">
                                <!--earning graph start-->
                                <section class="panel" style="padding-right: 15px;">
                                    <header class="panel-heading">
                                        New Blog Graph in last 7 days
                                    </header>
                                    <div class="panel-body">
                                        <canvas id="linechart3" width="500" height="320"></canvas>
                                    </div>
                                </section>
                                <!--earning graph end-->
                            </div>
                            
                        </div>

                        <div class="row">

                            <div class="col-md-8">
                                <section class="panel">
                                    <header class="panel-heading">
                                        Top 10 Latest Order
                                    </header>
                                    <div class="panel-body table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Customer Name</th>
                                                    <th>Address</th>
                                                    <!-- <th>Client</th> -->
                                                    <th>Phone</th>
                                                    <!-- <th>Price</th> -->
                                                    <th>Total</th>
                                                    <th>Order date</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach var="o" items="${OrderList}">
                                                    <tr>
                                                        <td>${o.getOrder_id()}</td>
                                                        <td>${o.getFullname()}</td>
                                                        <td>${o.getAddress()}</td>
                                                        <td>${o.getPhone()}</td>
                                                        <td>${o.getTotal()}$</td>
                                                        <td>${o.getOrder_date()}</td>
                                                        <c:if test="${o.getStatus()=='Pending'}"> <td><span class="badge bg-yellow">${o.getStatus()}</span></td> </c:if>
                                                        <c:if test="${o.getStatus()=='Shipping'}"> <td><span class="badge bg-blue">${o.getStatus()}</span></td> </c:if>
                                                        <c:if test="${o.getStatus()=='Received'}"> <td><span class="badge bg-green">${o.getStatus()}</span></td> </c:if>
                                                        <c:if test="${o.getStatus()=='Canceled'}"> <td><span class="badge bg-red">${o.getStatus()}</span></td></c:if>
                                                        </tr>
                                                </c:forEach> 
                                            </tbody>
                                        </table>
                                    </div>
                                </section>
                            </div>

                            <!--end col-6 -->
                            <div class="col-md-4">
                                <div class="panel">
                                    <header class="panel-heading">
                                        Top selling product
                                    </header>
                                    <table class="table table-bordered">
                                        <tr>
                                            <th style="width: 10px">#</th>
                                            <th>Product Name</th>
                                            <th style="width: 100px">Number Sold</th>
                                        </tr>
                                        <c:forEach var="p" items="${topSelling}">
                                            <tr>
                                                <td>#.</td>
                                                <td>${p.getTitle()}</td>
                                                <td style="width: 100px">${p.getQuantity()}</td>
                                            </tr>
                                        </c:forEach>                      

                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- row end -->
                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->


        </div><!-- ./wrapper -->
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="./marketing/js/jquery.min.js" type="text/javascript"></script>

        <!-- jQuery UI 1.10.3 -->
        <script src="./marketing/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="./marketing/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="./marketing/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

        <script src="./marketing/js/plugins/chart.js" type="text/javascript"></script>

        <script src="./marketing/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- calendar -->
        <script src="./marketing/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>
        <script src="./marketing/js/Director/app.js" type="text/javascript"></script>

        <!-- Director dashboard demo (This is only for demo purposes) -->
        <script src="./marketing/js/Director/dashboard.js" type="text/javascript"></script>

        <script type="text/javascript">
            $('input').on('ifChecked', function (event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().addClass('highlight');
                $(this).parents('li').addClass("task-done");
                console.log('ok');
            });
            $('input').on('ifUnchecked', function (event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().removeClass('highlight');
                $(this).parents('li').removeClass("task-done");
                console.log('not');
            });

        </script>
        <script>
            $('#noti-box').slimScroll({
                height: '400px',
                size: '5px',
                BorderRadius: '5px'
            });

            $('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({
                checkboxClass: 'icheckbox_flat-grey',
                radioClass: 'iradio_flat-grey'
            });
        </script>
        <script type="text/javascript">
            $(function () {
                "use strict";
                //BAR CHART
                var date = new Date();
                let weeks = [];
                for (let i = 7; i > 0; i--) {
                    date.setDate(date.getDate() - i);
                    weeks.push(date.toString().slice(4, 10));
                    date = new Date();
                }
                let dataorder = [];
            <c:forEach var="p" items="${numberOrderinLast7day}">
                dataorder.push(${p});
            </c:forEach>
                var data = {
                    labels: weeks,
                    datasets: [
                        {
                            label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: dataorder
                        },
                    ]
                };
                new Chart(document.getElementById("linechart").getContext("2d")).Line(data, {
                    responsive: true,
                    maintainAspectRatio: false,
                });

            });
            // Chart.defaults.global.responsive = true;
        </script>
        <script type="text/javascript">
            $(function () {
                "use strict";
                //BAR CHART
                var date = new Date();
                let weeks = [];
                for (let i = 7; i > 0; i--) {
                    date.setDate(date.getDate() - i);
                    weeks.push(date.toString().slice(4, 10));
                    date = new Date();
                }
                let dataorder = [];
            <c:forEach var="p" items="${getTotalProductLast7day}">
                dataorder.push(${p});
            </c:forEach>
                var data = {
                    labels: weeks,
                    datasets: [
                        {
                            label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: dataorder
                        },
                    ]
                };
                new Chart(document.getElementById("linechart1").getContext("2d")).Line(data, {
                    responsive: true,
                    maintainAspectRatio: false,
                });

            });
            // Chart.defaults.global.responsive = true;
        </script>
        <script type="text/javascript">
            $(function () {
                "use strict";
                //BAR CHART
                var date = new Date();
                let weeks = [];
                for (let i = 7; i > 0; i--) {
                    date.setDate(date.getDate() - i);
                    weeks.push(date.toString().slice(4, 10));
                    date = new Date();
                }
                let dataorder = [];
            <c:forEach var="p" items="${getTotalFeedbackLast7day}">
                dataorder.push(${p});
            </c:forEach>
                var data = {
                    labels: weeks,
                    datasets: [
                        {
                            label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: dataorder
                        },
                    ]
                };
                new Chart(document.getElementById("linechart2").getContext("2d")).Line(data, {
                    responsive: true,
                    maintainAspectRatio: false,
                });

            });
            // Chart.defaults.global.responsive = true;
        </script>
        <script type="text/javascript">
            $(function () {
                "use strict";
                //BAR CHART
                var date = new Date();
                let weeks = [];
                for (let i = 7; i > 0; i--) {
                    date.setDate(date.getDate() - i);
                    weeks.push(date.toString().slice(4, 10));
                    date = new Date();
                }
                let dataorder = [];
            <c:forEach var="p" items="${getTotalPostLast7day}">
                dataorder.push(${p});
            </c:forEach>
                var data = {
                    labels: weeks,
                    datasets: [
                        {
                            label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: dataorder
                        },
                    ]
                };
                new Chart(document.getElementById("linechart3").getContext("2d")).Line(data, {
                    responsive: true,
                    maintainAspectRatio: false,
                });

            });
            // Chart.defaults.global.responsive = true;
        </script>
    </body>
</html>