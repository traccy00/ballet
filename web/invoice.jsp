<%-- 
    Document   : invoice
    Created on : Nov 10, 2020, 5:43:17 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- ===== BOXICONS ===== -->
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
        <!-- ===== CSS =====-->
        <link rel="stylesheet" href="css/style.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style>
            .p-5 {
                padding-top: 6rem !important;
            }
            span {
                font-family: Arial, sans-serif;
                font-size: 40px;
            }
        </style>
        <title>Invoice</title>
    </head>
    <body>
        <form action="${pageContext.request.getContextPath()}/InvoiceController" method="GET">
            <!-- ====================HEADER ================== -->
            <div class="l-header">
                <nav class="nav bd-grid">
                    <div>
                        <a href="#" class="nav__logo">Ballet</a>
                    </div>

                    <div class="nav__menu" id="nav-menu">
                        <ul class="nav__list">
                            <li class="nav__item"><a href="index.jsp" class="nav__link active">Home</a></li>
                                <% HttpSession s = request.getSession();
                                    if (s.getAttribute("LoginUser") == null) { %>
                            <li class="nav__item"><a href="login.jsp" class="nav__link">Log In</a></li>
                                <%} else {%>
                            <li class="nav__item"><a name="signout" href="login.jsp" class="nav__link">Sign out</a></li>
                                <%}%>
                        </ul>
                    </div>

                    <div>
                        <a href="CartController"><i class="bx bx-cart-alt nav__cart"></i></a>
                        <i class="bx bx-menu nav__toggle" id="nav-toggle"></i>
                    </div>
                </nav>
            </div>
            <!-- ==================== MAIN ==============-->
            <div class="l-main">
                <!--================ Content ============= -->
                <div class="content">
                    <div class="small-container">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body p-0">
                                        <div class="row p-5">
                                            <div class="col-md-6">
                                                <img src="img/checkoutsucc.png" style="width: 15%">
                                                <span>Thank you for your purchase</span>
                                            </div>

                                            <div class="col-md-6 text-right">
                                                <p class="font-weight-bold mb-1">Your order # is: ${sessionScope.invoiceid}</p>
                                                <p class="text-muted">Due to: ${sessionScope.date}</p>
                                                <button type="submit" name="export" value="export">Export Invoice</button>
                                                <%=request.getAttribute("message") == null ? "" :request.getAttribute("message")%>
                                            </div>
                                        </div>

                                        <hr class="my-5">

                                        <div class="row pb-5 p-5">
                                            <div class="col-md-6">
                                                <p class="font-weight-bold mb-4">Client Information</p>
                                                <p class="mb-1">User: ${sessionScope.LoginUser}</p>
                                                <!--<p>Acme Inc</p>-->
                                                <p class="mb-1"></p>
                                                <!--<p class="mb-1">6781 45P</p>-->
                                            </div>

                                            <div class="col-md-6 text-left">
                                                <p class="font-weight-bold mb-4">Payment Details</p>
                                                <p class="mb-1"><span class="text-muted">VAT: </span>10%</p>
                                                <p class="mb-1"><span class="text-muted">VAT ID: </span>${sessionScope.LoginUser}${sessionScope.idinvoice}</p>
                                                <p class="mb-1"><span class="text-muted">Payment Type: </span>${sessionScope.payment}</p>
                                                <p class="mb-1"><span class="text-muted">Name: </span> ${sessionScope.LoginUser}</p>
                                            </div>
                                        </div>

                                        <div class="row p-5">
                                            <div class="col-md-12">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <!--<th class="border-0 text-uppercase small font-weight-bold">ID</th>-->
                                                            <th class="border-0 text-uppercase small font-weight-bold">Item</th>
                                                            <!--<th class="border-0 text-uppercase small font-weight-bold">Description</th>-->
                                                            <th class="border-0 text-uppercase small font-weight-bold">Quantity</th>
                                                            <th class="border-0 text-uppercase small font-weight-bold">Unit Cost</th>
                                                            <th class="border-0 text-uppercase small font-weight-bold">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                       <c:forEach items="${sessionScope.listCart1}" var="item">
                                                            <tr>
                                                                <td>${item.getProductname()}</td>
                                                                <td>${item.getQuantity()}</td>
                                                                <td>${item.getPrice()}</td>
                                                                <td>${item.getPrice()} x ${item.getQuantity()}</td>
                                                            </tr>
                                                        </c:forEach>
