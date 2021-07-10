<%-- 
    Document   : checkout
    Created on : Nov 10, 2020, 12:16:03 PM
    Author     : Admin
--%>

<%@page import="Model.CartProduct"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- ===== BOXICONS ===== -->
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- ===== CSS =====-->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/checkout.css">
        <!--JS-->
        <script src="js/checkout.js" type="text/javascript"></script>
        <title>Checkout</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- ==================== MAIN ==============-->
        <div class="l-main">
            <!--================ Content ============= -->
            <div class="content">
                <div><span class="nav__logo">Ballet </span><span class="title_checkout"> | Check Out</span></div>
                <br>
                <img src="img/straight line.png" class="straight_line"/>
                <div class="part">
                    <div class="sub_part"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABvElEQVRIS82W/TEEQRDFfxcBIkAEiAAZEAEiQASIgAwQASJABIiAEIiAelWzavX1TPfuXdXpP3dm+r1+/bUTFmSTBeEyBngN2AA2C+lX4A34GBLEEOBD4AwQsGcicAXcZghkgAV014sw8isC+5ECEbDkfASWIzRz/gnsAiLhWgtYYC8NaSMuyvkWIBJT1gK+AQ4q3p+Bp3K2A2xX7infqo00sPL67txX9cqRlVApuQdWnTfrXr5rEZ+XCu77+Sqyu9KVMxFaMuCnpdr/fK4BS0Yr3xEg+Vt2AlyaC0qL0pECVlSWuSuZ8eelSL5WssDfA+rBXk29rUmtVrCFMjZiFWQ3Xn9J/rsca+YeGw2VK0XdqmoNHDvlLgB1Saq4JI2cWFO7qLptH6tqrytTblAfC1DOtf48U7v1J9dUu5RHbivprDUy98pWClq3eaxF0RFMSd1d8gZJlsgDIPKuRWtRA8EbgxF4NF5Tvz5jJK9K3DGOIu7ueUujFrW7FLLt5Dlt7efufnX/zgKsty3wNGjUTjUpPdlT8vYdZnNsSegvRGNVph0c7empIMYCy1H/hz5qr7kCDwabh9QzgerxD3jBUR8C9pASAAAAAElFTkSuQmCC"/>Received Address</div>
                    <button onclick="openForm()" class="sub_button">+Add Address</button>

                    <div class="form-popup" id="myForm">
                        <form action="/action_page.php" class="form-container">
                            <div>Add Address</div>

                            <input type="text" placeholder="Enter Full Name" name="name" required>
                            <input type="text" placeholder="Enter Phone Number" name="phone" required>
                            <input type="text" placeholder="Enter Address" name="address" required>
                            <button name="map">Choose one direction from map<br>Help order is shipped fastest</button>

                            <button type="submit" class="btn">Complete</button>
                            <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                        </form>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td class="name_phone">${defaultInfor.fullName} <br>${defaultInfor.phoneNumber}</td>
                                <td>${defaultInfor.address}</td>
                                <td><div class="default">Default</div></td>
                                <td><a href="ShowAddressController"><button class="sub_button">Change</button></a></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="part">
                    <table>
                        <tr>
                            <td><div class="sub_part">Product</div></td>
                            <!--<td></td>-->
                            <td>Unit Price</td>
                            <td>Quantity</td>
                            <td>Subtotal</td>
                        </tr>
                        <c:forEach items="${cart}" var="item">
                            <tr>
                                <td><img src="img/${item.imageName}"/>Dress Germany</td>
                                <!--<td>Size: M, White</td>-->
                                <td>vnd${item.unitPrice}</td>
                                <td>1</td>
                                <td>12.0000</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <table>
                        <tr>
                            <td>Message: <input class="message" type="text" placeholder="Note for shop"/></td>
                        </tr>
                    </table>
                </div>
                <div class="part">
                    <table>
                        <tr>
                            <td><div class="sub_part">Payment</div></td>
                            <td class="more_padding align_right">Payment on delivery<button class="sub_button">Change</button><td>
                        </tr>
                    </table>
                    <div class="more_padding">
                        <table class="table_all">
                            <tr>
                                <td>Subtotal:</td>
                                <td>$${subtotal}</td>
                            </tr>
                            <tr>
                                <td>Shipping:</td>
                                <td>$5</td>
                            </tr>
                            <tr>
                                <td>Total:</td>
                                <td>$${total}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="part">
                    <table>
                        <tr>
                            <td>Click "Order" means you agree with Xiao Mei Store's Policy</td>
                            <td><button class="button">Order</button></td>
                        </tr>
                    </table>
                </div>
                <!--POP UP-->

            </div>
        </div>
        <!-- ==================== FOOTER ================== -->
        <%@include file="footer.jsp" %>

    </body>
</html>



