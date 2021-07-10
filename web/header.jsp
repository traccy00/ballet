<%-- 
    Document   : header
    Created on : Apr 11, 2021, 10:04:21 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title
        <!-- ===== BOXICONS ===== -->
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>

        <!-- ===== CSS =====-->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/index.css">
        <link href="css/header.css" rel="stylesheet" type="text/css"/>
        <!-- ===== JS =====-->
        <script src="js/main.js" type="text/javascript"></script>

    </head>
    <body>
        <!-- ====================HEADER ================== -->
        <div class="l-header">
            <nav class="nav bd-grid">
                <!--logo-->
                <div>
                    <a href="IndexController" class="nav__logo">Ballet</a>
                </div>
                <!--menu-->
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item"><button class="nav__button"><a class="nav__link" href="IndexController">Home</a></button></li>
                        <li class="nav__item"><button class="nav__button"><a class="nav__link" href="#featured" >Featured</a></button></li>
                        <li class="nav__item"><button class="nav__button"><a class="nav__link" href="#new">New Arrival</a></button></li>
                        <li class="nav__item"><button class="nav__button"><a class="nav__link" href="#suscribe">Subscribe</a></button></li>

                    </ul>
                </div>

                <div>
                    <a href="CartController"><i class="bx bx-cart-alt nav__cart"></i></a>
                    <i class="bx bx-menu nav__toggle" id="nav-toggle"></i>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${user == null}">
                            <ul class="nav__list">
                                <li class="nav__item"><button class="nav__button"><a class="nav__link user" href="LoginController">Sign in</a></button></li>
                                <li class="nav__item"><button class="nav__button"><a class="nav__link user" href="RegisterController">Register</a></button></li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="nav__list">
                                <li class="nav__item logined"><img class="avatar" src="img/${user.avatar}" alt="">${user.userName}</li>
                                <li class="nav__item"><button class="nav__button"><a class="nav__link user" href="SignoutController">Sign out</a></button></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>
            </nav>
        </div>
    </body>
</html>
