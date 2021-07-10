<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/login.css" />
        <title>Sign in & Sign up Form</title>
        <script src="js/login.js" type="text/javascript"></script>
    </head>

    <body>
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="${pageContext.request.getContextPath()}/ValidateUserAccount" class="sign-in-form" method="POST">
                        <h2 class="title">Sign in</h2>
                        <div class="message_error">${message}</div>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="username" placeholder="Username" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password" placeholder="Password" />
                        </div>
                        <div>
                            <input type="checkbox"> Stay sign in
                        </div>
                        <input class="btn solid" type="submit" value="Login" />
                        <p class="social-text">Or Sign in with social platforms</p>
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
                        <h3>New here ?</h3>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum laboriosam ad deleniti.
                        </p>
                        <a href="RegisterController"><button class="btn transparent" id="sign-in-btn">Sign Up</button></a>
                    </div>
                    <img src="img/signin-signup.png" class="image" alt="" />
                </div>
            </div>
        </div>
        <script>
            const sign_in_btn = document.querySelector('#sign-in-button');
            const sign_up_btn = document.querySelector('#sign-up-button');
            const container = document.querySelector('.container');

            sign_up_btn.addEventListener('click', () => {
                container.classList.add('sign-up-mode');
            })
            sign_in_btn.addEventListener('click', () => {
                container.classList.remove('sign-up-mode');
            })

        </script>
    </body>

</html>