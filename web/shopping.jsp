<%-- 
    Document   : shopping
    Created on : Apr 13, 2021, 11:06:21 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/shopping.css" rel="stylesheet" type="text/css"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;700&display=swap" rel="stylesheet" />

        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />


        <!-- Carousel -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.min.css
              ">
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- ==================== MAIN ==============-->
        <div class="l-main">
            <!--================ Content ============= -->
            <div class="content">
                <!--SLIDER-->
                <div class="hero">
                    <div class="glide" id="glide_1">
                        <div class="glide__track" data-glide-el="track">
                            <ul class="glide__slides">
                                <li class="glide__slide">
                                    <div class="hero__center">
                                        <div class="hero__left">
                                            <span class="">We offer you the best products</span>
                                            <h1 class="">Praise dance dresses for girls and praise dance dresses for women</h1>
                                            <p></p>
                                            <a href="#"><button class="hero__btn">SHOP NOW</button></a>
                                        </div>
                                        <div class="hero__right">
                                            <div class="hero__img-container">
                                                <img class="banner_01" src="img/d5.jpg" alt="banner2" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="glide__slide">
                                    <div class="hero__center">
                                        <div class="hero__left">
                                            <span>New Inspiration 2020</span>
                                            <h1>PHONES MADE FOR YOU!</h1>
                                            <p>Trending from mobile and headphone style collection</p>
                                            <a href="#"><button class="hero__btn">SHOP NOW</button></a>
                                        </div>
                                        <div class="hero__right">
                                            <img class="banner_02" src="img/d6.jpg" alt="banner2" />
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="glide__bullets" data-glide-el="controls[nav]">
                            <button class="glide__bullet" data-glide-dir="=0"></button>
                            <button class="glide__bullet" data-glide-dir="=1"></button>
                        </div>

                        <div class="glide__arrows" data-glide-el="controls">
                            <button class="glide__arrow glide__arrow--left" data-glide-dir="<">
                                <svg>
                                <use xlink:href="img/sprite.svg#icon-arrow-left2"></use>
                                </svg>
                            </button>
                            <button class="glide__arrow glide__arrow--right" data-glide-dir=">">
                                <svg>
                                <use xlink:href="img/sprite.svg#icon-arrow-right2"></use>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
                <!--CATEGORY-->
                <section class="category__section section" id="category">
                    <div class="tab__list">
                        <div class="title__container tabs">
                            <div class="section__titles category__titles ">
                                <div class="section__title filter-btn active" data-id="All Products">
                                    <span class="dot"></span>
                                    <h1 class="primary__title"><a href="">All Products</a></h1>
                                </div>
                            </div>
                            <c:forEach items="${catList}" var="item">
                                <div class="section__titles">
                                    <div class="section__title filter-btn" data-id="Trending Products">
                                        <span class="dot"></span>
                                        <h1 class="primary__title">${item.name}</h1>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="category__container aos-init" data-aos="fade-up" data-aos-duration="1200">
                        <div class="category__center"> 
                            <c:forEach items="${productList}" var="item">
                                <div class="product category__products">
                                    <div class="product__header">
                                        <img src="img/${item.image}" alt="product">
                                    </div>
                                    <div class="product__footer">
                                        <h3>${item.productName}</h3>
                                        <div class="rating">
                                            <svg>
                                            <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                            </svg>
                                            <svg>
                                            <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                            </svg>
                                            <svg>
                                            <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                            </svg>
                                            <svg>
                                            <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                            </svg>
                                            <svg>
                                            <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                            </svg>
                                        </div>
                                        <div class="product__price">
                                            <h4>vnd${item.unitPrice}</h4>
                                        </div>
                                        <a href="DetailController?id=${item.id}"><button class="product__btn">View Product</button></a>
                                    </div>
                                    <ul>
                                        <li>
                                            <a data-tip="Quick View" data-place="left" href="#">
                                                <svg>
                                                <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                <svg>
                                                <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a data-tip="Add To Compare" data-place="left" href="#">
                                                <svg>
                                                <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                </svg>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>
                <div class="paging">
                    <c:forEach begin="1" end="${totalPage}" var="item">
                        <a class="${page == item ? "active" : ""}" href="ShoppingController?page=${item}">${item}</a>
                    </c:forEach>
                </div>

                <!--LASTEST PRODUCT-->
                <section class="section latest__products" id="latest">
                    <div class="title__container">
                        <div class="section__title active" data-id="Latest Products">
                            <span class="dot"></span>
                            <h1 class="primary__title">Latest Products</h1>
                        </div>
                    </div>
                    <div class="container" data-aos="fade-up" data-aos-duration="1200">
                        <div class="glide" id="glide_2">
                            <div class="glide__track" data-glide-el="track">
                                <ul class="glide__slides latest-center">
                                    <li class="glide__slide">
                                        <div class="product">
                                            <div class="product__header">
                                                <img src="img/products/iPhone/iphone6.jpeg" alt="product">
                                            </div>
                                            <div class="product__footer">
                                                <h3>Apple iPhone 11</h3>
                                                <div class="rating">
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                                    </svg>
                                                </div>
                                                <div class="product__price">
                                                    <h4>$750</h4>
                                                </div>
                                                <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <a data-tip="Quick View" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="glide__slide">
                                        <div class="product">
                                            <div class="product__header">
                                                <img src="img/products/sumsung/samsung5.jpeg" alt="product">
                                            </div>
                                            <div class="product__footer">
                                                <h3>Samsung Galaxy</h3>
                                                <div class="rating">
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                                    </svg>
                                                </div>
                                                <div class="product__price">
                                                    <h4>$900</h4>
                                                </div>
                                                <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <a data-tip="Quick View" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="glide__slide">
                                        <div class="product">
                                            <div class="product__header">
                                                <img src="img/products/headphone/headphone4.jpeg" alt="product">
                                            </div>
                                            <div class="product__footer">
                                                <h3>Sony WH-CH510</h3>
                                                <div class="rating">
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                                    </svg>
                                                </div>
                                                <div class="product__price">
                                                    <h4>$600</h4>
                                                </div>
                                                <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <a data-tip="Quick View" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="glide__slide">
                                        <div class="product">
                                            <div class="product__header">
                                                <img src="img/products/sumsung/samsung3.jpeg" alt="product">
                                            </div>
                                            <div class="product__footer">
                                                <h3>Samsung Galaxy</h3>
                                                <div class="rating">
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                                    </svg>
                                                </div>
                                                <div class="product__price">
                                                    <h4>$850</h4>
                                                </div>
                                                <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <a data-tip="Quick View" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="glide__slide">
                                        <div class="product">
                                            <div class="product__header">
                                                <img src="img/products/iPhone/iphone2.jpeg" alt="product">
                                            </div>
                                            <div class="product__footer">
                                                <h3>Apple iPhone 11</h3>
                                                <div class="rating">
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                                    </svg>
                                                </div>
                                                <div class="product__price">
                                                    <h4>$450</h4>
                                                </div>
                                                <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <a data-tip="Quick View" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="glide__slide">
                                        <div class="product">
                                            <div class="product__header">
                                                <img src="img/products/headphone/headphone2.jpeg" alt="product">
                                            </div>
                                            <div class="product__footer">
                                                <h3>Sony WH-CH510</h3>
                                                <div class="rating">
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                                    </svg>
                                                </div>
                                                <div class="product__price">
                                                    <h4>$300</h4>
                                                </div>
                                                <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <a data-tip="Quick View" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="glide__slide">
                                        <div class="product">
                                            <div class="product__header">
                                                <img src="img/products/sumsung/samsung1.jpeg" alt="product">
                                            </div>
                                            <div class="product__footer">
                                                <h3>Samsung Galaxy</h3>
                                                <div class="rating">
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                                    </svg>
                                                </div>
                                                <div class="product__price">
                                                    <h4>$300</h4>
                                                </div>
                                                <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <a data-tip="Quick View" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="glide__slide">
                                        <div class="product">
                                            <div class="product__header">
                                                <img src="img/products/headphone/headphone1.jpeg" alt="product">
                                            </div>
                                            <div class="product__footer">
                                                <h3>Sony WH-CH510</h3>
                                                <div class="rating">
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                                    </svg>
                                                </div>
                                                <div class="product__price">
                                                    <h4>$250</h4>
                                                </div>
                                                <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <a data-tip="Quick View" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="glide__slide">
                                        <div class="product">
                                            <div class="product__header">
                                                <img src="img/products/iPhone/iphone1.jpeg" alt="product">
                                            </div>
                                            <div class="product__footer">
                                                <h3>Apple iPhone XR</h3>
                                                <div class="rating">
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-full"></use>
                                                    </svg>
                                                    <svg>
                                                    <use xlink:href="img/sprite.svg#icon-star-empty"></use>
                                                    </svg>
                                                </div>
                                                <div class="product__price">
                                                    <h4>$550</h4>
                                                </div>
                                                <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <a data-tip="Quick View" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-eye"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-heart-o"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                                        <svg>
                                                        <use xlink:href="img/sprite.svg#icon-loop2"></use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>

                                
                                </ul>
                            </div>

                            <div class="glide__arrows" data-glide-el="controls">
                                <button class="glide__arrow glide__arrow--left" data-glide-dir="<">
                                    <svg>
                                    <use xlink:href="img/sprite.svg#icon-arrow-left2"></use>
                                    </svg>
                                </button>
                                <button class="glide__arrow glide__arrow--right" data-glide-dir=">">
                                    <svg>
                                    <use xlink:href="img/sprite.svg#icon-arrow-right2"></use>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <%@include file="footer.jsp" %>
        <!-- Glide Carousel Script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>
        <!-- Animate On Scroll -->
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <!-- Custom JavaScript -->
        <script src="js/products.js"></script>
        <script src="js/slider.js"></script>

    </body>
</html>
