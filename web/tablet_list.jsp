<%-- 
    Document   : table_list
    Created on : Jun 28, 2024, 5:25:28 PM
    Author     : DELL
--%>

<%@page contentType="text/html" import="model.*, dal.*, java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tablet</title>
        <link rel="shortcut icon" href="./img_svg/mainPage/logo-color.png">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/userCss/product_list.css">
        <script src="https://kit.fontawesome.com/54f0cb7e4a.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
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
                            </ul>
                        </div>

                        <div id="iconContainer"
                             class="d-flex flex-grow-1 justify-content-end justify-content-lg-center align-items-center rounded-5 bg-light d-xl-none">
                            <div class="search-box">
                                <input type="text" class="search-input" placeholder="Sản phẩm,..." />
                                <button class="search-btn">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${not empty account}">
                                <form action="auth?action=logout" method="POST">
                                    <a>
                                        <p style="color: red; font-size: 10px; margin: 0; padding: 0;">Welcome, ${account.fullName}</p>
                                        <button id="loginBtn" class="btn btn-sm m-1 bg-primary text-white rounded-5 px-sm-3 px-2">
                                            Logout
                                            <img class="d-none d-lg-inline-block" src="./img_svg/navBar_menu/box-arrow-in-right.svg" alt="box-arrow">
                                        </button>
                                    </a>
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
                        <a href="#" class="text-center text-decoration-none textColor">
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
                        <a href="#" class="text-decoration-none textColor  text-center">
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
            <ul class="breadcrumb">
                <li><a href="homePage" class="active"><i class="fas fa-home"></i>Trang chủ</a></li>
                <li><a href="#" class="active">Tablet</a></li>
            </ul>
            <div class="body1 row">
                <div class="slideshow-container">
                    <div class="mySlides1">
                        <img src="./img_svg/mainPage/tablet1.webp" style="width:100%">
                    </div>
                    <div class="mySlides1">
                        <img src="./img_svg/mainPage/tablet2.webp" style="width:100%">
                    </div>
                    <div class="mySlides1">
                        <img src="./img_svg/mainPage/tablet3.webp" style="width:100%">
                    </div>
                    <div class="mySlides1">
                        <img src="./img_svg/mainPage/tablet4.webp" style="width:100%">
                    </div>
                    <div style="text-align:center">
                        <span class="dot" onclick="currentSlide(1, 0)"></span>
                        <span class="dot" onclick="currentSlide(2, 0)"></span>
                        <span class="dot" onclick="currentSlide(3, 0)"></span>
                        <span class="dot" onclick="currentSlide(4, 0)"></span>
                    </div>
                    <a class="prev" onclick="plusSlides(-1, 0)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1, 0)">&#10095;</a>
                </div>
            </div>
            <div class="container-fluid content">
                <div class="row">
                    <div class="col-md-2 right-content p-2 p-r-30 mx-5" style="box-shadow: 0px 0px 3px black; height: fit-content;">
                        <form action="search" method="GET">
                            <input type="text" name="category" value="Tablets" hidden/>
                            <div class="checkbox-category">
                                <h6>Hãng sản xuất</h6>
                                <div class="checkboxes row">
                                    <label><input type="radio" name="brand" value="all" checked> Tất cả</label>
                                    <label><input type="radio" name="brand" value="iPad"> Apple (iPad)</label>
                                    <label><input type="radio" name="brand" value="Samsung"> Samsung</label>
                                </div>
                            </div>

                            <div class="checkbox-category">
                                <h6>Mức giá</h6>
                                <label><input type="radio" name="price" value="0" checked> Tất cả </label> <br>
                                <label><input type="radio" name="price" value="8000000"> Dưới 8 triệu</label> <br>
                                <label><input type="radio" name="price" value="16000000"> Dưới 16 triệu</label> <br>
                                <label><input type="radio" name="price" value="24000000"> Dưới 24 triệu</label> <br>
                                <label><input type="radio" name="price" value="30000000"> Trên 24 triệu</label>
                            </div>

                            <div class="checkbox-category">
                                <h6>Dung lượng</h6>
                                <label><input type="radio" name="storage" value="all" checked> Tất cả</label> <br>
                                <label><input type="radio" name="storage" value="64GB"> 64 GB</label> <br>
                                <label><input type="radio" name="storage" value="128GB"> 128 GB</label> <br>
                                <label><input type="radio" name="storage" value="256GB"> 256 GB</label> <br>
                                <label><input type="radio" name="storage" value="512GB"> 512 GB</label> <br>
                                <label><input type="radio" name="storage" value="1TB"> 1 TB</label>
                            </div>
                            <input type="submit" value="Lọc" style="width:100%; background-color: orange;">
                        </form>
                    </div>

                    <!--slider-->
                    <div class=" col-md-9 p-0">
                        <div class="card card1">
                            <div class="card-header">
                                <h3 class="title" style="font-weight: bold;">Tablet</h3>
                                <span class="subtitle" style="display: block">(3 thương hiệu lớn)</span>
                            </div>
                            <div class="slider">
                                <div class="slide-track">
                                    <div class="slide">
                                        <a href="#">
                                            <img src="./img_svg/mainPage/637340494667486283_iPad-Apple@2x.webp" alt="" />
                                        </a>
                                    </div>
                                    <div class="slide">
                                        <a href="#">
                                            <img src="./img_svg/mainPage/637340490904217021_Samsung@2x.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="slide">
                                        <a href="#">
                                            <img src="./img_svg/mainPage/637582325361253577_Xiaomi@2x.webp" alt="" />
                                        </a>
                                    </div>
                                    <!--Duplicate again-->
                                    <div class="slide">
                                        <a href="#">
                                            <img src="./img_svg/mainPage/637340494667486283_iPad-Apple@2x.webp" alt="" />
                                        </a>
                                    </div>
                                    <div class="slide">
                                        <a href="#">
                                            <img src="./img_svg/mainPage/637340490904217021_Samsung@2x.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="slide">
                                        <a href="#">
                                            <img src="./img_svg/mainPage/637582325361253577_Xiaomi@2x.webp" alt="" />
                                        </a>
                                    </div>
                                    <div class="slide">
                                        <a href="#">
                                            <img src="./img_svg/mainPage/637340494667486283_iPad-Apple@2x.webp" alt="" />
                                        </a>
                                    </div>
                                    <div class="slide">
                                        <a href="#">
                                            <img src="./img_svg/mainPage/637340490904217021_Samsung@2x.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="slide">
                                        <a href="#">
                                            <img src="./img_svg/mainPage/637582325361253577_Xiaomi@2x.webp" alt="" />
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid begin row">
                            <!-- first row -->
                            <c:forEach var="sp" items="${sessionScope.allShowProduct}" begin="0" end="14">
                                <div class="col-md-4">
                                    <!-- Debugging: In ra thông tin sản phẩm -->
                                    <!-- Thông tin sản phẩm -->
                                    <div class="card card2">
                                        <div class="product-card">
                                            <h6>Trả góp 0%</h6>
                                            <img class="card-img-top product-img" src="${sp.thumbnail}" alt="Card image">
                                        </div>
                                        <div class="card-body">
                                            <h6 class="card-title product-name">${sp.name}</h6>
                                            <c:if test="${fn:length(sp.name) <= 30}">
                                                <br>
                                            </c:if>
                                            <p class="card-text">
                                            <p1>${sp.disString}₫</p1>
                                            <p2>${sp.priceString}₫</p2>

                                            <!-- Debugging: In ra thông tin chi tiết sản phẩm -->
                                            <p class="tech"><img src="./img_svg/mainPage/cpu-tower.png" alt="">${sp.chip}</p>
                                            <p class="tech">
                                                <img src="./img_svg/mainPage/screen.png" alt="">${sp.screen}
                                                <img src="./img_svg/mainPage/ram.png" alt="">${sp.ram}
                                                <img src="./img_svg/mainPage/ssd.png" alt="">${sp.stogare}
                                            </p>

                                            <p class="mini-icon">
                                                <img src="./img_svg/mainPage/Vnapy-1693370130549.webp" alt="">
                                                <img src="./img_svg/mainPage/Zalopay-1693187470025.webp" alt="">
                                                <img src="./img_svg/mainPage/Logo Muadee x Visa-1710728086318.webp" alt="">
                                                <img src="./img_svg/mainPage/Logo-1711608161110.webp" alt="">
                                            </p>
                                            </p>
                                            <form action="productDetail" method="GET">
                                                <input type="text" hidden name="productID" value="${sp.productID}">
                                                <button class="btn btn-primary buy-now"><i class="fa fa-cart-plus" style="padding-right: 10px;"></i>Mua ngay</button>
                                                <button class="btn btn-primary detail"><i class="fas fa-info-circle" style="padding-right: 10px;"></i>Xem chi tiết</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <span class="more-content1">
                                <!-- phần bổ sung (testing status done)-->
                                <div class="row">
                                    <c:forEach var="sp" items="${sessionScope.allShowProduct}" begin="15">
                                        <div class="col-md-4">
                                            <!-- Debugging: In ra thông tin sản phẩm -->
                                            <!-- Thông tin sản phẩm -->
                                            <div class="card card2">
                                                <div class="product-card">
                                                    <h6>Trả góp 0%</h6>
                                                    <img class="card-img-top product-img" src="${sp.thumbnail}" alt="Card image">
                                                </div>
                                                <div class="card-body">
                                                    <h6 class="card-title product-name">${sp.name}</h6>
                                                    <c:if test="${fn:length(sp.name) <= 30}">
                                                        <br>
                                                    </c:if>
                                                    <p class="card-text">
                                                    <p1>${sp.disString}₫</p1>
                                                    <p2>${sp.priceString}₫</p2>

                                                    <!-- Debugging: In ra thông tin chi tiết sản phẩm -->
                                                    <p class="tech"><img src="./img_svg/mainPage/cpu-tower.png" alt="">${sp.chip}</p>
                                                    <p class="tech">
                                                        <img src="./img_svg/mainPage/screen.png" alt="">${sp.screen}
                                                        <img src="./img_svg/mainPage/ram.png" alt="">${sp.ram}
                                                        <img src="./img_svg/mainPage/ssd.png" alt="">${sp.stogare}
                                                    </p>

                                                    <p class="mini-icon">
                                                        <img src="./img_svg/mainPage/Vnapy-1693370130549.webp" alt="">
                                                        <img src="./img_svg/mainPage/Zalopay-1693187470025.webp" alt="">
                                                        <img src="./img_svg/mainPage/Logo Muadee x Visa-1710728086318.webp" alt="">
                                                        <img src="./img_svg/mainPage/Logo-1711608161110.webp" alt="">
                                                    </p>
                                                    </p>
                                                    <form action="productDetail" method="GET">
                                                        <input type="text" hidden name="productID" value="${sp.productID}">
                                                        <button class="btn btn-primary buy-now"><i class="fa fa-cart-plus" style="padding-right: 10px;"></i>Mua ngay</button>
                                                        <button class="btn btn-primary detail"><i class="fas fa-info-circle" style="padding-right: 10px;"></i>Xem chi tiết</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </span>
                            <!-- end -->
                        </div>
                        <br>
                        <span class="show-more-btn1" onclick="toggleContent1()">Xem thêm sản phẩm</span>
                        <div class="end">
                            <div>
                                <div class="text-intro">
                                    <h6>Máy tính bảng nhanh chóng thu hút thị hiếu người dùng và trở thành công cụ phổ biến
                                        không kém cạnh laptop. Tính tiện lợi, nhỏ gọn và hiện đại là những ưu điểm đáng chú
                                        ý ở
                                        các dòng tablet. Mời bạn theo dõi nội dung dưới đây để khám phá góc nhìn đa chiều
                                        của
                                        máy tính bảng trong cuộc sống.
                                    </h6>
                                </div>

                                <div class="intro-img">
                                    <img src="./img_svg/mainPage/snapedit_1718503834800.jpg" alt="">
                                </div>
                                <span class="more-content">
                                    <h5>Ưu điểm của máy tính bảng</h5>
                                    <h6>
                                        <strong>Thiết kế gọn nhẹ, linh động</strong> <br>
                                        Trọng lượng nhẹ là một ưu điểm sáng giá khi nói về tablet. Nhờ vậy bạn có thể sử
                                        dụng
                                        linh hoạt ở mọi nơi, khi di chuyển bằng xe buýt hoặc trong những chuyến du lịch.
                                    </h6>
                                    <img src="./img_svg/mainPage/snapedit_1718504004581.jpg" alt="">
                                    <h6>Sử dụng tablet để thư giãn tại nhà cũng trở nên dễ dàng hơn, hãy thử tưởng tượng mà
                                        xem,
                                        bạn có thể nằm trên sofa, xem phim, đọc tin tức, hay chơi game thoải mái. Tính tiện
                                        lợi
                                        của nó còn thể hiện qua khả năng kết nối 4G, thậm chí 5G. Theo đó, bạn có thể truy
                                        cập
                                        Internet mọi lúc mọi nơi, chỉ cần lắp SIM và chọn gói cước phù hợp theo nhu cầu cá
                                        nhân.
                                    </h6>
                                    <h6><strong>Thời lượng pin dài</strong>
                                        Hiện tại, thời lượng sử dụng của các dòng máy tính bảng được đánh giá là khá dài,
                                        trung
                                        bình khoảng 6 - 8 giờ. Một số dòng tablet cao cấp còn sở hữu dung lượng pin tới 10
                                        giờ
                                        liền chỉ sau một lần sạc. Điều này cho phép bạn học tập, làm việc hay giải trí liên
                                        tục,
                                        mà không cần lo lắng về vấn đề gián đoạn. <br>

                                        Ngoài ra các thiết bị tablet còn có thêm tính năng sạc nhanh, giúp làm đầy pin một
                                        cách
                                        nhanh chóng, cực kỳ hữu ích với những người thường xuyên đi du lịch hay công tác.
                                        <br>
                                        <strong>Đa dạng tính năng</strong>
                                        Lợi ích đầu tiên khi sở hữu máy tính bảng đó là đa dạng tiện ích giải trí, giúp bạn
                                        dễ
                                        dàng sử dụng tablet trên giường và thư giãn thỏa thích. Bên cạnh đó, máy cũng rất
                                        hữu
                                        dụng với những ai làm trong lĩnh vực đòi hỏi sự sáng tạo do có màn hình lớn và bút
                                        cảm
                                        ứng, cho phép bạn ghi chú, thiết kế, vẽ vời nhanh chóng, linh hoạt, dễ dàng ghi lại
                                        mọi
                                        ý tưởng
                                    </h6>
                                    <img src="./img_svg/mainPage/snapedit_1718504168764.jpg" alt="">
                                    <h6>Ngoài ra bạn cũng có thể sử dụng các phần mềm văn phòng cơ bản như Word, Excel,
                                        Powerpoint bất kỳ lúc nào. Chỉ cần sắm thêm bộ chuột và bàn phím không dây có kết
                                        nối
                                        Bluetooth là tha hồ làm việc. <br>
                                        <strong>Phù hợp với nhiều đối tượng người dùng</strong> <br>
                                        Với hệ thống camera trước và sau, thiết kế gọn nhẹ, tích hợp đa dạng phần mềm, ứng
                                        dụng,
                                        máy tính bảng đã trở thành công cụ hỗ trợ đắc lực khi học tập hay làm việc trực
                                        tuyến.
                                        <br>

                                        Không chỉ đáp ứng tốt nhu cầu học tập, làm việc của người lớn. Thiết bị còn rất phù
                                        hợp
                                        với đối tượng là các em nhỏ, vì giao diện đơn giản, dễ thao tác và tiếp cận các
                                        chương
                                        trình học. Đặc biệt, nhà sản xuất còn tích hợp thêm chế độ trẻ em với ứng dụng
                                        riêng,
                                        cho phép phụ huynh quản lý nội dung và thời gian sử dụng của con cái.
                                    </h6>
                                    <img src="./img_svg/mainPage/may-tinh-bang-FPT-Shop-3.png" alt="">
                                    <h5>Có nên mua máy tính bảng không? Nên chọn máy tính bảng hay laptop?</h5>
                                    <h5>Ghi âm cuộc gọi</h5>
                                    <h6>Laptop và máy tính bảng đều là những thiết bị thực sự hữu ích cho học sinh, sinh
                                        viên và
                                        cả nhân viên văn phòng. Bởi lẽ chúng đáp ứng tối đa nhu cầu học tập, làm việc và
                                        giải
                                        trí của tất cả mọi người. <br>

                                        Tuy nhiên, khi đứng giữa quyết định chọn mua laptop hay tablet, bạn cần xem xét mục
                                        đích
                                        sử dụng của mình. <br>

                                        <strong>Máy tính bảng:</strong> Phù hợp cho nhu cầu sử dụng linh hoạt, nhanh chóng,
                                        nâng
                                        cao hiệu suất
                                        công việc mọi nơi, phù hợp cho người dùng thường xuyên di chuyển, cần sự tiện lợi
                                        cao,
                                        xử lý công việc đơn giản, ghi chú, sáng tạo dễ dàng hoặc giải trí nhẹ nhàng. <br>
                                        <strong>Laptop:</strong> Thiết bị phục vụ cho nhu cầu sử dụng các phần mềm chuyên
                                        dụng
                                        cho công việc như
                                        thiết kế, chỉnh sửa ảnh và video hoặc các tác vụ hay chơi các tựa game nặng.
                                    </h6>
                                    <img src="./img_svg/mainPage/may-tinh-bang-FPT-Shop-17.png" alt="">
                                    <h5>Các thương hiệu máy tính bảng đang được bán tại Hextech Shop</h5>
                                    <h6>Có nhiều thương hiệu tablet cho bạn lựa chọn chẳng hạn như iPad, Samsung,
                                        Lenovo, Masstel, Xiaomi, Oppo,….
                                        <br>
                                        <strong>Giá bán</strong> <br>
                                        <strong>iPad:</strong> Từ 10 - 65 triệu đồng <br>
                                        <strong>Tablet Samsung:</strong> Từ 4.5 - 39 triệu đồng <br>
                                        <strong>Tablet Xiaomi:</strong> Từ 6.2 - 10.5 triệu đồng <br>
                                        <strong>Tablet OPPO:</strong> Từ 6.7 triệu đồng <br>
                                        <strong>Tablet Masstel:</strong> Từ 2.5- 5 triệu đồng
                                    </h6>
                                    <h5>Lời kết</h5>
                                    <h6>Trên đây là tổng hợp tin tức giúp bạn hiểu rõ công năng, ưu điểm và cách chọn mua
                                        chiếc
                                        máy tính bảng chất lượng, tốt nhất. Để mua các sản phẩm công nghệ nhanh chóng, hoặc
                                        cần
                                        tư vấn chi tiết, bạn có thể liên hệ ngay trên website Hextech Shop hoặc gọi đến tổng
                                        đài
                                        miễn phí 1800 1918.
                                        <br>
                                        Hextech Shop trân trọng từng phút giây được phục vụ khách hàng.
                                    </h6>
                                </span>
                            </div>
                            <span class="show-more-btn" onclick="toggleContent()">Xem thêm</span>
                        </div>

                    </div>
                </div>

                <!--mini icon right-->
                <div class="ins-custom-icon-box">
                    <img class="ins-custom-first-icon" src="./img_svg/mainPage/icon-gif-1-1717149166.webp" alt="">
                </div>

                <button onclick="topFunction()" id="myBtn" title="Go to top">
                    <i class="fas fa-arrow-up"></i>
                </button>
            </div>
            <!-- footer -->
            <div class="footer" id="footer">
                <div class="container">
                    <div class="footer-info row">
                        <div class="col-md-4 footer-info-grid links">
                            <h4>Thông tin và chính sách</h4>
                            <ul>
                                <li><a href="#">Giới thiệu về công ty</a></li>
                                <li><a href="#">Chính sách bảo mật</a></li>
                                <li><a href="#">Quy chế hoạt động</a></li>
                                <li><a href="#">Kiểm tra hóa đơn điện tử</a></li>
                                <li><a href="#">Câu hỏi thường gặp mua hàng</a></li>
                                <img style="width: 15%; margin-left: -8%; margin-top: 10px;" src="./img_svg/mainPage/ft-img1.png"
                                     alt="">
                                <img style="width: 40%; margin-top: 10px;" src="./img_svg/mainPage/ft-img2.png" alt="">
                            </ul>
                        </div>
                        <div class="col-md-4 footer-info-grid address">
                            <h4>Địa chỉ</h4>
                            <address>
                                <ul>
                                    <li>Khu đô thị FPT City, Ngũ Hành Sơn, Đà Nẵng </li>
                                    <li>Đà Nẵng, Việt Nam</li>
                                    <li>Hotline: 1800 1918</li>
                                    <li>Email : <a class="mail" href="#">hextechxinchao@gmail.com</a></li>
                                </ul>
                            </address>
                        </div>
                        <div class="col-md-4 mt-4 footer-info-grid email">
                            <!--                            <h4>ĐĂNG KÝ NHẬN TIN KHUYẾN MÃI</h4>
                                                        <p>(*) Nhận ngay voucher 10% <br>
                                                            *Voucher sẽ được gửi sau 24h, chỉ áp dụng cho khách hàng mới</p>
                                                        <form action="#" method="get" class="newsletter">
                                                            <input class="email" type="email" placeholder="Email*" required>
                                                            <input class="email" type="text" placeholder="Số điện thoại" required>
                                                            <input style="color: white;" type="submit" class="submit" value="Đăng kí ngay">
                                                            <label style="font-size: 13px; margin-top: 10px; color: rgb(232, 56, 56);"><input
                                                                    type="checkbox" value="" checked>Tôi đồng ý với điều khoản của Hextech</label>-->
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.856168121187!2d108.25831637544461!3d15.968885884696228!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1720180268723!5m2!1svi!2s" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>                       
                            <div class="clearfix"></div>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="connect">
                        <div class="connect-social">
                            <h4>LIÊN HỆ VỚI CHÚNG TÔI</h4>
                            <ul>
                                <li><a href="#" class="social-button facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" class="social-button twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" class="social-button"><i class="fa fa-google"></i></a></li>
                                <li><a href="#" class="social-button"><i class="fab fa-github"></i></a></li>
                                <li><a href="#" class="social-button"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#" class="social-button"><i class="fa fa-pinterest-p"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="copyright">
                        <p>&copy; 2007 - 2023 Công Ty Cổ Phần Bán Lẻ Kỹ Thuật Số Hextech </a></p>
                    </div>
                </div>
            </div>
        </main> 

        <script src="./myJs/userJs/product_list.js"></script>
    </body>
</html>
