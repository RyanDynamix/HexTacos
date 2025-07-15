<%-- 
    Document   : userMainPage
    Created on : Jun 29, 2024, 10:21:40 PM
    Author     : HoangNam
--%>

<%@page contentType="text/html" import="model.*,java.util.*, dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/userCss/trang_chu.css">
        <link rel="shortcut icon" href="./img_svg/mainPage/logo-color.png">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
        <!--        <style>
                    body{overflow-x: hidden;}
                </style>-->
        <title>Hextech Shop</title>

    </head>

    <body>
        <header class="position-fixed w-100 bg-light hight--header d-flex flex-column">
            <div class="bannerTopHead container-fluid d-none d-lg-block">
                <div class="row">
                    <div class="col-md-4">
                        <img class="imgTopHead"
                             src="./img_svg/topBanner/Top banner_Thu cu.svg"
                             alt="Top Banner Mobile dịch vụ thu cũ - lên đời">
                    </div>
                    <div class="col-md-4">
                        <img class="imgTopHead"
                             src="./img_svg/topBanner/Top banner_Chinh hang.svg"
                             alt="TOP banner mobile sản phẩm chính hãng đầy đủ VAT">
                    </div>
                    <div class="col-md-4">
                        <img class="imgTopHead"
                             src="./img_svg/topBanner/Top banner_Giao hang.svg"
                             alt="TOP banner mobile giao nhanh miễn phí">
                    </div>
                </div>
            </div>

            <div id="carouselExampleControls" class="carousel slide d-block d-lg-none" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="w-100">
                            <img class="imgTopHead w-100"
                                 src="./img_svg/topBanner/Top banner_Thu cu.svg"
                                 alt="Top Banner Mobile dịch vụ thu cũ - lên đời">
                        </div>
                    </div>
                    <div class="carousel-item ">
                        <div class="w-100">
                            <img class="imgTopHead w-100"
                                 src="./img_svg/topBanner/Top banner_Chinh hang.svg"
                                 alt="TOP banner mobile sản phẩm chính hãng đầy đủ VAT">
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="w-100">
                            <img class="imgTopHead w-100"
                                 src="./img_svg/topBanner/Top banner_Giao hang.svg"
                                 alt="TOP banner mobile giao nhanh miễn phí">
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>


            <!-- Nav-bar -->
            <nav class="navbar align-items-center border-bottom flex-grow-1">
                <div class="container-fluid">
                    <div class="d-flex align-items-center ">
                        <a href="homePage" class="navbar-brand m-0 textColor fw-bold brand pacifico-regular">HexTech</a>
                        <div id="verticalbar" class="mx-xxl-2 mx-1 d-none d-lg-inline-block"></div>
                        <a href="homePage"
                           class="nav-link textColor fw-lighter lh-sm brandSubHeading d-none d-lg-inline-block pacifico-regular">Công
                            Nghệ
                            <br>
                            <span class="fw-medium brandSubHeading d-none d-lg-inline-block pacifico-regular">Thay Đổi Cuộc
                                Sống</span>
                        </a>
                        <div class="position-relative ms-4 d-none d-xl-inline-block">
                            <form action="search" method="POST">
                                <input name="keyword" class="searchInput bg-body-tertiary iconCursor ps-md-5 p-1 p-md-2 " type="search"
                                       placeholder="Bạn cần tìm gì..." aria-label="Search" value="">
                            </form>
                            <img class="position-absolute searchImg iconCursor" src="./img_svg/navBar_menu/search.svg" alt="search">
                        </div>

                    </div>
                    <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0">
                        <div class="d-none d-lg-block">
                            <ul class="d-flex m-0 list-unstyled ">
                                <li class="nav-item iconChange  me-4 pt-2">
                                    <a href="#footer" class="nav-link text-center  p-0">
                                        <div class=" d-flex align-items-center overflow-hidden changeWidth mx-auto">
                                            <img class="one iconHeight mx-2" src="./img_svg/navBar_menu/telephone.png" alt="book">
                                            <img class="two iconHeight mx-2" src="./img_svg/navBar_menu/telephone-tran.png" alt="book-half">
                                        </div>
                                        <div class="smallFont textColor">Gọi điện</div>
                                    </a>
                                </li>
                                <li class="nav-item iconChange   me-4 pt-2">
                                    <a href="#footer" class="nav-link text-center p-0">
                                        <div class=" d-flex align-items-center overflow-hidden changeWidth mx-auto">
                                            <img class="iconHeight mx-2" src="./img_svg/navBar_menu/placeholder.png" alt="dpad">
                                            <img class=" iconHeight mx-2" src="./img_svg/navBar_menu/placehoder-tran.png" alt="dpad">
                                        </div>
                                        <div class="smallFont textColor">Địa chỉ</div>
                                    </a>
                                </li>
                                <li class="nav-item iconChange  me-4 pt-1">
                                    <a href="deliveryList" class="nav-link text-center p-0">
                                        <div class=" d-flex align-items-center overflow-hidden changeWidth mx-auto">
                                            <img class="iconHeight--delivery mx-2" src="./img_svg/navBar_menu/delivery-car.png"
                                                 alt="bar-chart">
                                            <img class=" iconHeight--delivery mx-2" src="./img_svg/navBar_menu/delivery-car-tran.png"
                                                 alt="bar-chart">
                                        </div>
                                        <div class="smallFont textColor">Đơn hàng </div>
                                    </a>
                                </li>
                                <li class="nav-item iconChange  me-4 pt-2">
                                    <a href="shopping" class="nav-link text-center p-0">
                                        <div class=" d-flex align-items-center overflow-hidden changeWidth mx-auto">
                                            <img class="iconHeight mx-2" src="./img_svg/navBar_menu/hand-bag.png" alt="lightbulb">
                                            <img class=" iconHeight mx-2" src="./img_svg/navBar_menu/hand-bag-tran.png" alt="lightbulb">
                                        </div>
                                        <div class="smallFont textColor">Giỏ hàng</div>
                                    </a>
                                </li>
                                <li class="nav-item iconChange dropdown me-4 pt-2">
                                    <a href="#" class="nav-link text-center p-0" data-bs-toggle="dropdown" aria-expanded="false">
                                        <div class=" d-flex align-items-center overflow-hidden changeWidth mx-auto">
                                            <i class="fas fa-bell iconHeight mx-2" style="font-size: 20px;"></i>
                                            <span class="badge bg-danger rounded-circle" id="customerNotificationCount" style="font-size: 8px; position: absolute; top: -5px; right: 10px;">0</span>
                                        </div>
                                        <div class="smallFont textColor">Thông báo</div>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end" style="width: 350px; max-height: 400px; overflow-y: auto;">
                                        <div class="dropdown-header">
                                            <h6 class="m-0"><i class="ri-notification-2-line me-2"></i>Thông báo</h6>
                                        </div>
                                        <div id="customerNotificationList">
                                            <div class="text-center p-3">
                                                <small class="text-muted">Đang tải thông báo...</small>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div id="iconContainer"
                             class="d-flex flex-grow-1 justify-content-end justify-content-lg-center align-items-center rounded-5 bg-light d-xl-none">
                            <div class="search-box">
                                <form action="search" method="POST">
                                    <input name="keyword" class="searchInput bg-body-tertiary iconCursor ps-md-5 p-1 p-md-2 " type="search"
                                           placeholder="Bạn cần tìm gì..." aria-label="Search" value="">
                                </form>
                                <button class="search-btn">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                        
                      
                        
                        <c:choose>
                            <c:when test="${not empty account}">
                                <form action="auth?action=logout" method="POST">
                                    <li class="dropdown" id="icon-drop">
                                        <a class="nav-link dropdown-toggle arrow-none nav-user px-2" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                            <span class="d-lg-flex flex-column gap-1 d-none">
                                                <h6 class="my-0 fw-normal">Welcome, ${account.fullName}!</h6>
                                            </span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated profile-dropdown">
                                            <c:if test="${account.roleID == 1}">
                                                <a href="Admin/index" class="dropdown-item">
                                                    <i class="mdi mdi-logout me-1"></i>
                                                    <span>Admin Page</span>
                                                </a>
                                            </c:if>
                                            <button style="background-color: transparent; border: none; color: inherit; cursor: pointer; padding: 0;">
                                                <img class="d-none d-lg-inline-block" src="./img_svg/navBar_menu/box-arrow-in-right.svg" alt="box-arrow">
                                                Logout
                                            </button>
                                        </div>
                                    </li>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="auth?action=login" method="POST">
                                    <a>
                                        <button id="loginBtn" class="btn btn-sm m-sm-2 m-1 bg-primary text-white rounded-5 px-sm-3 px-2">
                                            Login
                                            <img class="d-none d-lg-inline-block" src="./img_svg/navBar_menu/box-arrow-in-right.svg" alt="box-arrow">
                                        </button>
                                    </a>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </nav>
            <nav id="secondNav" class="bottom-0 position-fixed end-0 start-0">
                <div class="d-lg-none">
                    <div class="container-fluid d-flex justify-content-between shadow pt-2">
                        <a href="homePage" class="text-center text-decoration-none textColor">
                            <img class="iconHeight mb-1" src="./img_svg/navBar_menu/logo.png" alt="book">
                            <div class="extraSmallFont active pb-1 pacifico-regular">HexTech</div>
                        </a>
                        <a href="#" class="text-decoration-none textColor  text-center">
                            <img class="iconHeight mb-1" src="./img_svg/navBar_menu/telephone.png" alt="book">
                            <div class="extraSmallFont pb-1">Gọi điện</div>
                        </a>
                        <a href="#" class="text-decoration-none textColor  text-center">
                            <img class="iconHeight mb-1" src="./img_svg/navBar_menu/placeholder.png" alt="dpad">
                            <div class="extraSmallFont pb-1">Địa chỉ</div>
                        </a>
                        <a href="deliveryList" class="text-decoration-none textColor  text-center">
                            <img class="iconHeight mb-1" src="./img_svg/navBar_menu/delivery-car.png" alt="bar-chart">
                            <div class="extraSmallFont pb-1">Đơn hàng</div>
                        </a>
                        <a href="shopping" class="text-decoration-none textColor  text-center">
                            <img class="iconHeight mb-1" src="./img_svg/navBar_menu/hand-bag.png" alt="lightbulb">
                            <div class="extraSmallFont pb-1">Giỏ hàng</div>
                        </a>
                        <a href="#" class="text-decoration-none textColor  text-center">
                            <img class="iconHeight mb-1" src="./img_svg/navBar_menu/menu.png" alt="briefcase">
                            <div class="extraSmallFont pb-1">Danh mục</div>
                        </a>
                    </div>
                </div>
            </nav>
            <section class="menu-bar">
                <div class="container-fluid">
                    <div class="menu-bar-content">
                        <ul>
                            <li><a href="phoneList"><i class="fas fa-mobile-alt"></i> Điện thoại</a>
                                <div class="submenu">
                                    <ul style="flex-wrap: wrap;">
                                        <li>
                                            <h6 style="font-weight: bold;" href=""> Hãng sản xuất</h6>
                                        </li>
                                        <div class="row">
                                            <div class="col-6">
                                                <li><a href="search?brand=iPhone&price=0&storage=all&category=Smartphones">Apple (iPhone)</a></li>
                                                <li><a href="search?brand=Samsung&price=0&storage=all&category=Smartphones">Samsung</a></li>
                                            </div>
                                            <div class="col-6">
                                                <li><a href="search?brand=Oppo&price=0&storage=all&category=Smartphones">Oppo</a></li>
                                                <li><a href="search?brand=Xiaomi&price=0&storage=all&category=Smartphones">Xiaomi</a></li>
                                            </div>
                                        </div>
                                    </ul>
                                    <!--                                    <ul>
                                                                            <li>
                                                                                <h6 style="font-weight: bold;" href=""> Mức giá</h6>
                                                                            </li>
                                                                            <div class="row">
                                                                                <div class="col-6">
                                                                                    <li><a href=""> Dưới 2 triệu</a></li>
                                                                                    <li><a href=""> 2-4 triệu</a></li>
                                                                                    <li><a href=""> 4-7 triệu</a></li>
                                                                                </div>
                                                                                <div class="col-6">
                                                                                    <li><a href=""> 7-13 triệu</a></li>
                                                                                    <li><a href=""> Trên 13 triệu</a></li>
                                                                                </div>
                                                                            </div>
                                                                        </ul>-->
                                </div>
                            </li>

                            <li><a href="tabletList"><i class="fas fa-tablet"></i> Tablet</a>
                                <div class="submenu">
                                    <ul style="flex-wrap: wrap;">
                                        <li>
                                            <h6 style="font-weight: bold;" href=""> Hãng sản xuất</h6>
                                        </li>
                                        <div class="row">
                                            <div class="col-6">
                                                <li><a href="search?brand=iPad&price=0&storage=all&category=Tablets">Apple (iPad)</a></li>
                                                <li><a href="search?brand=Samsung&price=0&storage=all&category=Tablets">Samsung</a></li>
                                            </div>
                                            <!--                                            <div class="col-6">
                                                                                            <li><a href="">Xiaomi</a></li>
                                                                                        </div>-->
                                        </div>
                                    </ul>
                                    <!--                                    <ul>
                                                                            <li>
                                                                                <h6 style="font-weight: bold;" href=""> Mức giá</h6>
                                                                            </li>
                                                                            <li><a href="">Dưới 2 triệu</a></li>
                                                                            <li><a href="">Từ 2 - 5 triệu</a></li>
                                                                            <li><a href="">Từ 5 - 8 triệu</a></li>
                                                                            <li><a href="">Trên 8 triệu</a></li>
                                                                        </ul>-->
                                </div>
                            </li>
                            <li><a href="search?brand=iPhone&price=0&storage=all&category=Smartphones"><i class="fab fa-apple" style="padding-right: 5px;"></i>iPhone</a>
                            </li>
                            <li><a href="search?brand=iPad&price=0&storage=all&category=Apple"><i class="fab fa-apple" style="padding-right: 5px;"></i>iPad</a>
                            </li>
                            <li><a href="search?brand=Samsung&price=0&storage=all&category=Samsung"><img src="./img_svg/mainPage/samsung.png" alt="alt" style="width: 10%"/> Samsung</a></li>
                        </ul>
                    </div>
                </div>
            </section>
        </header>

        <main class="content--padding">
            <div class="body1 row">
                <div class="slideshow-container col-md-9">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                    class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                    aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                    aria-label="Slide 3"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                                    aria-label="Slide 4"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="./img_svg/mainPage/638516307529322833_F-H1_800x300.webp" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="./img_svg/mainPage/638551349260879446_F-H1_800x300.webp" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="./img_svg/mainPage/638536300016261163_F-H1_800x300.webp" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="./img_svg/mainPage/638501198735820217_F-H1_800x300.webp" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev prev" type="button" data-bs-target="#carouselExampleIndicators"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next next" type="button" data-bs-target="#carouselExampleIndicators"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="content-right col-md-3">
                    <img src="./img_svg/mainPage/right_1.webp" alt="">
                    <img src="./img_svg/mainPage/right_3.webp" alt="">
                </div>

                <!--Phone-->
                <div class="container-fluid content">
                    <img src="./img_svg/mainPage/638502733227139543_H7- 1200x100.webp" alt="" style="margin-bottom: 20px;">
                    <div class="row">
                        <h4 class="red-text col-md-9">ĐIỆN THOẠI NỔI BẬT NHẤT</h4>
                        <a href="phoneList" class="col-md-3">
                            <h5 class="watch-all">Xem tất cả <i class="fas fa-arrow-right"></i>
                            </h5>
                        </a>
                        <c:choose>
                            <c:when test="${not empty allProductsPhone}">
                                <c:forEach var="product" items="${allProductsPhone}" varStatus="status">
                                    <c:if test="${status.count <= 4}">
                                        <div class="col-md-3 img-phone">
                                            <h6>Trả góp 0%</h6>
                                            <a class="product-imgs" href="#"><img src="${product.thumbnail}" alt=""></a>
                                            <h5>${product.name}</h5>
                                            <c:if test="${fn:length(product.name) <= 20}">
                                                <br>
                                            </c:if>
                                            <p1>${product.disString}₫</p1>
                                            <p2>${product.priceString}₫</p2><br>
                                            <img src="./img_svg/mainPage/Vnapy-1693370130549.webp" alt="">
                                            <img src="./img_svg/mainPage/Zalopay-1693187470025.webp" alt="">
                                            <img src="./img_svg/mainPage/Logo Muadee x Visa-1710728086318.webp" alt="">
                                            <img src="./img_svg/mainPage/Logo-1711608161110.webp" alt="">
                                            <form action="productDetail" method="GET">
                                                <input type="text" hidden name="productID" value="${product.productID}">
                                                <button class="buy" href="productDetail" style="display: flex; align-items: center;">
                                                    <i class="fa fa-cart-plus"></i>
                                                    <span>MUA NGAY</span>
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p>No products available.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <!-- trả góp iphone -->
                <div class="iphone_sale content">
                    <h5 class="fw-bold">IPHONE 15 SERIES TRẢ GÓP TỪ 69K/NGÀY</h5>
                    <img src="./img_svg/mainPage/638527770084438026_H7- 1200x100.webp" alt="">
                    <div class="row mt-4">
                        <div class="col-md-3 ">
                            <img src="./img_svg/mainPage/638527770081774150_banner-1.webp" alt="">
                        </div>
                        <div class="col-md-3">
                            <img src="./img_svg/mainPage/638527770083501340_banner-2.webp" alt="">
                        </div>
                        <div class="col-md-3">
                            <img src="./img_svg/mainPage/638527770084594737_banner.webp" alt="">
                        </div>
                        <div class="col-md-3">
                            <img src="./img_svg/mainPage/638527770083813190_banner-3.webp" alt="">
                        </div>
                    </div>
                </div>

                <!--tablet-->
                <div class="container-fluid content">
                    <div class="row">
                        <img src="./img_svg/mainPage/638515392261073531_H5.webp" style="width: 80%; margin-bottom: 20px;" alt="">
                        <h4 class="red-text col-md-9">TABLET BÁN CHẠY</h4>
                        <a href="tabletList" class="col-md-3">
                            <h5 class="watch-all">Xem tất cả <i class="fas fa-arrow-right"></i>
                            </h5>
                        </a>
                        <c:choose>
                            <c:when test="${not empty allProductsTablet}">
                                <c:forEach var="product" items="${allProductsTablet}" varStatus="status">
                                    <c:if test="${status.count <= 4}">
                                        <div class="col-md-3 img-phone">
                                            <h6>Trả góp 0%</h6>
                                            <a class="product-imgs" href="#"><img src="${product.thumbnail}" alt=""></a>
                                            <h5>${product.name}</h5>
                                            <c:if test="${fn:length(product.name) <= 20}">
                                                <br>
                                            </c:if>
                                            <p1>${product.priceString}₫</p1>
                                            <p2>${product.disString}₫</p2><br>
                                            <img src="./img_svg/mainPage/Vnapy-1693370130549.webp" alt="">
                                            <img src="./img_svg/mainPage/Zalopay-1693187470025.webp" alt="">
                                            <img src="./img_svg/mainPage/Logo Muadee x Visa-1710728086318.webp" alt="">
                                            <img src="./img_svg/mainPage/Logo-1711608161110.webp" alt="">
                                            <form action="productDetail" method="GET">
                                                <input type="text" hidden name="productID" value="${product.productID}">
                                                <button class="buy" href="productDetail" style="display: flex; align-items: center;">
                                                    <i class="fa fa-cart-plus"></i>
                                                    <span>MUA NGAY</span>
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p>No products available.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <button onclick="topFunction()" id="myBtn" title="Go to top">
                    <i class="fas fa-arrow-up"></i>
                </button>

                <div>
                    <div class="content new" style="margin-bottom: 60px;">
                        <div class="row">
                            <div>
                                <div class="red-text">
                                    <h1>Tin tức</h1>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="new-left">
                                    <a href="https://www.google.com.vn/">
                                        <img src="./img_svg/mainPage/Apple-iPad-Pro-M4.jpg" alt="">
                                        <h3>Apple ra mắt iPad Pro M4 tuyệt đẹp và Apple Pencil Pro</h3>
                                        <p>iPad Pro mới có một bước tiến nhảy vọt với thiết kế mỏng nhẹ mới, màn hình Ultra
                                            Retina
                                            XDR đột phá và hiệu năng M4 nhanh phi thường với năng lực AI mạnh mẽ</p>
                                    </a>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="new-right">
                                    <a href="https://www.google.com.vn/">
                                        <div class="col-md-3" style="margin-top: 10px;">
                                            <img src="./img_svg/mainPage/chip M4.jpg" alt="">
                                        </div>

                                        <div class="col-md-9 truncate text-news">
                                            <h3>Apple giới thiệu chip M4</h3>
                                            <p>Chip M4 mang lại thiết kế đột phá và màn hình tuyệt đẹp cho iPad Pro mới,
                                                đồng
                                                thời
                                                tạo ra một bước nhảy vọt về hiệu năng</p>
                                        </div>
                                    </a>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;">
                                <div class="new-right">
                                    <a href="https://www.google.com.vn/">
                                        <div class="col-md-3">
                                            <img src="./img_svg/mainPage/mac-air-m3-2024.jpg" alt="">
                                        </div>

                                        <div class="col-md-9 truncate text-news">
                                            <h3>Apple ra mắt MacBook Air 13 và 15 inch mới trang bị chip M3 mạnh mẽ</h3>
                                            <p>Chiếc máy tính xách tay phổ biến nhất thế giới nay tuyệt vời hơn bao giờ hết
                                                với
                                                hiệu
                                                năng tốt hơn, Wi-Fi nhanh hơn và hỗ trợ tối đa hai màn hình ngoài – tất cả
                                                nằm
                                                trong
                                                một thiết kế mỏng nhẹ ấn tượng với thời lượng pin lên đến 18 giờ</p>
                                        </div>
                                    </a>
                                </div>
                                <hr style="margin-top: 0; margin-bottom: 0;">
                                <div class="new-right">
                                    <a href="https://www.google.com.vn/">
                                        <div class="col-md-3">
                                            <img src="./img_svg/mainPage/mac-air-m3-2024.jpg" alt="">
                                        </div>

                                        <div class="col-md-9 truncate text-news">
                                            <h3>Apple ra mắt MacBook Air 13 và 15 inch mới trang bị chip M3 mạnh mẽ</h3>
                                            <p>Chiếc máy tính xách tay phổ biến nhất thế giới nay tuyệt vời hơn bao giờ hết
                                                với
                                                hiệu
                                                năng tốt hơn, Wi-Fi nhanh hơn và hỗ trợ tối đa hai màn hình ngoài – tất cả
                                                nằm
                                                trong
                                                một thiết kế mỏng nhẹ ấn tượng với thời lượng pin lên đến 18 giờ</p>
                                        </div>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="content" style="margin-bottom: 60px;">
                    <div class="background">

                    </div>
                    <div class="text-store">
                        <h2>HỆ THỐNG CỬA HÀNG</h2>
                        <h2>HEXTECH SHOP CÓ HỆ THỐNG CỬA HÀNG TRÊN TOÀN VIỆT NAM</h2>
                        <p>Trải dài trên khắp Việt Nam, mang đến cuộc sống hiện đại, thông minh và chất lượng hơn tới hàng
                            triệu
                            người tiêu dùng Việt.</p>
                        <a href="https://www.google.com.vn/"><button class="btn1">Xem Danh Sách Cửa Hàng</button></a>
                    </div>
                </div>

                <hr class="content" style="width: 82%;">
                <div class="content quality row">
                    <div class="col-md-3 box-quality">
                        <img src="./img_svg/mainPage/like.png" alt="">
                        <h3>HÀNG HOÁ CHẤT LƯỢNG</h3>
                        <p>Tận hưởng các mặt hàng chất lượng hàng đầu với giá cả hợp lý</p>
                    </div>

                    <div class="col-md-3 box-quality">
                        <img src="./img_svg/mainPage/cskh.png" alt="">
                        <h3>HỖ TRỢ 24/7</h3>
                        <p>Nhận hỗ trợ ngay lập tức bất cứ khi nào bạn cần</p>
                    </div>

                    <div class="col-md-3 box-quality">
                        <img src="./img_svg/mainPage/gh.png" alt="">
                        <h3>VẬN CHUYỂN NHANH CHÓNG</h3>
                        <p>Tùy chọn giao hàng nhanh chóng và đáng tin cậy</p>
                    </div>

                    <div class="col-md-3 box-quality">
                        <img src="./img_svg/mainPage/money.png" alt="">
                        <h3>THANH TOÁN AN TOÀN</h3>
                        <p>Nhiều phương thức thanh toán an toàn</p>
                    </div>
                </div>

                <div class="description">
                    <div class="content text-desription">
                        <h2>Chào mừng đến với Thế Giới Hextech Shop - Nơi bạn khám phá và sở hữu những sản phẩm công nghệ
                            đỉnh cao!</h2>
                        <br>
                        <p>Bước vào Thế Giới Công Nghệ Hextech Shop, bạn sẽ choáng ngợp trước thiên đường sản phẩm đa dạng và
                            phong
                            phú từ các thương hiệu hàng đầu thế giới. Nơi đây hội tụ đầy đủ các sản phẩm đáp ứng mọi nhu cầu
                            của
                            bạn, từ điện thoại thông minh, máy tính bảng, laptop đến phụ kiện công nghệ hiện đại nhất.Với
                            niềm
                            đam mê công nghệ và mong muốn mang đến cho khách hàng những trải nghiệm mua sắm tuyệt vời nhất,
                            Thế
                            Giới Công Nghệ Hextech Shop không ngừng nâng cao chất lượng dịch vụ và hoàn thiện chính sách bán
                            hàng.
                            Chúng tôi cam kết mang đến cho bạn sự hài lòng tuyệt đối với mỗi sản phẩm và dịch vụ tại đây.
                        </p>
                        <br>
                        <p style="font-size:large;">
                            Hãy đến với Thế Giới Công Nghệ Hextech Shop và khám phá thế giới công nghệ đầy mê hoặc!
                        </p>
                    </div>

                </div>

                <div class="contentForFooter contact" id="footer">
                    <div class="row">
                        <div class="col-md-2">
                            <h3>THÔNG TIN STORE</h3>
                            <a href="https://www.google.com.vn/"></a>
                            <a href="https://www.google.com.vn/">
                                <p>Chúng tôi là ai</p>
                            </a>
                            <a href="https://www.google.com.vn/">
                                <p>Cam kết của chúng tôi</p>
                            </a>
                            <a href="https://www.google.com.vn/">
                                <p>Tin tuyển dụng</p>
                            </a>
                            <a href="https://www.google.com.vn/">
                                <p>Hệ thống cửa hàng</p>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <h3>HỖ TRỢ KHÁCH HÀNG</h3>
                            <a href="https://www.google.com.vn/">
                                <p>Hướng dẫn đặt hàng</p>
                            </a>
                            <a href="https://www.google.com.vn/">
                                <p>Phương thức thanh toán</p>
                            </a>
                            <a href="https://www.google.com.vn/">
                                <p>Chính sách thành viên</p>
                            </a>
                            <a href="https://www.google.com.vn/">
                                <p>Chính sách tích - tiêu điểm</p>
                            </a>
                        </div>

                        <div class="col-md-2">
                            <h3>CHÍNH SÁCH</h3>
                            <a href="https://www.google.com.vn/">
                                <p>Chính sách vận chuyển</p>
                            </a>
                            <a href="https://www.google.com.vn/">
                                <p>Chính sách đổi trả</p>
                            </a>
                            <a href="https://www.google.com.vn/">
                                <p>Điều kiện & Điều khoản</p>
                            </a>
                            <a href="https://www.google.com.vn/">
                                <p>Chính sách bảo mật</p>
                            </a>
                        </div>

                        <div class="col-md-2">
                            <h3>LIÊN HỆ</h3>
                            <p style="font-weight: bold;">Hỗ trợ tư vấn mua online:</p>
                            <p>Hotline: 0247 308 2882</p>
                            <p>Email: contact@gmail.com</p>
                            <p>Giờ làm việc: 8:30 - 22:00 hằng ngày.</p>
                            <p style="font-weight: bold;">Hỗ trợ khiếu nại và bảo hành sản phẩm:</p>
                            <p>Hotline: 024 7300 6999</p>
                            <p>Email: cskh@gmail.com</p>
                            <p>Giờ làm việc: 8:30 - 22:00 hằng ngày.</p>

                        </div>

                        <div class="col-md-4">
                            <div class="footer-section social">
                                <h3>PHƯƠNG TIỆN TRUYỀN THÔNG</h3>
                                <a href="https://www.google.com.vn/" target="_blank" class="social-icon">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                                <a href="https://www.google.com.vn/" target="_blank" class="social-icon">
                                    <i class="fab fa-youtube"></i>
                                </a>
                                <a href="https://www.google.com.vn/" target="_blank" class="social-icon">
                                    <i class="fab fa-instagram"></i>
                                </a>
                                <a href="https://www.google.com.vn/" target="_blank" class="social-icon">
                                    <i class="fab fa-twitter"></i>
                                </a>
                                <a href="https://www.google.com.vn/" target="_blank" class="social-icon">
                                    <i class="fab fa-tiktok"></i>
                                </a>
                            </div>
                            <div class="mt-3">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.856168121187!2d108.25831637544461!3d15.968885884696228!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1720180268723!5m2!1svi!2s" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>                       
                            </div>
                        </div>
                    </div>
                    <hr style="width: 82%;">
                    <div>
                        <p>Địa chỉ: Tầng 6, số 96 Thái Hà Phường Trung Liệt, Quận Đống Đa, Thành phố Hà Nội, Việt Nam.</p>
                        <p>Người đại diện: Hoàng Thị Vân Anh</p>
                        <p>Mã số thuế: 0109749326, ngày cấp ĐKKD 29/04/2021.</p>
                        <p>Điện thoại: 024.7300.6999</p>
                        <p>Email: cskh@gmail.com</p>
                    </div>
                </div>

                <div class="footer">
                    <p>Copyright © 2014-2024 | All Rights Reserved.</p>
                </div>
                <!-- </div> -->
            </div>
        </main>

        <style>
            #icon-drop {                            display: flex;
                        }
                        
                        /* Simple notification styles */
                        .dropdown-menu {
                            z-index: 1050;
                        }
                        
                        .dropdown-item {
                            white-space: normal !important;
                        }
                        
                        .badge {
                            min-width: 18px;
                            height: 18px;
                            line-height: 18px;
                            text-align: center;
                            border-radius: 50%;
                        }
        </style>
        <script>
            //Hiển thị thông cáo khi xác nhận Order
            window.onload = function () {
                var notifyOrderField = document.getElementById('notifyOrder');
                if (notifyOrderField) {
                    var notifyOrder = notifyOrderField.value;
                    if (notifyOrder === "success") {
                        alert("Đặt hàng thành công!");
                    } else if (notifyOrder === "failed") {
                        alert("Đặt hàng thất bại!");
                    }
                    // Remove the hidden input field after alert
                    notifyOrderField.remove();
                }
                
                // Load notifications immediately
                console.log('Page loaded, loading notifications...');
                loadUserNotifications();
            };
            
            // Function to load notifications for user/guest
            function loadUserNotifications() {
                console.log('Loading user notifications...');
                // Always load All + Customer notifications for user pages
                loadNotifications('Customer', 'notificationList', 'notificationCount');
            }
            
            // Function to load notifications by type
            function loadNotifications(recipientType, listElementId, countElementId) {
                console.log('Loading notifications for:', recipientType);
                console.log('Target elements:', listElementId, countElementId);
                
                fetch('notifications?action=api&recipientType=' + recipientType)
                .then(response => {
                    console.log('Response status:', response.status);
                    return response.json();
                })
                .then(data => {
                    console.log('API Response:', data);
                    
                    const listElement = document.getElementById(listElementId);
                    const countElement = document.getElementById(countElementId);
                    
                    console.log('List element found:', listElement);
                    console.log('Count element found:', countElement);
                    
                    if (data.success && data.notifications) {
                        const notifications = data.notifications;
                        console.log('Notifications count:', notifications.length);
                        console.log('First notification:', notifications[0]);
                        
                        if (countElement) {
                            countElement.textContent = notifications.length;
                        }
                        
                        if (listElement) {
                            if (notifications.length === 0) {
                                listElement.innerHTML = '<div class="text-center p-3"><small class="text-muted">Không có thông báo mới</small></div>';
                            } else {
                                let html = '';
                                notifications.forEach((notification, index) => {
                                    const message = notification.message || notification.Message || 'No message';
                                    html += '<div class="dropdown-item" style="white-space: normal; padding: 10px 15px; border-bottom: 1px solid #eee; cursor: pointer;">' + message + '</div>';
                                });
                                listElement.innerHTML = html;
                                console.log('Notifications loaded successfully:', notifications.length);
                            }
                        }
                    } else {
                        console.log('API returned error or no notifications');
                        if (listElement) {
                            listElement.innerHTML = '<div class="text-center p-3"><small class="text-muted">Lỗi khi tải thông báo</small></div>';
                        }
                        if (countElement) {
                            countElement.textContent = '0';
                        }
                    }
                })
                .catch(error => {
                    console.error('Error loading notifications:', error);
                    const listElement = document.getElementById(listElementId);
                    const countElement = document.getElementById(countElementId);
                    
                    if (listElement) {
                        listElement.innerHTML = '<div class="text-center p-3"><small class="text-muted">Lỗi khi tải thông báo</small></div>';
                    }
                    if (countElement) {
                        countElement.textContent = '0';
                    }
                });
            }
        </script>
        <script src="./myJs/userJs/trang_chu.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/54f0cb7e4a.js" crossorigin="anonymous"></script>
        
        <!-- Customer Notification JavaScript -->
        <%@include file="includes/notification-js.jsp" %>
    </body>

</html>