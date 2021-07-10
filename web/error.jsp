<%-- 
    Document   : error
    Created on : Feb 7, 2021, 7:34:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="l-main">
            <div class="content">
                <h1>${message}</h1>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