<!--                                                        <tr>
                                                            <td>1</td>
                                                            <td>Software</td>
                                                            <td>LTS Versions</td>
                                                            <td>21</td>
                                                            <td>$321</td>
                                                            <td>$3452</td>
                                                        </tr>-->
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

<!--                                        <div class="d-flex flex-row-reverse bg-dark text-white p-4">
                                            <div class="py-3 px-5 text-right">
                                                <div class="mb-2">Grand Total</div>
                                                <div class="h2 font-weight-light">$234,234</div>
                                            </div>

                                            <div class="py-3 px-5 text-right">
                                                <div class="mb-2">Discount</div>
                                                <div class="h2 font-weight-light">10%</div>
                                            </div>

                                            <div class="py-3 px-5 text-right">
                                                <div class="mb-2">Sub - Total amount</div>
                                                <div class="h2 font-weight-light">$32,432</div>
                                            </div>
                                        </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="text-light mt-5 mb-5 text-center small">by : <a class="text-light" target="_blank" href="http://totoprayogo.com">totoprayogo.com</a></div>

                    </div>
                </div>
            </div>
            <!-- ==================== FOOTER ================== -->
            <footer class="footer section">
                <div class="footer__container bd-grid">

                    <div class="footer__box">
                        <h3 class="footer__title">XiaoMei</h3>
                        <div class="footer__deal">Products Store</div>
                        <a href="#"><img src="img/footerstore1.png" alt="" class="footer__store"></a>
                        <a href="#"><img src="img/footerstore2.png" alt="" class="footer__store"></a>
                    </div>

                    <div class="footer__box">
                        <h3 class="footer__title">EXPLORE</h3>
                        <ul>
                            <li><a href="#" class="footer__link">Home</a></li>
                            <li><a href="#" class="footer__link">Featured</a></li>
                            <li><a href="#" class="footer__link">New</a></li>
                            <li><a href="#" class="footer__link">Suscribe</a></li>
                        </ul>
                    </div>

                    <div class="footer__box">
                        <h3 class="footer__title">OUR SERVICES</h3>
                        <ul>
                            <li><a href="#" class="footer__link">Pricing</a></li>
                            <li><a href="#" class="footer__link">Free Shipping</a></li>
                            <li><a href="#" class="footer__link">Gift Cards</a></li>
                        </ul>
                    </div>

                    <div class="footer__box">
                        <h3 class="footer__title">FOLLOW</h3>
                        <a href="#" class="footer__social"><i class='bx bxl-facebook-square'></i></a>
                        <a href="#" class="footer__social"><i class='bx bxl-instagram-alt'></i></a>
                        <a href="#" class="footer__social"><i class='bx bxl-twitter'></i></a>
                        </ul>
                    </div>

                    <p class="footer__copy">&#169; 2020 copyright all right reserved</p>

                </div>
            </footer>
            <!-- ==================== MAIN JS ================== -->
            <!--ko chay  -->
            <!-- <script src="js/main.js"></script> -->
            <script>
                // ==================== MENU SHOW =============================
                const showMenu = (toggleId, navId) => {
                    const toggle = document.getElementById(toggleId),
                            nav = document.getElementById(navId);
                    if (toggle && nav) {
                        toggle.addEventListener('click', () => {
                            nav.classList.toggle('show');
                        })
                    }
                }
                showMenu('nav-toggle', 'nav-menu');

                const navlink = document.querySelectorAll('.nav__link');

                // ========================= REMOVE MENU MOBILE =====================
                function linkAction() {
                    //Acvite link: ko chay
                    // navlink.forEach(n => n.classList.remove('active'));
                    // this.classList.add('active');

                    //Remove menu mobile: khi chọn xong một mục nào đó của menu thì menu hiden
                    const navMenu = document.getElementById('nav-menu');
                    navMenu.classList.remove('show');
                }
                navlink.forEach(n => n.addEventListener('click', linkAction));
            </script>
        </form>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
</html>








