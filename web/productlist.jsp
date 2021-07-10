<%-- 
    Document   : productlis
    Created on : Nov 17, 2020, 1:51:58 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="#">
        <meta name="keywords" content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
        <meta name="author" content="#">
        <!-- Favicon icon -->
        <link rel="icon" href="assets\images\favicon.ico" type="image/x-icon">
        <!-- Google font-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
        <!-- Required Fremwork -->
        <link rel="stylesheet" type="text/css" href="bower_components\bootstrap\css\bootstrap.min.css">
        <!-- Data Table Css -->
        <link rel="stylesheet" type="text/css" href="bower_components\datatables.net-bs4\css\dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="bower_components\datatables.net-responsive-bs4\css\responsive.bootstrap4.min.css">
        <!-- jquery file upload Frame work -->
        <link href="assets\pages\jquery.filer\css\jquery.filer.css" type="text/css" rel="stylesheet">
        <link href="assets\pages\jquery.filer\css\themes\jquery.filer-dragdropbox-theme.css" type="text/css" rel="stylesheet">
        <!-- animation nifty modal window effects css -->
        <link rel="stylesheet" type="text/css" href="assets\css\component.css">
        <!-- themify-icons line icon -->
        <link rel="stylesheet" type="text/css" href="assets\icon\themify-icons\themify-icons.css">
        <!-- ico font -->
        <link rel="stylesheet" type="text/css" href="assets\icon\icofont\css\icofont.css">
        <!-- feather Awesome -->
        <link rel="stylesheet" type="text/css" href="assets\icon\feather\css\feather.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="assets\css\style.css">
        <link rel="stylesheet" type="text/css" href="assets\css\jquery.mCustomScrollbar.css">
        <title>Product List</title>
    </head>
    <body>
        <form action="${pageContext.request.getContextPath()}/AdminProductListController" method="GET">
            <div id="pcoded" class="pcoded">
                <div class="pcoded-overlay-box"></div>
                <div class="pcoded-container navbar-wrapper">
                    <!-- NAVIGATION BAR -->
                    <nav class="navbar header-navbar pcoded-header">
                        <div class="navbar-wrapper">
                            <!-- LOGO -->
                            <div class="navbar-logo" style="height: 100px">
                                <a class="mobile-menu" id="mobile-collapse" href="#!">
                                    <i class="feather icon-menu"></i>
                                </a>
                                <a href="admin.htm">
                                    <img class="img-fluid" src="img/beauty_20190103135929.jpg" alt="logo" width="100px" style="border-radius: 50%;">
                                </a>
                                <a class="mobile-options">
                                    <i class="feather icon-more-horizontal"></i>
                                </a>
                            </div>

                            <div class="navbar-container container-fluid">
                                <ul class="nav-left">
                                    <li class="header-search">
                                        <div class="main-search morphsearch-search">
                                            <div class="input-group">
                                                <span class="input-group-addon search-close"><i class="feather icon-x"></i></span>
                                                <input type="text" class="form-control">
                                                <span class="input-group-addon search-btn"><i class="feather icon-search"></i></span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#!" onclick="javascript:toggleFullScreen()">
                                            <i class="feather icon-maximize full-screen"></i>
                                        </a>
                                    </li>
                                </ul>
                                <ul class="nav-right">
                                    <li class="header-notification">
                                        <div class="dropdown-primary dropdown">
                                            <div class="dropdown-toggle" data-toggle="dropdown">
                                                <i class="feather icon-bell"></i>
                                                <span class="badge bg-c-pink">5</span>
                                            </div>
                                            <ul class="show-notification notification-view dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                                <li>
                                                    <h6>Notifications</h6>
                                                    <label class="label label-danger">New</label>
                                                </li>
                                                <li>
                                                    <div class="media">
                                                        <img class="d-flex align-self-center img-radius" src="assets\images\avatar-4.jpg" alt="Generic placeholder image">
                                                        <div class="media-body">
                                                            <h5 class="notification-user">Soeng Souy</h5>
                                                            <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                            <span class="notification-time">30 minutes ago</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="media">
                                                        <img class="d-flex align-self-center img-radius" src="assets\images\avatar-3.jpg" alt="Generic placeholder image">
                                                        <div class="media-body">
                                                            <h5 class="notification-user">Joseph William</h5>
                                                            <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                            <span class="notification-time">30 minutes ago</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="media">
                                                        <img class="d-flex align-self-center img-radius" src="assets\images\avatar-4.jpg" alt="Generic placeholder image">
                                                        <div class="media-body">
                                                            <h5 class="notification-user">Sara Soudein</h5>
                                                            <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                            <span class="notification-time">30 minutes ago</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <!--user avatar and setting-->
                                    <li class="user-profile header-notification">
                                        <div class="dropdown-primary dropdown">
                                            <div class="dropdown-toggle" data-toggle="dropdown">
                                                <img src="img/beauty_20190103135929.jpg" class="img-radius" alt="User-Profile-Image">
                                                <span>Tieu Mai</span>
                                                <i class="feather icon-chevron-down"></i>
                                            </div>
                                            <ul class="show-notification profile-notification dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                                <li>
                                                    <a href="#!">
                                                        <i class="feather icon-settings"></i> Settings
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="user-profile.htm">
                                                        <i class="feather icon-user"></i> Profile
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="email-inbox.htm">
                                                        <i class="feather icon-mail"></i> My Messages
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="auth-normal-sign-in.htm">
                                                        <i class="feather icon-log-out"></i> Logout
                                                    </a>
                                                </li>
                                            </ul>

                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>

                    <!-- Sidebar chat start -->
                    <div id="sidebar" class="users p-chat-user showChat">
                        <div class="had-container">
                            <div class="card card_main p-fixed users-main">
                                <div class="user-box">
                                    <div class="chat-inner-header">
                                        <div class="back_chatBox">
                                            <div class="right-icon-control">
                                                <input type="text" class="form-control  search-text" placeholder="Search Friend" id="search-friends">
                                                <div class="form-icon">
                                                    <i class="icofont icofont-search"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="main-friend-list">
                                        <div class="media userlist-box" data-id="1" data-status="online" data-username="Josephin Doe" data-toggle="tooltip" data-placement="left" title="Josephin Doe">
                                            <a class="media-left" href="#!">
                                                <img class="media-object img-radius img-radius" src="assets\images\avatar-3.jpg" alt="Generic placeholder image ">
                                                <div class="live-status bg-success"></div>
                                            </a>
                                            <div class="media-body">
                                                <div class="f-13 chat-header">Josephin Doe</div>
                                            </div>
                                        </div>
                                        <div class="media userlist-box" data-id="2" data-status="online" data-username="Lary Doe" data-toggle="tooltip" data-placement="left" title="Lary Doe">
                                            <a class="media-left" href="#!">
                                                <img class="media-object img-radius" src="assets\images\avatar-2.jpg" alt="Generic placeholder image">
                                                <div class="live-status bg-success"></div>
                                            </a>
                                            <div class="media-body">
                                                <div class="f-13 chat-header">Lary Doe</div>
                                            </div>
                                        </div>
                                        <div class="media userlist-box" data-id="3" data-status="online" data-username="Alice" data-toggle="tooltip" data-placement="left" title="Alice">
                                            <a class="media-left" href="#!">
                                                <img class="media-object img-radius" src="assets\images\avatar-4.jpg" alt="Generic placeholder image">
                                                <div class="live-status bg-success"></div>
                                            </a>
                                            <div class="media-body">
                                                <div class="f-13 chat-header">Alice</div>
                                            </div>
                                        </div>
                                        <div class="media userlist-box" data-id="4" data-status="online" data-username="Alia" data-toggle="tooltip" data-placement="left" title="Alia">
                                            <a class="media-left" href="#!">
                                                <img class="media-object img-radius" src="assets\images\avatar-3.jpg" alt="Generic placeholder image">
                                                <div class="live-status bg-success"></div>
                                            </a>
                                            <div class="media-body">
                                                <div class="f-13 chat-header">Alia</div>
                                            </div>
                                        </div>
                                        <div class="media userlist-box" data-id="5" data-status="online" data-username="Suzen" data-toggle="tooltip" data-placement="left" title="Suzen">
                                            <a class="media-left" href="#!">
                                                <img class="media-object img-radius" src="..\files\assets\images\avatar-2.jpg" alt="Generic placeholder image">
                                                <div class="live-status bg-success"></div>
                                            </a>
                                            <div class="media-body">
                                                <div class="f-13 chat-header">Suzen</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Sidebar inner chat start-->
                    <div class="showChat_inner">
                        <div class="media chat-inner-header">
                            <a class="back_chatBox">
                                <i class="feather icon-chevron-left"></i> Josephin Doe
                            </a>
                        </div>
                        <div class="media chat-messages">
                            <a class="media-left photo-table" href="#!">
                                <img class="media-object img-radius img-radius m-t-5" src="..\files\assets\images\avatar-3.jpg" alt="Generic placeholder image">
                            </a>
                            <div class="media-body chat-menu-content">
                                <div class="">
                                    <p class="chat-cont">I'm just looking around. Will you tell me something about yourself?</p>
                                    <p class="chat-time">8:20 a.m.</p>
                                </div>
                            </div>
                        </div>
                        <div class="media chat-messages">
                            <div class="media-body chat-menu-reply">
                                <div class="">
                                    <p class="chat-cont">I'm just looking around. Will you tell me something about yourself?</p>
                                    <p class="chat-time">8:20 a.m.</p>
                                </div>
                            </div>
                            <div class="media-right photo-table">
                                <a href="#!">
                                    <img class="media-object img-radius img-radius m-t-5" src="..\files\assets\images\avatar-4.jpg" alt="Generic placeholder image">
                                </a>
                            </div>
                        </div>
                        <div class="chat-reply-box p-b-20">
                            <div class="right-icon-control">
                                <input type="text" class="form-control search-text" placeholder="Share Your Thoughts">
                                <div class="form-icon">
                                    <i class="feather icon-navigation"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Sidebar inner chat end-->
                    <div class="pcoded-main-container">
                        <div class="pcoded-wrapper">
                            <!-- NAVIGATOR BAR-->
                            <nav class="pcoded-navbar">
                                <div class="pcoded-inner-navbar main-menu">
                                    <ul class="pcoded-item pcoded-left-item">
                                        <!-- DASHBOARD -->
                                        <li class="pcoded-hasmenu active pcoded-trigger">
                                            <a href="javascript:void(0)">
                                                <span class="pcoded-micon"><i class="feather icon-home"></i></span>
                                                <span class="pcoded-mtext">Dashboard</span>
                                            </a>
                                            <ul class="pcoded-submenu">
                                                <li class="active">
                                                    <a href="admin.jsp">
                                                        <span class="pcoded-mtext">Statistic</span>
                                                    </a>
                                                </li>
                                                <!--                                            <li class=" ">
                                                                                                <a href="dashboard-analytics.htm">
                                                                                                    <span class="pcoded-mtext">Analytics</span>
                                                                                                    <span class="pcoded-badge label label-info ">NEW</span>
                                                                                                </a>
                                                                                            </li>-->
                                            </ul>
                                        </li>
                                    </ul>

                                    <!-- PAGES -->
                                    <div class="pcoded-navigatio-lavel">Manage Pages</div>
                                    <ul class="pcoded-item pcoded-left-item">
                                        <li class="pcoded-hasmenu">
                                            <a href="javascript:void(0)">
                                                <span class="pcoded-micon"><i class="feather icon-shopping-cart"></i></span>
                                                <span class="pcoded-mtext">E-Commerce</span>
                                                <!--<span class="pcoded-badge label label-danger">NEW</span>-->
                                            </a>
                                            <ul class="pcoded-submenu">
                                                <li class="">
                                                    <a href="AdminProductListController">
                                                        <span class="pcoded-mtext">List Product</span>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="AdminProductAddController">
                                                        <span class="pcoded-mtext">Add Product</span>
                                                    </a>
                                                </li>

                                            </ul>
                                        </li>
                                        <!--================================ MANAGE EMAIL-->
                                        <!--                                    <li class="pcoded-hasmenu ">
                                                                                <a href="javascript:void(0)">
                                                                                    <span class="pcoded-micon"><i class="feather icon-mail"></i></span>
                                                                                    <span class="pcoded-mtext">Email</span>
                                                                                </a>
                                                                                <ul class="pcoded-submenu">
                                                                                    <li class="">
                                                                                        <a href="email-compose.htm">
                                                                                            <span class="pcoded-mtext">Compose Email</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li class="">
                                                                                        <a href="email-inbox.htm">
                                                                                            <span class="pcoded-mtext">Inbox</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li class="">
                                                                                        <a href="email-read.htm">
                                                                                            <span class="pcoded-mtext">Read Mail</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li class="pcoded-hasmenu ">
                                                                                        <a href="javascript:void(0)">
                                                                                            <span class="pcoded-mtext">Email Template</span>
                                                                                        </a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>-->

                                        <!--============================== MANAGE INVOICE-->
                                        <li class="pcoded-hasmenu ">
                                            <a href="javascript:void(0)">
                                                <span class="pcoded-micon"><i class="feather icon-file-minus"></i></span>
                                                <span class="pcoded-mtext">Invoice</span>
                                            </a>
                                            <ul class="pcoded-submenu">
                                                <li class="">
                                                    <a href="invoice.jsp">
                                                        <span class="pcoded-mtext">Invoice</span>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="invoice-summary.htm">
                                                        <span class="pcoded-mtext">Invoice Summary</span>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="invoice.htm">
                                                        <span class="pcoded-mtext">Invoice List</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>

                                        <!--=============================== MANAGE ACCOUNT-->
                                        <li class="pcoded-hasmenu ">
                                            <a href="javascript:void(0)">
                                                <span class="pcoded-micon"><i class="feather icon-file-minus"></i></span>
                                                <span class="pcoded-mtext">Account</span>
                                            </a>
                                            <ul class="pcoded-submenu">
                                                <li class="">
                                                    <a href="AdminUserListController">
                                                        <span class="pcoded-mtext">User List</span>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="AdminAddUserController">
                                                        <span class="pcoded-mtext">Add New User</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                            <!-- CONTENT -->
                            <div class="pcoded-content">
                                <div class="pcoded-inner-content">
                                    <!-- Main-body start -->
                                    <div class="main-body">
                                        <div class="page-wrapper">
                                            <!-- Page-header start -->
                                            <div class="page-header">
                                                <div class="row align-items-end">
                                                    <div class="col-lg-8">
                                                        <div class="page-header-title">
                                                            <div class="d-inline">
                                                                <h4>Product List</h4>
                                                                <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="page-header-breadcrumb">
                                                            <ul class="breadcrumb-title">
                                                                <li class="breadcrumb-item">
                                                                    <a href="IndexController"> <i class="feather icon-home"></i> </a>
                                                                </li>
                                                                <li class="breadcrumb-item"><a href="#!">E-Commerce</a>
                                                                </li>
                                                                <li class="breadcrumb-item"><a href="#!">Product List</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Page-header end -->

                                            <!-- Page body start -->
                                            <div class="page-body">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <!-- Product list card start -->
                                                        <div class="card">
                                                            <div class="card-header">
                                                                <h5>Product List</h5>
                                                                <a href="productadd.jsp" class="btn btn-primary waves-effect waves-light f-right d-inline-block md-trigger" data-modal="modal-13"> <i class="icofont icofont-plus m-r-5"></i> Add Product
                                                                </a>
                                                            </div>
                                                            <div class="card-block">
                                                                <div class="table-responsive">
                                                                    <div class="table-content">
                                                                        <div class="project-table">
                                                                            <table id="e-product-list" class="table table-striped dt-responsive nowrap">
                                                                                <tr>
                                                                                    <th>Image</th>
                                                                                    <th>Product Name</th>
                                                                                    <th>Description</th>
                                                                                    <th>Price</th>
                                                                                    <th>Quantity</th>
                                                                                    <th>Action</th>
                                                                                </tr>
                                                                                <c:forEach items="${list}" var="item">
                                                                                    <tr>
                                                                                        <td class="pro-list-img">
                                                                                            <img src="img/${item.getImageName()}" class="img-fluid" alt="tbl" style="width: 200px;">
                                                                                        </td>
                                                                                        <td>${item.getProductname()}</td>
                                                                                        <td>${item.getDescription()}</td>
                                                                                        <td>${item.getPrice()}</td>
                                                                                        <td>
                                                                                            <label class="text-danger">${item.getQuantity()}</label>
                                                                                        </td>
                                                                                        <td class="action-icon">
                                                                                            <button type="submit" name="edit" value="${item.getProductid()}">Edit</button>
                                                                                            <button type="submit" name="delete" value="${item.getProductid()}">Delete</button>
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Product list card end -->
                                                    </div>
                                                </div>
                                                <!-- Add Contact Start Model start-->
                                                <!--                                                <div class="md-modal md-effect-13 addcontact" id="modal-13">
                                                                                                    <div class="md-content">
                                                                                                        <h3 class="f-26">Add Product</h3>
                                                                                                        <div>
                                                                                                            <div class="input-group">
                                                                                                                <input type="text" class="form-control pname" placeholder="Choose image" name="image">
                                                                                                                <span class="input-group-addon btn btn-primary" data-name="file">Choose File</span>
                                                                                                            </div>
                                                                                                            <div class="input-group">
                                                                                                                <span class="input-group-addon"><i class="icofont icofont-user"></i></span>
                                                                                                                <input type="text" class="form-control pname" placeholder="Prodcut Name">
                                                                                                            </div>
                                                                                                            <div class="input-group">
                                                                                                                <span class="input-group-addon"><i class="icofont icofont-user"></i></span>
                                                                                                                <input type="text" class="form-control pamount" placeholder="Amount">
                                                                                                            </div>
                                                                                                            <div class="input-group">
                                                                                                                <select id="hello-single" class="form-control stock">
                                                                                                                    <option value="">---- Select Stock ----</option>
                                                                                                                    <option value="married">In Stock</option>
                                                                                                                    <option value="unmarried">Out of Stock</option>
                                                                                                                    <option value="unmarried">Law Stock</option>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                            <div class="text-center">
                                                                                                                <button type="button" class="btn btn-primary waves-effect m-r-20 f-w-600 d-inline-block save_btn">Save</button>
                                                                                                                <button type="button" class="btn btn-primary waves-effect m-r-20 f-w-600 md-close d-inline-block close_btn">Close</button>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>-->
                                                <div class="md-overlay"></div>
                                                <!-- Add Contact Ends Model end-->
                                            </div>
                                            <!-- Page body end -->
                                        </div>
                                    </div>
                                    <!-- Main-body end -->
                                    <div id="styleSelector">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Required Jquery -->
            <script type="text/javascript" src="bower_components\jquery\js\jquery.min.js"></script>
            <script type="text/javascript" src="bower_components\jquery-ui\js\jquery-ui.min.js"></script>
            <script type="text/javascript" src="bower_components\popper.js\js\popper.min.js"></script>
            <script type="text/javascript" src="bower_components\bootstrap\js\bootstrap.min.js"></script>
            <!-- jquery slimscroll js -->
            <script type="text/javascript" src="bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
            <!-- modernizr js -->
            <script type="text/javascript" src="bower_components\modernizr\js\modernizr.js"></script>
            <script type="text/javascript" src="bower_components\modernizr\js\css-scrollbars.js"></script>

            <!-- datatable js -->
            <script src="bower_components\datatables.net\js\jquery.dataTables.min.js"></script>
            <script src="bower_components\datatables.net-bs4\js\dataTables.bootstrap4.min.js"></script>
            <script src="bower_components\datatables.net-responsive\js\dataTables.responsive.min.js"></script>
            <script src="bower_components\datatables.net-responsive-bs4\js\responsive.bootstrap4.min.js"></script>
            <!-- jquery file upload js -->
            <script src="assets\pages\jquery.filer\js\jquery.filer.min.js"></script>
            <script src="assets\pages\filer\custom-filer.js" type="text/javascript"></script>
            <script src="assets\pages\filer\jquery.fileuploads.init.js" type="text/javascript"></script>
            <!-- Model animation js -->
            <script src="assets\js\classie.js"></script>
            <script src="assets\js\modalEffects.js"></script>
            <!-- product list js -->
            <script type="text/javascript" src="assets\pages\product-list\product-list.js"></script>
            <!-- i18next.min.js -->
            <script type="text/javascript" src="bower_components\i18next\js\i18next.min.js"></script>
            <script type="text/javascript" src="bower_components\i18next-xhr-backend\js\i18nextXHRBackend.min.js"></script>
            <script type="text/javascript" src="bower_components\i18next-browser-languagedetector\js\i18nextBrowserLanguageDetector.min.js"></script>
            <script type="text/javascript" src="bower_components\jquery-i18next\js\jquery-i18next.min.js"></script>
            <script src="assets\js\pcoded.min.js"></script>
            <script src="assets\js\vartical-layout.min.js"></script>
            <script src="assets\js\jquery.mCustomScrollbar.concat.min.js"></script>
            <!-- Custom js -->
            <script type="text/javascript" src="assets\js\script.js"></script>
            <!-- Global site tag (gtag.js) - Google Analytics -->
            <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
            <script>
                                            window.dataLayer = window.dataLayer || [];

                                            function gtag() {
                                                dataLayer.push(arguments);
                                            }
                                            gtag('js', new Date());

                                            gtag('config', 'UA-23581568-13');
            </script>
        </form>
    </body>
</html>
