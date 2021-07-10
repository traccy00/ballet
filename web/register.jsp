<%-- 
    Document   : register
    Created on : Apr 17, 2021, 4:18:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/login.css" />
        <title>Register</title>
        <script src="js/login.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="${pageContext.request.getContextPath()}/RegisterController" class="sign-in-form">
                        <h2 class="title">Sign up</h2>
                        <div class="message_error">${message}</div>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input name="username" type="text" placeholder="Username" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input name="password" type="password" placeholder="Password" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input name="email" type="email" placeholder="Email" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-phone"></i>
                            <input name="phonenumber" type="text" placeholder="Phone number" />
                        </div>
                        
                        <input type="submit" class="btn" value="Sign up" />
                        <p class="social-text">Or Sign up with social platforms</p>
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>

            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>One of us ?</h3>
                        <p>
                            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis, ex ratione. Aliquid!
                        </p>
                        <a href="LoginController"><button class="btn transparent" id="sign-up-btn">Sign In</button></a>
                    </div>
                    <img src="img/signin-signup.png" class="image" alt=""/>
                </div>
            </div>
        </div>
    </body>
</html>
