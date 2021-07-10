<%-- 
    Document   : cart
    Created on : Nov 8, 2020, 1:01:53 AM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.CartProduct"%>
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
        <!-- ===== JS =====-->
        <script src="js/main.js" type="text/javascript"></script>
        <title>Shopping Cart</title>
        <script src="js/cart.js" type="text/javascript"></script>
        <link href="css/cart.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <!-- ==================== MAIN ==============-->
        <div class="l-main">
            <!--================ Content ============= -->
            <div class="content">
                <h1>Shopping Cart</h1>

                <div class="shopping-cart">
                    <div class="column-labels">
                        <label class="product-image">Image</label>
                        <label class="product-details">Product</label>
                        <label class="product-price">Price</label>
                        <label class="product-quantity">Quantity</label>
                        <label class="product-removal">Remove</label>
                        <label class="product-line-price">Total</label>
                    </div>
                    <c:forEach items="${cart}" var="item">
                        <div class="product">
                            <div class="product-image">
                                <img src="img/d1.jpg">
                            </div>
                            <div class="product-details">
                                <div class="product-title">${item.productName}</div>
                                <p class="product-description">${item.description}</p>
                            </div>
                            <div class="product-price">${item.unitPrice}</div>
                            <div class="product-quantity">
                                <input type="number" value="${item.quantity}" min="1">
                            </div>
                            <form action="${pageContext.request.getContextPath()}/CartController" method="POST">
                                <div class="product-removal">
                                    <input type="text" name="remove" value="${item.id}" hidden/>
                                    <input type="submit" name="submit" value="Remove"/>
                                </div>
                            </form>

                            <!--TOTAL OF PRODUCT PRICE-->
                            <div class="product-line-price">25.98</div>
                        </div>
                    </c:forEach>

                    <!--total-->
                    <div class="promoCode"><label for="promo">Have A Promo Code?</label><input type="text" name="promo" placholder="Enter Code" />
                        <a href="#" class="btn"></a></div>

                    <div class="subtotal cf">
                        <ul>
                            <li class="totalRow"><span class="label">Subtotal</span><span class="value">$${subtotal}</span></li>

                            <li class="totalRow"><span class="label">Shipping</span><span class="value">$5.00</span></li>

                            <!--<li class="totalRow"><span class="label">Tax</span><span class="value">$4.00</span></li>-->
                            <li class="totalRow final"><span class="label">Total</span><span class="value">$${total}</span></li>
                            <li class="totalRow"><a href="CheckOutController" class="btn continue">Checkout</a></li>
                        </ul>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<!-- ==================== MAIN JS ================== -->
</body>
</html>
