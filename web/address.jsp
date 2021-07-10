<%-- 
    Document   : address
    Created on : Apr 18, 2021, 9:21:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Address</title>
        <!-- ===== BOXICONS ===== -->
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
        <!-- ===== CSS =====-->
        <link rel="stylesheet" href="css/style.css">
        <link href="css/checkout.css" rel="stylesheet" type="text/css"/>
        <!-- ===== JS =====-->
        <script src="js/main.js" type="text/javascript"></script>
        <script src="js/cart.js" type="text/javascript"></script>
        <link href="css/cart.css" rel="stylesheet" type="text/css"/>
        <link href="css/checkout.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- ==================== MAIN ==============-->
        <div class="l-main">
            <!--================ Content ============= -->
            <div class="content">
                <div><span class="nav__logo">Ballet </span><span class="title_checkout"> | Change Address</span></div>
                <img src="img/straight line.png" class="straight_line"/>
                <div class="part">
                    <div class="sub_part"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABvElEQVRIS82W/TEEQRDFfxcBIkAEiAAZEAEiQASIgAwQASJABIiAEIiAelWzavX1TPfuXdXpP3dm+r1+/bUTFmSTBeEyBngN2AA2C+lX4A34GBLEEOBD4AwQsGcicAXcZghkgAV014sw8isC+5ECEbDkfASWIzRz/gnsAiLhWgtYYC8NaSMuyvkWIBJT1gK+AQ4q3p+Bp3K2A2xX7infqo00sPL67txX9cqRlVApuQdWnTfrXr5rEZ+XCu77+Sqyu9KVMxFaMuCnpdr/fK4BS0Yr3xEg+Vt2AlyaC0qL0pECVlSWuSuZ8eelSL5WssDfA+rBXk29rUmtVrCFMjZiFWQ3Xn9J/rsca+YeGw2VK0XdqmoNHDvlLgB1Saq4JI2cWFO7qLptH6tqrytTblAfC1DOtf48U7v1J9dUu5RHbivprDUy98pWClq3eaxF0RFMSd1d8gZJlsgDIPKuRWtRA8EbgxF4NF5Tvz5jJK9K3DGOIu7ueUujFrW7FLLt5Dlt7efufnX/zgKsty3wNGjUTjUpPdlT8vYdZnNsSegvRGNVph0c7empIMYCy1H/hz5qr7kCDwabh9QzgerxD3jBUR8C9pASAAAAAElFTkSuQmCC"/>Received Address</div>
                    <form action="${pageContext.request.getContextPath()}/ChangeAddressController" method="POST">
                        <div>
                            <table>
                                <c:forEach items="${inforList}" var="item">
                                    <tr>
                                        <td class="radio">
                                            <input name="id" value="${item.id}" hidden="hidden"/>
                                            <input type="radio" name="selected"/>
                                        </td>
                                        <td class="name_phone">${item.fullName} <br>${item.phoneNumber}</td>
                                        <td>${item.address}</td>
                                        <td><div class="default">${item.defaultString}</div></td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <div>
                                <button type="submit" class="sub_button">Done</button>
                                <a href="CheckOutController"><button class="sub_button" >Back</button></a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <!-- ==================== MAIN JS ================== -->
    </body>
</html>
