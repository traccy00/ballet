<%-- 
    Document   : productdetail
    Created on : Apr 13, 2021, 1:56:47 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Product Card/Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/productdetail.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
        <script src="js/script.js" type="text/javascript"></script>
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
        <!-- ===== CSS =====-->
        <link rel="stylesheet" href="css/style.css">
        <!-- ===== JS =====-->
        <script src="js/main.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="l-main">
            <div class="content">
                <div class = "card-wrapper">
                    <div class = "card">
                        <!-- card left -->
                        <div class = "product-imgs">
                            <div class = "img-display">
                                <div class = "img-showcase">
                                    <c:forEach items="${imageList}" var="item">
                                        <img src="img/${item.name}" style="width: 100%">
                                    </c:forEach>
                                </div>
                            </div>
                            <div class = "img-select">
                                <c:forEach items="${imageList}" var="item">
                                    <div class = "img-item">
                                        <a href = "#" data-id = "1">
                                            <img src="img/${item.name}">
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- card right -->
                        <div class = "product-content">
                            <h2 class = "product-title">${product.productName}</h2>
                            <a href = "#" class = "product-link">visit nike store</a>
                            <div class = "product-rating">
                                <i class = "fas fa-star"></i>
                                <i class = "fas fa-star"></i>
                                <i class = "fas fa-star"></i>
                                <i class = "fas fa-star"></i>
                                <i class = "fas fa-star-half-alt"></i>
                                <span>4.7(21)</span>
                            </div>

                            <div class = "product-price">
                                <p class = "last-price">Old Price: <span>$257.00</span></p>
                                <p class = "new-price">New Price: <span>$249.00 (5%)</span></p>
                            </div>

                            <div class = "product-detail">
                                <h2>about this item: </h2>
                                <p>${product.description}</p>
                                <ul>
                                    <li>Color: <span>Black</span></li>
                                    <li>Available: <span>in stock</span></li>
                                    <li>Category: <span>Shoes</span></li>
                                    <li>Shipping Area: <span>All over the world</span></li>
                                    <li>Shipping Fee: <span>Free</span></li>
                                </ul>
                            </div>

                            <div class = "purchase-info">
                                <form action="CartController" method="POST"> 
                                    <input type="text" name="id" value="${product.id}" hidden="hidden">
                                    <input type="number" name="quantity" value="1">
                                    <input type="submit" class="btn" value="Add to Cart"><i class = "fas fa-shopping-cart "></i>
                                </form>
                            </div>

                            <div class = "social-links">
                                <p>Share At: </p>
                                <a href = "#">
                                    <i class = "fab fa-facebook-f"></i>
                                </a>
                                <a href = "#">
                                    <i class = "fab fa-twitter"></i>
                                </a>
                                <a href = "#">
                                    <i class = "fab fa-instagram"></i>
                                </a>
                                <a href = "#">
                                    <i class = "fab fa-whatsapp"></i>
                                </a>
                                <a href = "#">
                                    <i class = "fab fa-pinterest"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
