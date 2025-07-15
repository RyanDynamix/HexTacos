
<%@page contentType="text/html" import="model.*, dal.*, java.util.*, controller.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="shortcut icon" href="./img_svg/mainPage/logo-color.png">
        <link rel="stylesheet" href="./css/userCss/shopping_cart.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <script src="./javascript/js/bootstrap.bundle.min.js"></script>
        <link href="./css/icons.min.css" rel="stylesheet" type="text/css" />
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
            <ul class="breadcrumb">
                <li><a href="homePage" class="active"><i class="fas fa-home"></i>Trang chủ</a></li>
                <li><a href="#" class="active">Giỏ hàng</a></li>
            </ul>

            <div class="content_page">
                <div class="content">
                    <!-- Start Content-->
                    <div class="container-fluid">
                        <h3 style="text-align: center; color: red;">Giỏ hàng của bạn</h3> <br>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="table-responsive">

                                                    <form action="shopping?action=changeQuantity" method="POST">
                                                        <table class="table table-borderless table-nowrap table-centered mb-0">
                                                            <thead class="table-light">
                                                                <tr>
                                                                    <th>Sản phẩm</th>
                                                                    <th>Giá</th>
                                                                    <th>Số lượng</th>
                                                                    <th>Thành tiền</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:choose>
                                                                    <c:when test="${not empty allProductShopping}">
                                                                    <input hidden type="text" name="orderID" value="${allProductShopping[0].orderID}">
                                                                    <input type="hidden" name="totalItems" value="${allProductShopping.size()}">
                                                                    <c:forEach var="cartItem" items="${allProductShopping}" varStatus="status">
                                                                        <tr class="product">
                                                                            <td>
                                                                                <img src="${cartItem.thumbnail}" alt="product-img" title="product-img" class="rounded me-3" height="64" />
                                                                                <p class="m-0 d-inline-block align-middle font-16">
                                                                                    <a href="product-details.jsp" class="text-body">${cartItem.productName}</a>
                                                                                    <br>
                                                                                    <small class="me-2"><b>Bộ nhớ:</b> ${cartItem.storage}</small>
                                                                                    <small><b>Màu:</b> ${cartItem.color}</small>
                                                                                </p>
                                                                            </td>
                                                                            <td>
                                                                                <span class="gia">${cartItem.disString}</span>
                                                                            </td>

                                                                            <td class="row">
                                                                                <input name="quantity_${status.index}" onchange="displayOk(event)" type="number" class="soLuong form-control col-6" min="0" value="${cartItem.quantity}" placeholder="Qty" style="width: 60px; padding-right: 0px;">
                                                                                <input type="text" hidden name="color_${status.index}" value="${cartItem.color}">
                                                                                <input type="submit" class="col-5 ok" style="display: none; background: none; border: none; padding: 0; cursor: pointer; outline: none; color: blue;" value="OK"> <%--update giỏ hàng khi số lượng tăng hoặc giảm--%>
                                                                            </td>

                                                                            <td>
                                                                                <span class="thanhTien">${cartItem.price * cartItem.quantity}</span>
                                                                            </td>
                                                                        </tr>
                                                                        <input hidden type="number" name="productID_${status.index}" value="${cartItem.productID}">
                                                                    </c:forEach>

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <p>Không có sản phẩm nào trong giỏ hàng.</p>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            </tbody>
                                                        </table>
                                                    </form>
                                                </div> <!-- end table-responsive-->
                                                <!-- action buttons-->
                                                <div class="row mt-4">
                                                    <div class="col-sm-6">
                                                        <a href="homePage"
                                                           class="btn text-muted d-none text-decoration-none d-sm-inline-block btn-link fw-semibold">
                                                            <i class="fas fa-arrow-left"></i> Tiếp tục mua hàng </a>
                                                    </div> <!-- end col -->
                                                    <div class="col-sm-6">
                                                        <div class="text-sm-end">
                                                            <c:choose>
                                                                <c:when test="${empty allProductShopping}">
                                                                    <!-- Nếu allProductShopping rỗng hoặc null, ẩn nút -->
                                                                    <button id="thanhToanBtn" type="button" class="btn btn-danger" style="display: none;">
                                                                        <i class="fas fa-cart-plus"></i>
                                                                        Thanh toán
                                                                    </button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <!-- Nếu allProductShopping không rỗng, hiển thị nút -->
                                                                    <button id="thanhToanBtn" type="button" class="btn btn-danger"
                                                                            data-bs-toggle="modal" data-bs-target="#myModal">
                                                                        <i class="fas fa-cart-plus"></i>
                                                                        Thanh toán
                                                                    </button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="modal fade" id="myModal">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <!-- Modal Header -->
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title" style="color: red;">
                                                                            <div class="dat_hang"></div>
                                                                            <i class="fas fa-map-marker-alt"></i>
                                                                            Xác nhận thông tin đơn hàng
                                                                        </h4>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"></button>
                                                                    </div>
                                                                    <!-- Modal body -->
                                                                    <div class="row ms-4 ps-5">
                                                                        <div class="modal-body align-items-center">
                                                                            <form action="shopping" method="post">
                                                                                <input type="hidden" name="action" value="orderSubmit" />
                                                                                <input hidden type="text" name="orderID" value="${allProductShopping[0].orderID}">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td class="fw-bold">Tên người nhận</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="pb-2 user_info"><input
                                                                                                type="text" name="nameOrder"
                                                                                                placeholder="Tên Người Nhận"
                                                                                                value="${account.fullName}"
                                                                                                required></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="fw-bold">Số điện thoại</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="pb-2 user_info"><input
                                                                                                type="tel"
                                                                                                name="phone"
                                                                                                placeholder="Số Điện Thoại"
                                                                                                value="${account.phone}"
                                                                                                required></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="fw-bold">Phương thức thanh toán</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="pb-2 user-info">
                                                                                            <label>
                                                                                                <input type="radio" name="paymentMethod" value="COD" checked>
                                                                                                Thanh toán khi nhận hàng (COD)
                                                                                            </label>
                                                                                            <label>
                                                                                                <input type="radio" name="paymentMethod" value="PAYOS">
                                                                                                Thanh toán qua PayOS
                                                                                            </label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="fw-bold"><label for="address">Địa chỉ nhận hàng</label></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="pb-2 user_info">
                                                                                            <textarea name="deliveryLocation" id="address" placeholder="Địa Chỉ Nhận Hàng" cols="40">${account.address}</textarea>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </form>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> <!-- end col -->
                                                </div> <!-- end row-->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-md-4">
                                                <div class="border p-3 mt-4 mt-lg-0 rounded">
                                                    <h5 class="header-title mb-3">Tóm tắt đơn hàng</h5>

                                                    <div class="table-responsive">
                                                        <table class="table mb-0">
                                                            <tbody>
                                                                <tr>
                                                                    <td>Tổng tiền hàng: </td>
                                                                    <td><span id="tongTienHang">0đ</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Giảm giá: </td>
                                                                    <td>
                                                                        <span id="giamGia">
                                                                            <c:choose>
                                                                                <c:when test="${empty allProductShopping}">
                                                                                    0đ
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    50,000đ
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Phí vận chuyển: </td>
                                                                    <td>
                                                                        <span id="phiVanChuyen">
                                                                            <c:choose>
                                                                                <c:when test="${empty allProductShopping}">
                                                                                    0đ
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    50,000đ
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </span>
                                                                    </td>
                                                                </tr>

                                                                <!--                                                                <tr>
                                                                                                                                    <td>Thuế (10%): </td>
                                                                                                                                    <td><span id="thue">0đ</span></td>
                                                                                                                                </tr>-->
                                                                <tr>
                                                                    <th>Tổng cộng: </th>
                                                                    <th><span id="tongCong" >0đ</span></th>   <!-- id="tongCong" -->
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- end table-responsive -->
                                                </div>
                                                <div class="alert alert-warning mt-3" role="alert">
                                                    <!--Sử dụng mã giảm giá <strong>HYPBM</strong> và nhận giảm giá 10% !-->
                                                    Hiện tại đang có chương trình <strong>FreeShip</strong> cho toàn bộ sản phẩm
                                                </div>

                                                <div class="input-group mt-3">
                                                    <input type="text" class="form-control" placeholder="Coupon code"
                                                           aria-label="Recipient's username">
                                                    <button class="input-group-text btn-light" type="button">Áp
                                                        dụng</button>
                                                </div>


                                            </div> <!-- end col -->
                                        </div> <!-- end row -->
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div>
                        </div>
                        <!-- end row -->
                    </div> <!-- container -->
                </div> <!-- content -->

            </div>
            <button onclick="topFunction()" id="myBtn" title="Go to top">
                <i class="fas fa-arrow-up"></i>
            </button>
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
                            </ul>
                            <img style="width: 15%; margin-top: 10px;" src="./img_svg/mainPage/ft-img1.png"
                                 alt="">
                            <img style="width: 40%; margin-top: 10px;" src="./img_svg/mainPage/ft-img2.png" alt="">
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
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.856168121187!2d108.25831637544461!3d15.968885884696228!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1720180268723!5m2!1svi!2s" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>                 
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
                        <p>&copy; 2007 - 2023 Công Ty Cổ Phần Bán Lẻ Kỹ Thuật Số Hextech</p>
                    </div>
                </div>
            </div>
        </main>

        <%--<c:if test="${not empty requestScope.notifyOrder}">--%>
            <!--<input type="hidden" id="notifyOrder" value="${requestScope.notifyOrder}" />-->
        <%--<c:remove var="notifyOrder" scope="request" />--%>
        <%--</c:if>--%>

        <script>
            //Hiển thị thông cáo khi xác nhận Order

            window.onload = function () {
                const urlParams = new URLSearchParams(window.location.search);
                const notifyOrder = urlParams.get('notifyOrder');
                if (notifyOrder === "success") {
                    alert("Thanh toán thành công!");
                } else if (notifyOrder === "failed") {
                    alert("Thanh toán thất bại!");
                }
            };


            // Hiển thị dấu tích khi thay đổi số lượng
            function displayOk(event) {
                //Lấy nút thanh toán
                let thanhToanBtn = document.querySelector("#thanhToanBtn");
                // Lấy thẻ <td> cha của <input> được thay đổi
                let td = event.target.closest('td.row');
                // Tìm thẻ <a> bên trong thẻ <td> đó
                let a = td.querySelector('.ok');
                // Hiển thị thẻ <a>
                if (a.style.display === 'none') {       //hiện nút ok thì ẩn nút thanh toán
                    a.style.display = 'block';
                    thanhToanBtn.style.display = 'none';
                }
            }
        </script>
        <script>
            fetch('/shopping', {
                method: 'POST',
                body: formData
            })
                    .then(response => {
                        if (!response.ok)
                            throw new Error('Network response was not ok');
                        return response.json(); // vì giờ response thật sự là JSON
                    })
                    .then(data => {
                        if (data.code === "00") {
                            if (data.data) {
                                window.location.href = data.data; // Redirect to VNPAY
                            } else {
                                alert("Đặt hàng thành công!");
                                window.location.href = '/home'; // Redirect to home
                            }
                        } else {
                            alert("Lỗi: " + data.message);
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert("Có lỗi xảy ra khi xử lý đơn hàng. Vui lòng thử lại.");
                    });


        </script>



        <script src="./myJs/userJs/shopping_cart.js"></script>
        <script src="./myJs/userJs/vendor.min.js"></script>
        <script src="./myJs/userJs/app.min.js"></script>
    </body>
</html>
