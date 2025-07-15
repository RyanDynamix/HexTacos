<%-- 
    Document   : productDetails
    Created on : Jun 30, 2024, 9:32:09 AM
    Author     : qn407
--%>

<%@page contentType="text/html" import="model.*, dal.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BanHangOnline</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/productDetails/product_details.css">
        <link rel="shortcut icon" href="./img_svg/mainPage/logo-color.png">
        <!-- font Pacifico -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
        <!-- Css Quang -->
        <!-- Theme Config Js -->
        <script src="myJs/productDetails/hyper-config.js"></script>
        <!-- Icons css -->
        <link href="css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>

    <body>

        <header class="position-fixed w-100 bg-light hight--header d-flex flex-column">
            <div class="bannerTopHead container-fluid d-none d-lg-block">
                <div class="row">
                    <div class="col-md-4">
                        <img class="imgTopHead"
                             src="./img_svg/topBanner/Top banner_Thu cu.svg"
                             alt="Top Banner Mobile dịch vụ bảo hành">
                    </div>
                    <div class="col-md-4">
                        <img class="imgTopHead"
                             src="./img_svg/topBanner/Top banner_Giao hang.svg"
                             alt="TOP banner mobile giao nhanh miễn phí">
                    </div>
                    <div class="col-md-4">
                        <img class="imgTopHead"
                             src="./img_svg/topBanner/Top banner_Chinh hang.svg"
                             alt="TOP banner mobile sản phẩm chính hãng đầy đủ VAT">
                    </div>
                </div>
            </div>

            <div id="carouselExampleControls" class="carousel slide d-block d-lg-none" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="w-100">
                            <img class="imgTopHead w-100"
                                 src="./img_svg/topBanner/Top banner_Thu cu.svg"
                                 alt="Top Banner Mobile dịch vụ bảo hành">
                        </div>
                    </div>
                    <div class="carousel-item ">
                        <div class="w-100">
                            <img class="imgTopHead w-100"
                                 src="./img_svg/topBanner/Top banner_Giao hang.svg"
                                 alt="TOP banner mobile giao nhanh miễn phí">
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="w-100">
                            <img class="imgTopHead w-100"
                                 src="./img_svg/topBanner/Top banner_Chinh hang.svg"
                                 alt="TOP banner mobile sản phẩm chính hãng đầy đủ VAT">
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
                        <a href="#" class="navbar-brand m-0 textColor fw-bold brand pacifico-regular">HexTech</a>
                        <div id="verticalbar" class="mx-xxl-2 mx-1 d-none d-lg-inline-block"></div>
                        <a href="#"
                           class="nav-link textColor fw-lighter lh-sm brandSubHeading d-none d-lg-inline-block pacifico-regular">Công
                            Nghệ
                            <br>
                            <span class="fw-medium brandSubHeading d-none d-lg-inline-block pacifico-regular">Thay Đổi Cuộc Sống</span>
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
                                    <a href="#" class="nav-link text-center p-0">
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
                                            <img class="iconHeight--delivery mx-2" src="./img_svg/navBar_menu/delivery-car.png" alt="bar-chart">
                                            <img class=" iconHeight--delivery mx-2" src="./img_svg/navBar_menu/delivery-car-tran.png" alt="bar-chart">
                                        </div>
                                        <div class="smallFont textColor">Đơn hàng</div>
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
                                            <h5 style="font-weight: bold;"> Hãng sản xuất</h5>
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
                                            <h5 style="font-weight: bold;"> Mức giá</h5>
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
                                            <h5 style="font-weight: bold;"> Hãng sản xuất</h5>
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
                                            <h5 style="font-weight: bold;"> Mức giá</h5>
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

            <div class="container">
                <div class="content" style="padding-top: 3rem; padding-bottom: 3rem;">
                    <!-- Start Content-->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <!-- Product image -->
                                                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <c:forEach var="pic" items="${allPictute}">
                                                            <div class="carousel-item slide-show-pic active" data-bs-interval="10000">
                                                                <img src="${pic}" class="d-block w-100" alt="...">
                                                            </div>

                                                        </c:forEach>
                                                    </div>
                                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                        <span class="visually-hidden">Previous</span>
                                                    </button>
                                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                        <span class="visually-hidden">Next</span>
                                                    </button>
                                                </div>
                                                <div class="d-lg-flex d-none justify-content-center small-img">
                                                    <c:forEach var="smallPic" items="${allPictute}">
                                                        <a href="javascript: void(0);" class="ms-2">
                                                            <img src="${smallPic}" class="img-fluid img-thumbnail p-2 thumbnail"
                                                                 style="max-width: 90px;" alt="Product-img" />
                                                        </a>
                                                    </c:forEach>
                                                </div>
                                            </div> <!-- end col -->

                                            <div class="col-lg-7">
                                                <div class="ps-lg-4" style="padding-top: 40px;">
                                                    <!-- Product title -->
                                                    <h3 class="mt-0">${allDetailProduct.name}<a href="javascript: void(0);" class="text-muted"></a>
                                                    </h3>
                                                    <div class="row">
                                                        <c:choose>
                                                            <c:when test="${allDetailProduct.quantity > 0}">
                                                                <div class="col-3">
                                                                    <h4><span class="badge rounded-pill bg-success">Còn hàng</span></h4>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="col-3">
                                                                    <h4><span class="badge rounded-pill bg-danger">Hết hàng</span></h4>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <p class="font-16 mt-1 col-9">
                                                            <span>Đánh giá:</span>
                                                            <span><i class="fa-solid fa-star" style="color: #FFD43B;"></i></span>
                                                            <span><i class="fa-solid fa-star" style="color: #FFD43B;"></i></span>
                                                            <span><i class="fa-solid fa-star" style="color: #FFD43B;"></i></span>
                                                            <span><i class="fa-solid fa-star" style="color: #FFD43B;"></i></span>
                                                            <span><i class="fa-solid fa-star" style="color: #FFD43B;"></i></span>
                                                        </p>
                                                    </div>
                                                    <!-- Product stock -->

                                                    <div class="row box-option">
                                                        <h6 class="col-3 mt-2 fw-bold">Màu sắc</h6>
                                                        <div class="container col-9">
                                                            <c:forEach var="color" items="${allColor}" varStatus="status">
                                                                <div class="item">
                                                                    <input type="radio" id="${color}" name="mauSac" value="${color}" ${status.index == 0 ? 'checked' : ''} onchange="updateHiddenInput(this.value)">
                                                                    <label for="${color}">${color}</label>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>

                                                    <!-- Product description -->
                                                    <div class="mt-0">
                                                        <h6 class="fw-bold">Giá chỉ còn:</h6>
                                                        <h3 style="color: red;font-weight: bold;">${allDetailProduct.disString}</h3>
                                                        <h4><del>${allDetailProduct.priceString}</del></h4>
                                                    </div>

                                                    <!-- Quantity -->
                                                    <div class="mt-4">
                                                        <h6 class="font-14">Số lượng</h6>
                                                        <div class="d-flex">
                                                            <input type="hidden" name="action" value="addToCart">
                                                            <!-- Number input field -->
                                                            <input type="number" id="quantityInput" min="1" max="${allDetailProduct.quantity}" value="1" class="form-control" 
                                                                   style="width: 90px;" onchange="updateQuantityInput(this.value)">
                                                            <form id='addToCart' action="productDetail?action=addToCart" method="POST">
                                                                <!-- Hidden input field -->
                                                                <input type="number" hidden name="productID" value="${allDetailProduct.productID}">
                                                                <input type="number" hidden name="discount" value="${allDetailProduct.discount}">
                                                                <input type="number" hidden id="selectedQuantity1" name="selectedQuantity" value="1">
                                                                <input type="text" hidden id="selectedColor1" name="selectedColor" value="">
                                                                <button type="submit" class="btn btn-danger ms-2"><i class="fa-solid fa-cart-shopping"
                                                                                                                     style="padding-right: 5px; line-height: 2;"></i>Thêm vào<br>giỏ hàng</button>
                                                            </form>

                                                            <form id="buyNow" action="productDetail?action=buyNow" method="POST">
                                                                <!-- Hidden input field -->
                                                                <input type="number" hidden name="productID" value="${allDetailProduct.productID}">
                                                                <input type="number" hidden name="discount" value="${allDetailProduct.discount}">
                                                                <input type="number" hidden id="selectedQuantity2" name="selectedQuantity" value="1">
                                                                <input type="text" hidden id="selectedColor2" name="selectedColor" value="">
                                                                <button type="submit" class="btn btn-danger ms-2" style="width: 100%; height: 70px;">
                                                                    <h4>Mua ngay</h4>
                                                                    <p>Giao hàng miễn phí hoặc nhận tại shop</p>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>

                                                    <!-- Product description -->
                                                    <div class="mt-4">
                                                        <div class="box">
                                                            <div class="box-header">
                                                                <h4>Nhận ngay khuyến mại đặc biệt</h4>
                                                            </div>
                                                            <div class="box-content">
                                                                <div>

                                                                    <li>
                                                                        <span><i class="icon fa-solid fa-circle-check" style="color: #48bb78;"></i></span>
                                                                        <h5>Giảm ngay 5,000,000đ khi mua Online</h5>
                                                                    </li>
                                                                    <li>
                                                                        <span><i class="icon fa-solid fa-circle-check" style="color: #48bb78;"></i></span>
                                                                        <h5>Trả góp 0%</h5>
                                                                    </li>
                                                                    <li>
                                                                        <span><i class="icon fa-solid fa-circle-check" style="color: #48bb78;"></i></span>
                                                                        <h5>Thu cũ giảm thêm 1.000.000đ</h5>
                                                                    </li>
                                                                    <li>
                                                                        <span><i class="icon fa-solid fa-circle-check" style="color: #48bb78;"></i></span>
                                                                        <h5>Độc quyền mua kèm Bảo hành 2 năm giá chỉ 500.000đ</h5>
                                                                    </li>
                                                                    <li>
                                                                        <span><i class="icon fa-solid fa-circle-check" style="color: #48bb78;"></i></span>
                                                                        <h5>Tham gia chương trình rút thăm trúng trưởng với tổng giá trị giải thưởng lên đến 100 triệu đồng</h5>
                                                                    </li>
                                                                    <li>
                                                                        <span><i class="icon fa-solid fa-circle-check" style="color: #48bb78;"></i></span>
                                                                        <h5>Liên hệ B2B để được tư vấn giá tốt nhất cho khách hàng doanh nghiệp khi mua số lượng nhiều</h5>
                                                                    </li>
                                                                    <li>
                                                                        <span><i class="icon fa-solid fa-circle-check" style="color: #48bb78;"></i></span>
                                                                        <h5>Cơ hội trúng 10 xe máy Yamaha Sirius mỗi tháng, tổng giải thưởng lên đến 390 Triệu</h5>
                                                                    </li>
                                                                    <li>
                                                                        <span><i class="icon fa-solid fa-circle-check" style="color: #48bb78;"></i></span>
                                                                        <h5>Tặng Sim Data 3MXH100 480,000đ khi thu cũ đổi mới máy 2G</h5>
                                                                    </li>
                                                                    <li>
                                                                        <span><i class="icon fa-solid fa-circle-check" style="color: #48bb78;"></i></span>
                                                                        <h5>Tặng PMH 40,000đ khi mua máy</h5>
                                                                    </li>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-5">
                                                <div class="d-lg-flex d-none justify-content-center">
                                                    <!-- Product image -->
                                                    <div class="box-details">
                                                        <h6 class="fw-bold mb-2">Chính sách dành cho sản phẩm</h6>
                                                        <label><img src="./img_svg/productDetails/Type_Bao_hanh_chinh_hang_4afa1cb34d.svg" alt="alt"/>Hàng chính hãng - Bảo hành (tháng): 12</label>
                                                        <label class="mt-2"><img src="./img_svg/productDetails/Type_Giao_hang_toan_quoc_318e6896b4.svg" alt="alt"/>Giao hàng toàn quốc</label>
                                                    </div>

                                                </div>
                                            </div> <!-- end col -->

                                            <div class="col-lg-7">

                                            </div> <!-- end col -->
                                        </div> <!-- end row-->
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->
                        </div>
                        <!-- end row-->
                    </div> <!-- container -->
                </div> <!-- content -->

                <div class="detail row">
                    <div class="content-left col-md-7">
                        <div>
                            <h5 style="padding-bottom: 10px;"><strong>Điện thoại di động – Vật “bất li thân” ở thời đại công nghệ</strong>
                            </h5>
                            <p>
                                <strong>Điện thoại di động</strong> dường như là <strong>một phần không thể thiếu trong cuộc sống</strong> hiện đại ngày nay. 
                                Với sự đa dạng về thiết kế, thương hiệu cùng với đó là tính năng đa dạng giúp người dùng thoải mái kết nối cũng như theo dõi, 
                                cập nhật các thông tin mới mẻ hấp dẫn. Chắc chắn rằng khi sở hữu bạn sẽ có những giây phút giải trí ấn tượng và thú vị hơn mọi ngày. 
                                Hơn nữa, điện thoại di động cũng trở thành công cụ quan trọng giúp hỗ trợ đắc lực người dùng trong cuộc sống lẫn công việc.
                            </p>
                            <img src="./img_svg/mainPage/snapedit_1718345844252.jpg" alt="">
                            <span class="more-content">
                                <h5 style="padding-top: 20px; padding-bottom: 15px;"><strong>Các chức năng chính của điện thoại di động:</strong></h5>
                                <p> <strong>- Giao tiếp và kết nối:</strong> Điện thoại di động cho phép người dùng liên lạc và kết nối với nhau mọi lúc, 
                                    mọi nơi thông qua các hình thức như: gọi, nhắn tin, gửi email, thậm chí video call với người thân, 
                                    bạn bè, đồng nghiệp và đối tác kinh doanh ở bất kỳ đâu trên thế giới. Từ đó giúp thu gọn khoảng cách
                                    và tạo ra sự gắn kết trong xã hội hiện đại. <br>
                                    <strong>- Truy cập thông tin: </strong>Điện thoại thông minh còn giúp người dùng có thể dễ dàng truy cập vào internet 
                                    và tìm kiếm thông tin chỉ bằng một vài lần chạm. Điều này giúp bạn dễ dàng nắm bắt cập nhật về tin tức,
                                    kiến thức và xu hướng trong thời gian thực. <br>
                                    <strong>- Giải trí: </strong>Điện thoại di động giờ đây còn là một công cụ giải trí đa năng. Bạn có thể nghe nhạc, 
                                    xem phim, đọc sách điện tử, chơi game và truy cập vào các ứng dụng giải trí khác trực tiếp trên thiết bị. 
                                    Đây là cách vô cùng thuận tiện giúp mọi người có thể thư giãn và giải trí tiện ích hơn trong cuộc sống bận rộn. <br>
                                    <strong>- Quản lý cuộc sống: </strong>Trên điện thoại di động có chứa các ứng dụng giúp người dùng có thể dễ 
                                    dàng quản lý cuộc sống hàng ngày. Chúng có thể là ứng dụng lên kế hoạch, tổ chức công việc hay nhắc nhở sự kiện, 
                                    thông tin quan trọng. Bên cạnh đó còn vô vàn ứng dụng khác cực kỳ hữu ích với người dùng. <br><br>
                                    Ngày nay, thị trường di động luôn chứng kiến sự cạnh tranh vô cùng khốc liệt giữa các nhà sản xuất. Họ sẵn sàng đầu tư nghiên cứu để liên tục cho ra đời những chiếc điện thoại mới nhất chất lượng, từ giá rẻ, tầm trung, cận cao cấp cho đến cao cấp để đáp ứng tối đa nhu cầu của mọi đối tượng người dùng.
                                </p>
                                <h5 style="padding-top: 20px; padding-bottom: 15px;"><strong>Bảng đặc điểm và thông số của điện thoại smartphone:</strong></h5>
                                <table style="width: 100%; margin-bottom: 20px">
                                    <tr>
                                        <td><strong>Ram</strong></td>
                                        <td>2GB - 12GB</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Bộ nhớ trong</strong></td>
                                        <td>32GB - 1TB</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Kích thước màn hình</strong></td>
                                        <td>4.7 inch - 7.6 inch</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Tần số quét</strong></td>
                                        <td>60Hz - 144Hz</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Camera sau</strong></td>
                                        <td>1 camera - 4 camera</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Pin</strong></td>
                                        <td>2.406mAh - 6.000mAh</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Hệ điều hành</strong></td>
                                        <td>iOS, Android</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Giá bán</strong></td>
                                        <td>2.000.000đ - Trên 20.000.000đ</td>
                                    </tr>
                                </table>
                                <h5 style="padding-top: 20px;"><strong>Phân loại điện thoại thông minh theo nhu cầu:</strong></h5>
                                <p>
                                    Ngoài cách phân loại như đã liệt kê bên trên thì điện thoại thông minh còn được phân loại theo nhu cầu sử dụng. 
                                    Dưới đây là chi tiết phân loại cho các bạn quan tâm, tìm kiếm và tham khảo.
                                </p>
                                <p style="font-style: italic;"><strong>1.Điện thoại chuyên chơi game</strong></p>
                                <p><strong>Điện thoại chuyên chơi game</strong> là dòng sản phẩm được thiết kế đặc biệt để cung cấp cho người dùng trải nghiệm chơi game tốt nhất.</p>
                                <img src="./img_svg/mainPage/snapedit_1718345384060.jpg" alt="">
                                <p> Thông thường, các điện thoại thuộc dòng gaming được trang bị các tính năng và hiệu năng mạnh mẽ nhằm đáp ứng yêu cầu đồ họa 
                                    và xử lý phức tạp của các trò chơi di động. Bên cạnh đó là hệ thống tản nhiệt ấn tượng, pin dung lượng lớn, màn hình hiển thị sắc nét, 
                                    âm thanh chất lượng,... Tất cả sẽ giúp bạn thoải mái tận hưởng và đắm chìm trong mọi trận game</p>
                                <p style="font-style: italic;"><strong>2.Điện thoại smartphone pin trâu</strong></p>
                                <p>Điện thoại smartphone pin trâu là một khái niệm thông thường được sử dụng để chỉ những điện thoại di động được trang bị viên pin có thời lượng sử dụng dài hơn so với các điện thoại thông thường.</p>
                                <img src="./img_svg/mainPage/snapedit_1718345947486.jpg" alt="">
                                <p>Thông thường điện thoại được gọi là "pin trâu" sẽ có dung lượng pin lớn, từ 4.000mAh trở lên. 
                                    Điều này cho phép thiết bị có thể sử dụng được trong một khoảng thời gian dài trước khi cần sạc lại. 
                                    Ngoài ra, các sản phẩm thuộc dòng điện thoại này thường được tối ưu hóa để tiết kiệm năng lượng và quản lý pin hiệu quả, 
                                    giúp kéo dài thời gian sử dụng một cách tối ưu.</p>
                                <p style="font-style: italic;"><strong>3.Điện thoại dung lượng lớn</strong></p>
                                <p>Điện thoại dung lượng lớn là những điện thoại được trang bị bộ nhớ trong (ROM) lớn trên 128GB. Dung lượng lưu trữ được đo bằng đơn vị gigabyte (GB) hoặc terabyte (TB).</p>
                                <img src="./img_svg/mainPage/snapedit_1718543856894.jpg" alt="">
                                <p> Những sản phẩm điện thoại dung lượng lớn sẽ cung cấp không gian lưu trữ rộng hơn cho người dùng, 
                                    cho phép lưu trữ nhiều dữ liệu hơn trên thiết bị mà không cần phải lo lắng về việc hết dung lượng. 
                                    Điều này đặc biệt hữu ích khi bạn muốn lưu trữ nhiều ảnh, video chất lượng cao, tải xuống ứng dụng nặng, 
                                    hoặc lưu trữ nhiều tệp tin và tài liệu trên điện thoại.
                                </p>
                                <p style="font-style: italic;"><strong>4.Điện thoại thông minh mỏng nhẹ</strong></p>
                                <p>Đúng như tên gọi của chúng, điện thoại thông minh mỏng nhẹ là dòng sản phẩm được tối ưu về thiết kế giúp chúng sở hữu vẻ ngoài mỏng, ấn tượng nhưng vẫn đáp ứng được tối đa nhu cầu sử dụng của người dùng.</p>
                                <img src="./img_svg/mainPage/snapedit_1718542516274.jpg" alt="">
                                <p style="font-style: italic;"><strong>5.Điện thoại smartphone chụp ảnh đẹp ấn tượng</strong></p>
                                <p>Đúng như tên gọi của nó, dòng sản phẩm này được đầu tư trang bị mạnh mẽ về công nghệ camera vô cùng hiện đại và tinh tế. Từ đó người dùng có thể thoải mái chụp ảnh, selfie hay quay những thước phim vô cùng ấn tượng và độc đáo. 
                                </p>
                                <img src="./img_svg/mainPage/snapedit_1718543685575.jpg" alt="">                                
                            </span>
                        </div>
                        <span class="show-more-btn" onclick="toggleContent()">Xem thêm</span>
                    </div>

                    <div class="content-right col-md-4" style="height: fit-content;">
                        <h5 style="padding-bottom: 10px;"><strong>Thông số kỹ thuật</strong></h5>
                        <table style="width:100%;">
                            <tr>
                                <td>Màn hình</td>
                                <td>${allDetailProduct.screen}</td>
                            </tr>
                            <tr>
                                <td>Camera sau</td>
                                <td>${allDetailProduct.mainCamera}</td>
                            </tr>
                            <tr>
                                <td>Camera Selfie</td>
                                <td>${allDetailProduct.selfieCamera}</td>
                            </tr>
                            <tr>
                                <td>RAM</td>
                                <td>${allDetailProduct.ram}</td>
                            </tr>
                            <tr>
                                <td>Bộ nhớ trong</td>
                                <td>${allDetailProduct.stogare}</td>
                            </tr>
                            <tr>
                                <td>CPU</td>
                                <td>${allDetailProduct.chip}</td>
                            </tr>
                            <tr>
                                <td>Pin</td>
                                <td>${allDetailProduct.battery}</td>
                            </tr>
                            <tr>
                                <td>Thẻ SIM</td>
                                <td>${allDetailProduct.sim}</td>
                            </tr>
                            <tr>
                                <td>Hệ điều hành</td>
                                <td>${allDetailProduct.os}</td>
                            </tr>
                            <tr>
                                <td>Sạc</td>
                                <td>${allDetailProduct.charger}</td>
                            </tr>
                        </table>
