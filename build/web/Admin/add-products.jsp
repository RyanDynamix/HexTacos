<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Thêm sản phẩm</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Theme Config Js -->
        <script src="assets/js/hyper-config.js"></script>
        <!-- App css -->
        <link href="assets/css/app-saas.min.css" rel="stylesheet" type="text/css" id="app-style" />

        <!-- Icons css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>
        <!-- Begin page -->
        <div class="wrapper">

            <!-- ========== Topbar Start ========== -->
            <div class="navbar-custom">
                <div class="topbar container-fluid">
                    <div class="d-flex align-items-center gap-lg-2 gap-1">

                        <!-- Sidebar Menu Toggle Button -->
                        <button class="button-toggle-menu">
                            <i class="mdi mdi-menu"></i>
                        </button>

                        <!-- Horizontal Menu Toggle Button -->
                        <button class="navbar-toggle" data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </button>

                        <!-- Topbar Search Form -->
                        <div class="app-search dropdown d-none d-lg-block">
                            <form>
                                <div class="input-group">
                                    <input type="search" class="form-control dropdown-toggle" placeholder="Search..." id="top-search">
                                    <span class="mdi mdi-magnify search-icon"></span>
                                    <button class="input-group-text btn btn-primary" type="submit">Search</button>
                                </div>
                            </form>

                            <div class="dropdown-menu dropdown-menu-animated dropdown-lg" id="search-dropdown">
                                <!-- item-->
                                <div class="dropdown-header noti-title">
                                    <h5 class="text-overflow mb-2">Đã tìm <span class="text-danger">1</span> kết quả trước đó</h5>
                                </div>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="uil-notes font-16 me-1"></i>
                                    <span>Lịch trình</span>
                                </a>

                                <!-- item
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="uil-life-ring font-16 me-1"></i>
                                    <span>How can I help you?</span>
                                </a>

                                
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="uil-cog font-16 me-1"></i>
                                    <span>User profile settings</span>
                                </a> -->

                                <!-- item-->
                                <div class="dropdown-header noti-title">
                                    <h6 class="text-overflow mb-2 text-uppercase">Người dùng</h6>
                                </div>

                                <div class="notification-list">
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="d-flex">
                                            <img class="d-flex me-2 rounded-circle" src="assets/images/users/anhcuakleqingcamcopy.png" alt="Generic placeholder image" height="32">
                                            <div class="w-100">
                                                <h5 class="m-0 font-14">Admin</h5>
                                                <span class="font-12 mb-0">Admin</span>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <ul class="topbar-menu d-flex align-items-center gap-3">
                        <li class="dropdown d-lg-none">
                            <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <i class="ri-search-line font-22"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                                <form class="p-3">
                                    <input type="search" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                </form>
                            </div>
                        </li>
                        
                        <%@ include file="includes/notification-dropdown.jsp" %>

                        <li class="d-none d-sm-inline-block">
                            <a class="nav-link" data-bs-toggle="offcanvas" href="#theme-settings-offcanvas">
                                <i class="ri-settings-3-line font-22"></i>
                            </a>
                        </li>

                        <li class="d-none d-sm-inline-block">
                            <div class="nav-link" id="light-dark-mode" data-bs-toggle="tooltip" data-bs-placement="left" title="Dark - Light">
                                <i class="ri-moon-line font-22"></i>
                            </div>
                        </li>

                        <li class="d-none d-md-inline-block">
                            <a class="nav-link" href="#" data-toggle="fullscreen">
                                <i class="ri-fullscreen-line font-22"></i>
                            </a>
                        </li>

                        <li class="dropdown">
                            <a class="nav-link dropdown-toggle arrow-none nav-user px-2" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <span class="account-user-avatar">
                                    <img src="assets/images/users/anhcuakleqingcamcopy.png" alt="user-image" width="32" class="rounded-circle">
                                </span>
                                <span class="d-lg-flex flex-column gap-1 d-none">
                                    <h5 class="my-0">Admin</h5>
                                    <h6 class="my-0 fw-normal">Admin</h6>
                                </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated profile-dropdown">
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <i class="mdi mdi-logout me-1"></i>
                                    <span>Logout</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- ========== Topbar End ========== -->

            <!-- ========== Left Sidebar Start ========== -->
            <div class="leftside-menu">

                <!-- Sidebar Hover Menu Toggle Button -->
                <div class="button-sm-hover" data-bs-toggle="tooltip" data-bs-placement="right" title="Show Full Sidebar">
                    <i class="ri-checkbox-blank-circle-line align-middle"></i>
                </div>

                <!-- Full Sidebar Menu Close Button -->
                <div class="button-close-fullsidebar">
                    <i class="ri-close-fill align-middle"></i>
                </div>

                <!-- Sidebar -left -->
                <div class="h-100" id="leftside-menu-container" data-simplebar>
                    <!-- Leftbar User -->
                    <div class="leftbar-user">
                        <a href="pages-profile.jsp">
                            <img src="assets/images/users/anhcuakleqingcamcopy.png" alt="user-image" height="42" class="rounded-circle shadow-sm">
                            <span class="leftbar-user-name mt-2">Admin</span>
                        </a>
                    </div>

                    <!--- Sidemenu -->
                    <ul class="side-nav">

                        <li class="side-nav-title">Điều hướng</li>

                        <li class="side-nav-item">
                            <a data-bs-toggle="collapse" href="#sidebarDashboards" aria-expanded="false" aria-controls="sidebarDashboards" class="side-nav-link">
                                <i class="uil-home-alt"></i>
                                <span class="badge bg-success float-end">5</span>
                                <span> Bảng điều khiển </span>
                            </a>
                            <div class="collapse" id="sidebarDashboards">
                                <ul class="side-nav-second-level">
                                    <li>
                                        <a href="index">Trang chủ</a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <li class="side-nav-title">Ứng dụng</li>

                        <li class="side-nav-item">
                            <a href="calendar.jsp" class="side-nav-link">
                                <i class="uil-calender"></i>
                                <span class="badge bg-danger text-white float-end">Mới!</span>
                                <span> Lịch trình </span>
                            </a>
                        </li>

                        <li class="side-nav-item">
                            <a data-bs-toggle="collapse" href="#sidebarEcommerce" aria-expanded="false" aria-controls="sidebarEcommerce" class="side-nav-link">
                                <i class="uil-store"></i>
                                <span> Quản lý </span>
                                <span class="menu-arrow"></span>
                            </a>
                            <div class="collapse" id="sidebarEcommerce">
                                <ul class="side-nav-second-level">
                                    <li>
                                        <a href="products">Sản phẩm</a>
                                    </li>
                                    <li>
                                        <a href="orders">Đơn đặt hàng</a>
                                    </li>
                                    <li>
                                        <a href="customers">Khách hàng</a>
                                    </li>
                                    <li>
                                        <a href="adminDiscount">Mã giảm giá</a>
                                    </li>
                                    <li>
                                    <a href="notifications">Thông báo</a>
                                </li>
                                </ul>
                            </div>
                        </li>

                        <!-- Help Box -->
                        <div class="help-box text-white text-center">
                            <a href="javascript: void(0);" class="float-end close-btn btn">
                            </a>
                            <img src="assets/images/svg/help-icon.svg" height="90" alt="Helper Icon Image" />
                            <h5 class="mt-3">Web admin</h5>
                            <p class="mb-3">Tối ưu thời gian quản lý với UI mới.</p>
                            <a href="javascript: void(0);"></a>
                            <div class="text-center ">
                                <a class="btn btn-outline-primary"
                                   href="#"
                                   type="button">Quyền riềng tư & Bảo mật</a>

                                <a class="btn bg-gradient-primary w-100"
                                   href="#"
                                   type="button">Trách nhiệm & Pháp lý</a>
                            </div>
                        </div>
                        <!-- end Help Box -->

                    </ul>
                    <!--- End Sidemenu -->

                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- ========== Left Sidebar End ========== -->

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item">Quản lý</li>
                                            <li class="breadcrumb-item"><a href="products">Sản phẩm</a></li>
                                            <li class="breadcrumb-item active"><a href="#">Tạo sản phẩm</a></li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="basic-form-preview">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <h3 class="page-title">Tạo sản phẩm</h3><br>

                                                    <!-- Display error messages -->
                                                    <c:if test="${not empty sessionScope.errorMessage}">
                                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                            <strong>Error!</strong> ${sessionScope.errorMessage}
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>
                                                        <% session.removeAttribute("errorMessage"); %>
                                                    </c:if>

                                                    <c:if test="${not empty sessionScope.successMessage}">
                                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                            <strong>Success!</strong> ${sessionScope.successMessage}
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>
                                                        <% session.removeAttribute("successMessage"); %>
                                                    </c:if>

                                                    <div class="alert alert-info mb-4">
                                                        <h5><i class="uil-info-circle me-2"></i>Hướng dẫn sử dụng</h5>
                                                        <p>Để thêm sản phẩm mới:</p>
                                                        <ol>
                                                            <li>Điền đầy đủ thông tin sản phẩm cơ bản</li>
                                                            <li>Thêm thông tin chi tiết của sản phẩm</li>
                                                            <li>Chọn file ảnh chính và ảnh bổ sung (nếu có)</li>
                                                        </ol>
                                                    </div>

                                                    <!-- Form không multipart nữa vì không upload file -->
                                                    <form id="productForm" action="${pageContext.request.contextPath}/Admin/addProduct" method="post">
                                                        <div class="card mb-3">
                                                            <div class="card-header bg-primary text-white">
                                                                <h4 class="card-title mb-0">Thông tin cơ bản</h4>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="mb-3">
                                                                            <label for="name" class="form-label">Tên sản phẩm</label>
                                                                            <input name="name" id="name" type="text" class="form-control" placeholder="Tên sản phẩm" required>
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="description" class="form-label">Mô tả</label>
                                                                            <textarea name="description" id="description" class="form-control" placeholder="Mô tả" rows="3"></textarea>
                                                                            <small class="form-text text-muted">*Tuỳ chọn</small>
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="loaiPr" class="form-label">Loại sản phẩm</label>
                                                                            <select name="loaiPr" id="loaiPr" class="form-select" required>
                                                                                <option value="" disabled selected>Chọn loại sản phẩm</option>
                                                                                <option value="1">Smartphones</option>
                                                                                <option value="2">Tablets</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="hangPr" class="form-label">Hãng sản xuất</label>
                                                                            <select name="hangPr" id="hangPr" class="form-select" required>
                                                                                <option value="" disabled selected>Chọn hãng sản xuất</option>
                                                                                <option value="3">Apple</option>
                                                                                <option value="4">Samsung</option>
                                                                                <option value="5">Oppo</option>
                                                                                <option value="6">Xiaomi</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="mb-3">
                                                                            <label for="price" class="form-label">Giá</label>
                                                                            <input name="price" id="price" type="number" step="0.01" class="form-control" placeholder="Giá" required>
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="discount" class="form-label">Discount</label>
                                                                            <input name="discount" id="discount" type="number" step="0.01" class="form-control" placeholder="Discount" value="0">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="quantity" class="form-label">Số lượng</label>
                                                                            <input name="quantity" id="quantity" type="number" class="form-control" placeholder="Số lượng" required>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="mb-3">
                                                                                    <label for="created_at" class="form-label">Ngày tạo</label>
                                                                                    <input name="created_at" id="created_at" type="date" class="form-control" required>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="mb-3">
                                                                                    <label for="updated_at" class="form-label">Ngày cập nhật</label>
                                                                                    <input name="updated_at" id="updated_at" type="date" class="form-control" required>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="card mb-3">
                                                            <div class="card-header bg-primary text-white">
                                                                <h4 class="card-title mb-0">Thông tin chi tiết sản phẩm</h4>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="mb-3">
                                                                            <label for="screen" class="form-label">Màn hình</label>
                                                                            <input name="screen" id="screen" type="text" class="form-control" placeholder="Màn hình">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="os" class="form-label">Hệ điều hành</label>
                                                                            <input name="os" id="os" type="text" class="form-control" placeholder="Hệ điều hành">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="mCam" class="form-label">Camera chính</label>
                                                                            <input name="mCam" id="mCam" type="text" class="form-control" placeholder="Camera chính">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="sCam" class="form-label">Camera selfie</label>
                                                                            <input name="sCam" id="sCam" type="text" class="form-control" placeholder="Camera selfie">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="chip" class="form-label">Chip</label>
                                                                            <input name="chip" id="chip" type="text" class="form-control" placeholder="Chip">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="mb-3">
                                                                            <label for="ram" class="form-label">RAM</label>
                                                                            <input name="ram" id="ram" type="text" class="form-control" placeholder="RAM">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="sim" class="form-label">SIM</label>
                                                                            <input name="sim" id="sim" type="text" class="form-control" placeholder="SIM">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="pin" class="form-label">Pin</label>
                                                                            <input name="pin" id="pin" type="text" class="form-control" placeholder="Pin">
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label for="sac" class="form-label">Sạc</label>
                                                                            <input name="sac" id="sac" type="text" class="form-control" placeholder="Sạc">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="card mb-3">
                                                            <div class="card-header bg-success text-white">
                                                                <h4 class="card-title mb-0">Chi tiết sản phẩm (Product Details)</h4>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="alert alert-info">
                                                                    <strong>Hướng dẫn:</strong> Nhập các cặp màu sắc và dung lượng. Mỗi dòng là một biến thể sản phẩm.
                                                                </div>
                                                                
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="mb-3">
                                                                            <label class="form-label">Màu sắc <span class="text-danger">*</span></label>
                                                                            <textarea name="colors" class="form-control" rows="4" placeholder="Mỗi màu một dòng:&#10;Đỏ&#10;Xanh&#10;Vàng" required></textarea>
                                                                            <small class="form-text text-muted">Nhập mỗi màu sắc một dòng</small>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="mb-3">
                                                                            <label class="form-label">Dung lượng <span class="text-danger">*</span></label>
                                                                            <textarea name="storages" class="form-control" rows="4" placeholder="Mỗi dung lượng một dòng:&#10;128GB&#10;256GB&#10;512GB" required></textarea>
                                                                            <small class="form-text text-muted">Nhập mỗi dung lượng một dòng</small>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="alert alert-warning">
                                                                    <strong>Lưu ý:</strong> Hệ thống sẽ tạo tất cả các kết hợp giữa màu sắc và dung lượng. 
                                                                    Ví dụ: 3 màu × 2 dung lượng = 6 biến thể sản phẩm.
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="card mb-3">
                                                            <div class="card-header bg-primary text-white">
                                                                <h4 class="card-title mb-0">Hình ảnh sản phẩm</h4>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="mb-3">
                                                                            <label for="thumbnail" class="form-label">Tên ảnh chính <span class="text-danger">*</span></label>
                                                                            <input id="thumbnail" name="thumbnail" type="text" class="form-control" placeholder="Ví dụ: iphone15_red.jpg" required/>
                                                                            <small class="form-text text-muted">Nhập tên file ảnh chính (đã có sẵn trên server)</small>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="mb-3">
                                                                            <label for="images" class="form-label">Tên ảnh bổ sung</label>
                                                                            <input id="images" name="images" type="text" class="form-control" placeholder="Ví dụ: iphone15_1.jpg,iphone15_2.jpg"/>
                                                                            <small class="form-text text-muted">Nhập tên các file ảnh bổ sung, cách nhau bằng dấu phẩy</small>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="text-end mt-3">
                                                            <button type="button" class="btn btn-secondary me-2" onClick="window.location.href = 'products'">Hủy</button>
                                                            <button type="submit" class="btn btn-primary">Tạo sản phẩm</button>
                                                        </div>
                                                    </form>

                                                    <!-- JavaScript for dynamic form fields -->
                                                    <script>
                                                        // Set today's date as default for date fields
                                                        document.addEventListener('DOMContentLoaded', function () {
                                                            const today = new Date().toISOString().split('T')[0];
                                                            document.getElementById('created_at').value = today;
                                                            document.getElementById('updated_at').value = today;
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- container -->

                </div> <!-- content -->

                <!-- Footer Start -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <script>document.write(new Date().getFullYear())</script> © Kleqing - kleqing.github.io
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end footer-links d-none d-md-block">
                                    <a href="javascript: void(0);">Về chúng tôi</a>
                                    <a href="javascript: void(0);">Hỗ trợ</a>
                                    <a href="javascript: void(0);">Liên hệ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->

        </div>
        <!-- END wrapper -->

        <!-- Theme Settings -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="theme-settings-offcanvas">
            <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                <h5 class="text-white m-0">Cài đặt chủ đề</h5>
                <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>

            <div class="offcanvas-body p-0">
                <div data-simplebar class="h-100">
                    <div class="card mb-0 p-3">

                        <h5 class="mt-0 my-3 font-16 fw-bold">Màu nền</h5>

                        <div class="colorscheme-cardradio">
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-check card-radio">
                                        <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-light" value="light">
                                        <label class="form-check-label p-0 avatar-md w-100" for="layout-color-light">
                                            <div id="sidebar-size">
                                                <span class="d-flex h-100">
                                                    <span class="flex-shrink-0">
                                                        <span class="bg-light d-flex h-100 border-end flex-column p-1 px-2">
                                                            <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        </span>
                                                    </span>
                                                    <span class="flex-grow-1">
                                                        <span class="d-flex h-100 flex-column bg-white rounded-2">
                                                            <span class="bg-light d-block p-1"></span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </div>

                                            <div id="topnav-color" class="bg-white rounded-2 h-100">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                        <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    </span>
                                                    <span class="d-flex h-100 flex-column bg-white rounded-2">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </div>
                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Sáng</h5>
                                </div>

                                <div class="col-4">
                                    <div class="form-check card-radio">
                                        <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-dark" value="dark">
                                        <label class="form-check-label p-0 avatar-md w-100 bg-black" for="layout-color-dark">
                                            <div id="sidebar-size">
                                                <span class="d-flex h-100">
                                                    <span class="flex-shrink-0">
                                                        <span class="bg-light d-flex h-100 flex-column p-1 px-2">
                                                            <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                            <span class="d-block border border-secondary border-opacity-25 border-3 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-secondary border-opacity-25 border-3 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-secondary border-opacity-25 border-3 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-secondary border-opacity-25 border-3 rounded w-100 mb-1"></span>
                                                        </span>
                                                    </span>
                                                    <span class="flex-grow-1">
                                                        <span class="d-flex h-100 flex-column">
                                                            <span class="bg-light d-block p-1"></span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </div>

                                            <div id="topnav-color">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light-lighten d-flex p-1 align-items-center border-bottom border-opacity-25 border-primary border-opacity-25">
                                                        <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                        <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-auto"></span>
                                                        <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                        <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                        <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                    </span>
                                                    <span class="bg-light-lighten d-block p-1"></span>
                                                </span>
                                            </div>
                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Tối</h5>
                                </div>
                            </div>
                        </div>

                        <div id="layout-width">
                            <h5 class="my-3 font-16 fw-bold">Layout</h5>

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-check card-radio">
                                        <input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-fluid" value="fluid">
                                        <label class="form-check-label p-0 avatar-md w-100" for="layout-mode-fluid">
                                            <div id="sidebar-size">
                                                <span class="d-flex h-100">
                                                    <span class="flex-shrink-0">
                                                        <span class="bg-light d-flex h-100 border-end flex-column p-1 px-2">
                                                            <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        </span>
                                                    </span>
                                                    <span class="flex-grow-1">
                                                        <span class="d-flex h-100 flex-column rounded-2">
                                                            <span class="bg-light d-block p-1"></span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </div>

                                            <div id="topnav-color">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                        <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    </span>
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </div>
                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Gắn liền</h5>
                                </div>

                                <div class="col-4" id="layout-detached">
                                    <div class="form-check sidebar-setting card-radio">
                                        <input class="form-check-input" type="radio" name="data-layout-mode" id="data-layout-detached" value="detached">
                                        <label class="form-check-label p-0 avatar-md w-100" for="data-layout-detached">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light d-flex p-1 align-items-center border-bottom ">
                                                    <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                </span>
                                                <span class="d-flex h-100 p-1 px-2">
                                                    <span class="flex-shrink-0">
                                                        <span class="bg-light d-flex h-100 flex-column p-1 px-2">
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100"></span>
                                                        </span>
                                                    </span>
                                                </span>
                                                <span class="bg-light d-block p-1 mt-auto px-2"></span>
                                            </span>

                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Tách rời</h5>
                                </div>
                            </div>
                        </div>

                        <h5 class="my-3 font-16 fw-bold">Màu topbar</h5>

                        <div class="row">
                            <div class="col-4">
                                <div class="form-check card-radio">
                                    <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-light" value="light">
                                    <label class="form-check-label p-0 avatar-md w-100" for="topbar-color-light">
                                        <div id="sidebar-size">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 border-end  flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>

                                        <div id="topnav-color">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                    <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                </span>
                                                <span class="bg-light d-block p-1"></span>
                                            </span>
                                        </div>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Sáng</h5>
                            </div>

                            <div class="col-4" style="--ct-dark-rgb: 64,73,84;">
                                <div class="form-check card-radio">
                                    <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-dark" value="dark">
                                    <label class="form-check-label p-0 avatar-md w-100" for="topbar-color-dark">
                                        <div id="sidebar-size">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 border-end  flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-primary-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-dark d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>

                                        <div id="topnav-color">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-dark d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                    <span class="d-block p-1 bg-primary-lighten rounded me-1"></span>
                                                    <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-auto"></span>
                                                    <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                    <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                    <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                </span>
                                                <span class="bg-light d-block p-1"></span>
                                            </span>
                                        </div>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Tối</h5>
                            </div>
                        </div>

                        <div>
                            <h5 class="my-3 font-16 fw-bold">Màu menu</h5>

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-check sidebar-setting card-radio">
                                        <input class="form-check-input" type="radio" name="data-menu-color" id="leftbar-color-light" value="light">
                                        <label class="form-check-label p-0 avatar-md w-100" for="leftbar-color-light">
                                            <div id="sidebar-size">
                                                <span class="d-flex h-100">
                                                    <span class="flex-shrink-0">
                                                        <span class="bg-light d-flex h-100 border-end  flex-column p-1 px-2">
                                                            <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        </span>
                                                    </span>
                                                    <span class="flex-grow-1">
                                                        <span class="d-flex h-100 flex-column">
                                                            <span class="bg-light d-block p-1"></span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </div>

                                            <div id="topnav-color">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                        <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    </span>
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </div>
                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Sáng</h5>
                                </div>

                                <div class="col-4" style="--ct-dark-rgb: 64,73,84;">
                                    <div class="form-check sidebar-setting card-radio">
                                        <input class="form-check-input" type="radio" name="data-menu-color" id="leftbar-color-dark" value="dark">
                                        <label class="form-check-label p-0 avatar-md w-100" for="leftbar-color-dark">
                                            <div id="sidebar-size">
                                                <span class="d-flex h-100">
                                                    <span class="flex-shrink-0">
                                                        <span class="bg-dark d-flex h-100 flex-column p-1 px-2">
                                                            <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                            <span class="d-block border border-secondary rounded border-opacity-25 border-3 w-100 mb-1"></span>
                                                            <span class="d-block border border-secondary rounded border-opacity-25 border-3 w-100 mb-1"></span>
                                                            <span class="d-block border border-secondary rounded border-opacity-25 border-3 w-100 mb-1"></span>
                                                            <span class="d-block border border-secondary rounded border-opacity-25 border-3 w-100 mb-1"></span>
                                                        </span>
                                                    </span>
                                                    <span class="flex-grow-1">
                                                        <span class="d-flex h-100 flex-column">
                                                            <span class="bg-light d-block p-1"></span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </div>

                                            <div id="topnav-color">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-primary border-opacity-25">
                                                        <span class="d-block p-1 bg-primary-lighten rounded me-1"></span>
                                                        <span class="d-block border border-secondary rounded border-opacity-25 border-3 ms-auto"></span>
                                                        <span class="d-block border border-secondary rounded border-opacity-25 border-3 ms-1"></span>
                                                        <span class="d-block border border-secondary rounded border-opacity-25 border-3 ms-1"></span>
                                                        <span class="d-block border border-secondary rounded border-opacity-25 border-3 ms-1"></span>
                                                    </span>
                                                    <span class="bg-dark d-block p-1"></span>
                                                </span>
                                            </div>
                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Tối</h5>
                                </div>
                            </div>
                        </div>

                        <div id="sidebar-size">
                            <h5 class="my-3 font-16 fw-bold">Kích thước sidebar</h5>

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-check sidebar-setting card-radio">
                                        <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-default" value="default">
                                        <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-default">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 border-end  flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Mặc định</h5>
                                </div>

                                <div class="col-4">
                                    <div class="form-check sidebar-setting card-radio">
                                        <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-compact" value="compact">
                                        <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-compact">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 border-end  flex-column p-1">
                                                        <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Tối giản</h5>
                                </div>

                                <div class="col-4">
                                    <div class="form-check sidebar-setting card-radio">
                                        <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-full" value="full">
                                        <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-full">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="d-block p-1 bg-dark-lighten mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Bố cục đầy đủ</h5>
                                </div>

                                <div class="col-4">
                                    <div class="form-check sidebar-setting card-radio">
                                        <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-fullscreen" value="fullscreen">
                                        <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-fullscreen">
                                            <span class="d-flex h-100">
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                    <h5 class="font-14 text-center text-muted mt-2">Bố cục toàn màn hình</h5>
                                </div>
                            </div>
                        </div>

                        <div id="sidebar-user">
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <label class="font-16 fw-bold m-0" for="sidebaruser-check">Hiện thị tên người dùng</label>
                                <div class="form-check form-switch">
                                    <input type="checkbox" class="form-check-input" name="sidebar-user" id="sidebaruser-check">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="offcanvas-footer border-top p-3 text-center">
            <button type="button" class="btn btn-light w-100" id="reset-layout">Khôi phục về mặc định</button>
        </div>
    </div>

    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- Code Highlight js -->
    <script src="assets/vendor/highlightjs/highlight.pack.min.js"></script>
    <script src="assets/vendor/clipboard/clipboard.min.js"></script>
    <script src="assets/js/hyper-syntax.js"></script>

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>
    <style>
        #colorCount {
            display: inline-block;
            width: auto;
            margin-right: 10px;
        }

        #colorFieldsContainer .color-field-container {
            margin-top: 10px;
        }

        #colorFieldsContainer .color-field-container:first-of-type {
            display: inline-block;
        }
    </style>
    <script>
                                    // Set today's date as default for date fields
                                    document.addEventListener('DOMContentLoaded', function () {
                                        const today = new Date().toISOString().split('T')[0];
                                        document.getElementById('created_at').value = today;
                                        document.getElementById('updated_at').value = today;

                                        // Add form submission validation - TEMPORARILY DISABLED FOR TESTING
                                        document.getElementById('productForm').addEventListener('submit', function(e) {
                                            console.log('Form submission started');
                                            
                                            // Get form data for debugging
                                            const formData = new FormData(this);
                                            console.log('Form data entries:');
                                            for (let [key, value] of formData.entries()) {
                                                console.log(key + ': ' + value);
                                            }
                                            
                                            // TEMPORARILY SKIP VALIDATION
                                            console.log('Validation skipped for testing, submitting form...');
                                            return true;
                                        });

                                        // Old storage and color JavaScript removed - now using dynamic ProductDetail forms
                                    });
    </script>

    <script>
        // Debug form submission
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('productForm');
            if (form) {
                form.addEventListener('submit', function(e) {
                    console.log('Form is being submitted...');
                    console.log('Form action:', form.action);
                    console.log('Form method:', form.method);
                    console.log('Form enctype:', form.enctype);
                    
                    // Check for required fields
                    const name = form.querySelector('[name="name"]');
                    const price = form.querySelector('[name="price"]');
                    const hangPr = form.querySelector('[name="hangPr"]');
                    const loaiPr = form.querySelector('[name="loaiPr"]');
                    
                    console.log('Form values:', {
                        name: name ? name.value : 'not found',
                        price: price ? price.value : 'not found',
                        hangPr: hangPr ? hangPr.value : 'not found',
                        loaiPr: loaiPr ? loaiPr.value : 'not found'
                    });
                    
                    // Allow form to submit
                    return true;
                });
            }
        });
        
        // Form validation function
        function validateForm() {
            console.log("Validation function called - TEMPORARILY DISABLED FOR TESTING");
            // Temporarily return true to skip all validation
            return true;
            
            /*
            const form = document.getElementById('productForm');
            
            // Check required fields
            const name = form.querySelector('[name="name"]').value.trim();
            const price = form.querySelector('[name="price"]').value.trim();
            const hangPr = form.querySelector('[name="hangPr"]').value;
            const loaiPr = form.querySelector('[name="loaiPr"]').value;
            const description = form.querySelector('[name="description"]').value.trim();
            
            console.log("Basic fields:", {name, price, hangPr, loaiPr, description});
            
            if (!name || !price || !hangPr || !loaiPr || !description) {
                alert('Vui lòng điền đầy đủ thông tin bắt buộc!');
                return false;
            }
            
            // Check ProductDetail forms - simplified approach
            const container = document.getElementById('productDetailFormsContainer');
            const productDetailForms = container ? container.querySelectorAll('.product-detail-form') : [];
            
            console.log("Found ProductDetail forms:", productDetailForms.length);
            
            if (productDetailForms.length === 0) {
                alert('Vui lòng tạo ít nhất một chi tiết sản phẩm!\nChọn số lượng và nhấn "Tạo Form"');
                return false;
            }
            
            // Check if at least one form has color and storage filled
            let hasValidDetail = false;
            for (let i = 0; i < 10; i++) { // Check up to 10 possible forms
                const colorField = form.querySelector('[name="productDetail[' + i + '].color"]');
                const storageField = form.querySelector('[name="productDetail[' + i + '].storage"]');
                
                console.log("Form " + i + ":", {
                    colorField: colorField ? colorField.value : "not found",
                    storageField: storageField ? storageField.value : "not found"
                });
                
                if (colorField && storageField && 
                    colorField.value.trim() !== '' && storageField.value.trim() !== '') {
                    hasValidDetail = true;
                    console.log("Found valid detail at index:", i);
                    break;
                }
            }
            
            if (!hasValidDetail) {
                alert('Vui lòng điền đầy đủ thông tin cho ít nhất một chi tiết sản phẩm (màu sắc và dung lượng)!');
                return false;
            }
            
            console.log("Validation passed!");
            return true;
            */
        }
    </script>
    
    <%@ include file="includes/notification-js.jsp" %>

</body>

<!-- Mirrored from coderthemes.com/hyper/saas/form-elements.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 14 Dec 2023 13:30:46 GMT -->
</html>