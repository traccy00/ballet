<%-- 
    Document   : index
    Created on : Nov 8, 2020, 8:17:54 PM
    Author     : Admin
--%>

<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== BOXICONS ===== -->
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>

        <!-- ===== CSS =====-->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/index.css">

        <!-- ===== JS =====-->
        <script src="js/main.js" type="text/javascript"></script>

        <title>XiaoMei Store</title>
    </head>

    <body>
        <%@include file="header.jsp" %>

        <!-- ==================== MAIN ==============-->
        <div class="l-main">

            <!-- ===== HOME =====  -->
            <section class="home" id="home">
                <div class="home__container bd-grid">
                    <div class="home__data">
                        <h1 class="home__title">NEW <br><span>ARRIVALS</span></h1>
                        <a href="#featured" class="button">GO SHOPPING</a>
                    </div>
                    <img src="img/home3.png" alt="" class="home__img">
                </div>
            </section>

            <!-- ===== COLLECTION ===== -->
            <section class="collection section">
                <div class="collection__container bd-grid">
                    <div class="collection__box">
                        <img src="img/womenDress.jpg" alt="" class="collection__img">
                        <div class="collection__data">
                            <h2 class="collection__title"><span class="collection__subtitle">Ballet</span><br>Dress</h2>
                            <a href="#" class="collection__view">View collection</a>
                        </div>
                    </div>

                    <div class="collection__box">
                        <div class="collection__data">
                            <h2 class="collection__title"><span class="collection__subtitle">Women</span><br>Accessories</h2>
                            <a href="#" class="collection__view">View collection</a>
                        </div>
                        <img src="img/womenShoes.jpg" alt="" class="collection__img">
                    </div>
                </div>
            </section>

            <div class="content">
                <!-- ====== FEATURED PRODUCTS ===== -->
                <seciton class="featured section" id="featured">
                    <h2 class="section-title">FEATURED PRODUCTS</h2>
                    <a href="ShoppingController" class="section-all">View All</a>
                    <div class="featured__container bd-grid">
                        <c:forEach items="${featureProduct}" var="item">
                            <div class="featured__product">
                                <div class="featured__box">
                                    <div class="featured__new">NEW</div>
                                    <a href="DetailController?id=${item.id}">
                                        <img src="img/${item.image}" alt="" class="featured__img" style="width: 500px">
                                    </a>
                                </div>

                                <div class="featured__data">
                                    <h3 class="featured__name">${item.productName}</h3>
                                    <span class="featured__preci">${item.unitPrice}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </seciton>

                <!-- ====== OFFER ===== -->
                <section class="offer section">
                    <div class="offer__bg">
                        <div class="offer__data">
                            <h2 class="offer__title"><u>Special Offer</u></h2>
                            <p class="offer__description">Special offerts discounts for women this week only</p>
                            <a href="ShoppingController" class="button">SHOP NOW</a>
                        </div>
                    </div>
                </section>

                <!-- ====== NEW ARRIVALS ===== -->
                <section class="new section" id="new">
                    <h2 class="section-title">NEW ARRIVALS</h2>
                    <a href="ShoppingController" class="section-all">View All</a>
                    <div class="new__container bd-grid">
                        <c:forEach items="${newArrivalProduct}" var="item">
                            <div class="new__box">
                                <a href="DetailController?id=${item.id}">
                                    <img src="img/${item.image}" alt="" class="new__img">
                                </a>
                                <!--<div class="new__link"></div>-->
                            </div>
                        </c:forEach>
                    </div>
                </section>

                <!-- ====== NEWSLETTER ===== -->
                <section class="newsletter section" id="suscribe">
                    <div class="newsletter__container bd-grid">
                        <div class="newsletter__suscribe">
                            <h2 class="section-title">OUR NEWSLETTER</h2>
                            <p class="newsletter__description">Promotion new products and sales. Directly to your</p>

                            <form action="${pageContext.request.getContextPath()}/SubcribeController" method="POST">
                                <div class="newsletter__form">
                                    <input name="email" type="text"  class="newsletter__input" placeholder="Enter your email">
                                    <input type="submit" class="button" value="SUBCRIBED">
                                </div>
                            </form>

                        </div>
                    </div>
                </section>

                <!-- ====== SPONSORS ===== -->
                <section class="sponsors section">
                    <div class="sponsors__container bd-grid">

                        <div class="sponsors__logo">
                            <img src="img/logo1.png" alt="">
                        </div>

                        <div class="sponsors__logo">
                            <img src="img/logo2.png" alt="">
                        </div>

                        <div class="sponsors__logo">
                            <img src="img/logo3.png" alt="">
                        </div>

                        <div class="sponsors__logo">
                            <img src="img/logo4.png" alt="">
                        </div>

                    </div>
                </section>
            </div>
        </div>

        <!--================ ABOUT US =========-->
        <div class="about-section">
            <h1>About Us - Web Developers</h1>
            <p>Some text about who we are and what we do.</p>
            <p>Resize the browser window to see that this page is responsive by the way.</p>
        </div>

        <h2 style="text-align:center">Our Team</h2>
        <div class="row">
            <c:forEach items="${team}" var="item">
                <div class="column">
                    <div class="card">
                        <div class="container">
                            <img src="img/${item.image}"/>
                            <p class="title">${item.position}</p>
                            <h2>${item.name}</h2>
                            <p class="title">${item.position}</p>
                            <p>${item.description}</p>
                            <p>${item.email}</p>
                            <!--<p><button class="buttona">Contact</button></p>-->
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <%@include file="footer.jsp" %>

        <!-- ==================== MAIN JS ================== -->
    </body>
</html>
