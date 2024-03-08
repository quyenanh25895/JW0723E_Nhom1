<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" /> 
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" href="css/style.css" />

        <!-- Roboto Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap"> 
        <!--  Font Awesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!--  Bootstrap core CSS-->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
        <!--  Material Design Bootstrap-->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <!--  Material Design Bootstrap Ecommerce-->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css"> 
        <!-- Your custom styles (optional) -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
    </head>
    <body>
        <div id="wrapwrap" class="homepage">
            <header class="header">


                <nav class="navbar navbar-expand-md nav-header" style="position: fixed; top: 0; width:100%;  z-index: 100000; background-color: azure;">
                    <div class="container">
                        <a class="navbar-brand" href="home" class="logo-box"><img src="images/logo-routine.webp" style="height: 54px; width: 200px;"  ></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                            <ul class="navbar-nav m-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="home">Home</a>
                                </li> 
                                <li class="nav-item">
                                    <a class="nav-link" href="shop">Shop</a>
                                </li> 

                                <%--  <c:if test="${sessionScope.acc.isSell == 1}">
                                     <li class="nav-item">
                                         <a class="nav-link" href="manager">Manager Product</a>
                                     </li>
                                 </c:if> --%>
                                <c:if test="${sessionScope.acc != null}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Hello ${sessionScope.acc.user}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="logout">Logout</a>
                                    </li> 
                                    <c:if test="${sessionScope.acc.isSell == 1 and sessionScope.acc.isAdmin == 1}">
                                        <li class="nav-item">
                                            <a class="nav-link" href="admin">Admin</a>
                                        </li> 
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.acc == null}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="login">Login</a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.acc == null}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="forgotPassword">Forgot Password</a>
                                    </li>
                                </c:if>

                                <%--<c:if test="${sessionScope.acc != null}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="EditProfile.jsp">Edit Profile</a>
                                    </li>
                                </c:if>--%>
                                <c:if test="${sessionScope.acc != null}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="ChangePassWord.jsp">Change PassWord</a>
                                    </li>
                                </c:if>
                                <%-- <c:if test="${sessionScope.acc != null}">
                                     <li class="nav-item">
                                         <a class="nav-link" href="EditProfile.jsp">Edit Profile</a>
                                     </li>
                                 </c:if>
                                <%--  <c:if test="${sessionScope.acc.isAdmin == 1}">
                                     <li class="nav-item">
                                         <a class="nav-link" href="statistic">Statistic</a>
                                     </li>
                                 </c:if> --%>
                            </ul>

                            <form action="search" method="post" class="form-inline my-2 my-lg-0">

                                <a class="btn btn-success btn-sm ml-3" href="managerCart">
                                    <i class="fa fa-shopping-cart"></i> <span style="font-size: 14px;">Cart</span>
                                    <b><span id="amountCart" class="badge badge-light" style="color:black; font-size: 12px;"></span></b>

                                </a>
                            </form>
                        </div>
                    </div>
                </nav>
                </body>
                </html>

                <!--end of menu-->