<!--                        <div class="mt-2">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.856168121187!2d108.25831637544461!3d15.968885884696228!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1720180268723!5m2!1svi!2s" width="100%" height="220" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>  
                        </div>-->
                    </div>

                </div>

            </div> <!-- content -->
            <!--Q&A Box-->
<div class="d-flex" style="width: 100%; margin-top: 32px;">
    <div class="card"
         style="width: 100%; max-width: 700px; border-radius: 12px; margin-left: 120px;">
        <!-- Thanh tiêu đề "Feedback" thu gọn -->
        <div class="card-header fw-bold fs-5 text-white px-3 py-2"
             style="background-color: #6c757d; border-radius: 0.25rem 0.25rem 0 0; width:1250px">
            Feedback
        </div>

        <div class="card-body"
             style="background: #f8f9fa; border-radius: 0 0 12px 12px; padding: 24px 20px; width:1250px">
            <hr>
            <!-- Form đánh giá -->
            <form action="feedback" method="POST" class="mb-4">
                <input type="hidden" name="productID" value="${allDetailProduct.productID}">
                <input type="hidden" name="userID" value="${sessionScope.account.userID}">
                <div class="mb-3">
                    <label for="note" class="form-label">Nội dung đánh giá:</label>
                    <textarea name="note" class="form-control" rows="3" required placeholder="Viết đánh giá của bạn tại đây..."></textarea>
                </div>
                <div class="mb-3">
                    <label for="rating" class="form-label">Chọn số sao:</label>
                    <select name="rating" class="form-select" required>
                        <option value="5">5 ★ - Rất tốt</option>
                        <option value="4">4 ★ - Tốt</option>
                        <option value="3">3 ★ - Bình thường</option>
                        <option value="2">2 ★ - Kém</option>
                        <option value="1">1 ★ - Rất tệ</option>
                    </select>
                </div>
                <div class="mb-3 text-end">
                    <button type="submit" class="btn text-white px-4 py-2"
                            style="background-color: #6c757d; border-radius: 6px;">
                        Gửi Đánh Giá
                    </button>
                </div>
            </form>
            <hr>
            <!-- Danh sách đánh giá -->
            <div id="questionsList" class="mb-3">
                <c:forEach var="fb" items="${feedbackList}">
                    <div class="question d-flex mb-3 align-items-start" style="gap: 16px;">
                        <div class="avatar avatar-md avatar-text avatar-circle me-3"
                             style="background: #e9ecef; min-width: 48px; height: 48px;
                                    display: flex; align-items: center; justify-content: center;
                                    border-radius: 50%; font-weight: bold; font-size: 1.1rem; color: #6c757d;">
                            <span>U${fb.userID}</span>
                        </div>
                        <div class="info-user" style="flex: 1;">
                            <div class="name-user fw-semibold" style="color: #495057;">User ID: ${fb.userID}</div>
                            <div class="para-user" style="margin-bottom: 4px;">${fb.note}</div>
                            <div class="time-user d-flex align-items-center gap-2"
                                 style="font-size: 0.95rem; color: #848a94;">
                                <div class="text text-grayscale">Đánh giá: ${fb.rating} ★</div>
                                <i class="fa-solid fa-circle" style="color: #848a94; font-size: 4px;"></i>
                                <div class="link link-xs" style="cursor: pointer;">Thích</div>
                                <i class="fa-solid fa-circle" style="color: #848a94; font-size: 4px;"></i>
                                <div class="link link-xs" style="cursor: pointer;">Trả lời</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

            <hr style="margin-top: 50px; width: 100%;">
            <!-- Footer Start -->
            <div class="container contact">
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

                    <div class="col-md-2">
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

                    <div class="col-md-3">
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

                    <div class="col-md-3">
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
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.856168121187!2d108.25831637544461!3d15.968885884696228!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1720180268723!5m2!1svi!2s" width="140%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>  
                        </div>
                    </div>
                </div>
                <hr>
                <div>
                    <p>Địa chỉ: Tầng 6, số 96 Thái Hà Phường Trung Liệt, Quận Đống Đa, Thành phố Hà Nội, Việt Nam.</p>
                    <p>Người đại diện: Hoàng Thị Vân Anh</p>
                    <p>Mã số thuế: 0109749326, ngày cấp ĐKKD 29/04/2021.</p>
                    <p>Điện thoại: 024.7300.6999</p>
                    <p>Email: cskh@gmail.com</p>
                </div>
            </div>

            <footer class="footer">
                <p>Copyright © 2014-2024 | All Rights Reserved.</p>
            </footer>
            <!-- end Footer -->

        </div>

    </main>
    <script>
        // open - close search in header mobile
        document.querySelector('.search-btn').addEventListener('click', function () {
            this.parentElement.classList.toggle('open')
            this.previousElementSibling.focus()
        })

        function updateHiddenInput() {
            const checkedRadio = document.querySelector('input[name="mauSac"]:checked');
            if (checkedRadio) {
                const value = checkedRadio.value;
                document.getElementById('selectedColor1').value = value;
                document.getElementById('selectedColor2').value = value;
            }
        }

        // Ensure the hidden inputs are updated when the page loads with the initial value of the selected radio button
        document.addEventListener('DOMContentLoaded', (event) => {
            updateHiddenInput();
        });

        function updateQuantityInput(value) {
            document.getElementById('selectedQuantity1').value = value;
            document.getElementById('selectedQuantity2').value = value;
        }
        // Ensure the hidden input is updated when the page loads with the initial value of the number input
        document.addEventListener('DOMContentLoaded', (event) => {
            updateQuantityInput(document.getElementById('quantityInput').value);
        });

    </script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/54f0cb7e4a.js" crossorigin="anonymous"></script>
    <script src="./js/myCode.js"></script>
    <!-- Vendor js -->
    <script src="myJs/productDetails/vendor.min.js"></script>
    <!-- App js -->
    <script src="myJs/productDetails/app.min.js"></script>
    <script src="myJs/productDetails/script1.js"></script>
</body>

</html>

