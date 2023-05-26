<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Blog List</title>
        <link rel="shortcut icon" type="image/x-icon" href="https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36682/36682.png" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">

    </head>
    <body class="biolife-body">

        <jsp:include page="./layout/header.jsp"/>
        <!--Navigation  section-->
        <section class="section-product-list">
            <div class="container">
                <div class="main-section-content">
                    <div class="sider">
                        <div class="search">
                            <form action="BlogSearch" class="form-search" method="get">
                                <input type="text" name="blogName" class="input-text" value="${param['blogName']}" placeholder="Search blog here...">
                                <button type="submit" class="btn-submit"><i class="fa fa-search"></i></button>
                            </form>
                            <div class="side-item">
                                <h5>Category</h5>
                                <form action="Blog">
                                    <ul class="cat-list">
                                        <c:forEach var="i" begin="0" end="${catList.size()-1}">
                                            <input type="checkbox" name="value" value="${catList.get(i)}" ${checkValue[i]?"checked":""}/>
                                            ${catList.get(i)}

                                            <br>
                                        </c:forEach>
                                        <br>
                                        <input type="radio" name="order" value="NTO" ${order.equals("NTO")?"checked":""} >New To Old<br>

                                        <input type="radio" name="order" value="OTN" ${order.equals("OTN")?"checked":""}>Old To New<br>
                                        <br>
                                        <button type="submit" value="Find" id="submit_pfilter">Find</button>
                                    </ul>
                                </form>

                            </div>

                            <div class="latest-product">
                                <h5>Latest  Post</h5>
                                <c:forEach var="pro" items="${reList}">
                                    <div style="border: 1px solid lightgray;padding: 5px;">
                                        <h5 class="latest-product-title"  ><a href="BlogDetail?id=${pro.blog_id}" class="product-name" style="font-weight: bold;text-decoration: none; color: black">${pro.blog_title}</a></h5>
                                        <div class="latest-product-item">
                                            <a href="BlogDetail?id=${pro.blog_id}" title="product thumbnail" style="width: 45%;"><img src="${pro.image}" alt="" width="100%"></a>
                                            <div class="latest-product-info">
                                                <p class="latest-product-title product-description" style="padding-left: 8px;" ><a href="BlogDetail?id=${pro.blog_id}" class="product-name" style="font-size: 12px;">${pro.description}....</a></p>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="display-list">

                        <div class="product-list">
                            <c:forEach var="p" items="${bloList}">
                                <div class="product-item">
                                    <a href="BlogDetail?id=${p.blog_id}" title="product thumbnail" ><img src="${p.image}" alt="" width="100%"></a>
                                    <div class="product-info">
                                        <h4 class="product-title"><a href="BlogDetail?id=${p.blog_id}" class="product-name">${p.blog_title}</a></h4>
                                        <div class="product-description">
                                            <p>${p.description}....</p>
                                        </div>

                                    </div>
                                    <div class="btn-list">
                                        <a href="BlogDetail?id=${p.blog_id}" class="product-btn" style="color: red;text-align: center;"> Show</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                                <li class="${i==page?"page-item active":""}"><a class="page-link" href="BlogSearch?page=${i}&blogName=${blogName}">${i}</a></li>
                                                </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="./layout/footer.jsp"/>

        <script src="./js/bootstrap.js"></script>
    </body>

</html>