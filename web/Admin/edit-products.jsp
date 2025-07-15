<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Chỉnh sửa sản phẩm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- Theme Config Js -->
    <script src="assets/js/hyper-config.js"></script>

    <!-- App css -->
    <link href="assets/css/app-saas.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
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
                            <a class="btn btn-outline-primary" href="#" type="button">Quyền riêng tư & Bảo mật</a>
                            <a class="btn bg-gradient-primary w-100" href="#" type="button">Trách nhiệm & Pháp lý</a>
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
                <div class="container-fluid">
                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item">Quản lý</li>
                                        <li class="breadcrumb-item"><a href="products">Sản phẩm</a></li>
                                        <li class="breadcrumb-item active">Chỉnh sửa sản phẩm</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Chỉnh sửa sản phẩm</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <!-- Edit Form -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <!-- Display messages -->
                                    <c:if test="${not empty sessionScope.successMessage}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            ${sessionScope.successMessage}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                        </div>
                                        <c:remove var="successMessage" scope="session"/>
                                    </c:if>
                                    
                                    <c:if test="${not empty sessionScope.errorMessage}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            ${sessionScope.errorMessage}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                        </div>
                                        <c:remove var="errorMessage" scope="session"/>
                                    </c:if>
                                    
                                    <c:if test="${not empty errorMessage}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            ${errorMessage}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                        </div>
                                    </c:if>

                                    <!-- Edit Product Form -->
                                    <form action="editProduct" method="post">
                                        <input type="hidden" name="action" value="updateProduct">
                                        <input type="hidden" name="productId" value="${product.productID}">
                                        
                                        <!-- Basic Product Information -->
                                        <h5 class="mb-3">Thông tin cơ bản</h5>
                                        
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Tên sản phẩm *</label>
                                            <input id="name" name="name" type="text" class="form-control" value="${product.name}" required/>
                                        </div>

                                        <div class="mb-3">
                                            <label for="description" class="form-label">Mô tả</label>
                                            <textarea id="description" name="description" class="form-control" rows="4">${product.description}</textarea>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="price" class="form-label">Giá (VND) *</label>
                                                    <input id="price" name="price" type="text" class="form-control" value="<fmt:formatNumber value='${product.price}' pattern='#,###' />" required/>
                                                    <div class="form-text">Giá hiện tại: <fmt:formatNumber value="${product.price}" pattern="#,###"/> VND</div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="discount" class="form-label">Giảm giá (VND)</label>
                                                    <input id="discount" name="discount" type="text" class="form-control" value="<fmt:formatNumber value='${product.discount}' pattern='#,###' />"/>
                                                    <div class="form-text">Giảm giá hiện tại: <fmt:formatNumber value="${product.discount}" pattern="#,###"/> VND</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="quantity" class="form-label">Số lượng *</label>
                                            <input id="quantity" name="quantity" type="number" min="0" class="form-control" value="${product.quantity}" required/>
                                        </div>
                                        
                                        <div class="text-center mb-4">
                                            <button type="submit" class="btn btn-success">
                                                <i class="mdi mdi-content-save"></i> Cập nhật sản phẩm
                                            </button>
                                            <a href="products" class="btn btn-secondary ms-2">
                                                <i class="mdi mdi-arrow-left"></i> Quay lại
                                            </a>
                                        </div>
                                    </form>

                                    <!-- ProductDetails Management Section -->
                                    <div class="mt-5">
                                        <h5 class="mb-3">Quản lý chi tiết sản phẩm</h5>
                                        
                                        <!-- Add New ProductDetail Button -->
                                        <button type="button" class="btn btn-success mb-3" onclick="addNewDetail()">
                                            <i class="mdi mdi-plus"></i> Thêm chi tiết mới
                                        </button>
                                        
                                        <!-- Current ProductDetails Table -->
                                        <c:if test="${not empty productDetails}">
                                            <div class="table-responsive mb-4">
                                                <table class="table table-striped table-bordered">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Màu sắc</th>
                                                            <th>Dung lượng</th>
                                                            <th>Màn hình</th>
                                                            <th>OS</th>
                                                            <th>Camera chính</th>
                                                            <th>Camera selfie</th>
                                                            <th>Chip</th>
                                                            <th>RAM</th>
                                                            <th>SIM</th>
                                                            <th>Pin</th>
                                                            <th>Sạc</th>
                                                            <th>Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="detail" items="${productDetails}">
                                                            <tr>
                                                                <td>${detail.ID}</td>
                                                                <td><span class="badge bg-primary">${detail.color}</span></td>
                                                                <td><span class="badge bg-info">${detail.storage}</span></td>
                                                                <td>${detail.screen}</td>
                                                                <td>${detail.os}</td>
                                                                <td>${detail.mainCamera}</td>
                                                                <td>${detail.selfieCamera}</td>
                                                                <td>${detail.chip}</td>
                                                                <td>${detail.ram}</td>
                                                                <td>${detail.sim}</td>
                                                                <td>${detail.battery}</td>
                                                                <td>${detail.charger}</td>
                                                                <td>
                                                                    <button type="button" class="btn btn-sm btn-warning" onclick="editDetail('${detail.ID}')">
                                                                        <i class="mdi mdi-pencil"></i>
                                                                    </button>
                                                                    <button type="button" class="btn btn-sm btn-danger" onclick="deleteDetail('${detail.ID}')">
                                                                        <i class="mdi mdi-delete"></i>
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:if>
                                        
                                        <c:if test="${empty productDetails}">
                                            <div class="alert alert-info">
                                                <i class="mdi mdi-information"></i>
                                                Chưa có chi tiết sản phẩm nào. Hãy thêm chi tiết mới.
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->
                </div>
                <!-- end container -->
            </div>
            <!-- end content -->

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

    <!-- ProductDetail Modal -->
    <div class="modal fade" id="productDetailModal" tabindex="-1" aria-labelledby="productDetailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="productDetailModalLabel">Thêm/Sửa Chi Tiết Sản Phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="productDetailForm">
                        <input type="hidden" id="detailId" name="detailId">
                        <input type="hidden" id="productId" name="productId" value="${product.productID}">
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="color" class="form-label">Màu sắc *</label>
                                    <input type="text" class="form-control" id="color" name="color" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="storage" class="form-label">Dung lượng *</label>
                                    <input type="text" class="form-control" id="storage" name="storage" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="screen" class="form-label">Màn hình</label>
                                    <input type="text" class="form-control" id="screen" name="screen">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="os" class="form-label">Hệ điều hành</label>
                                    <input type="text" class="form-control" id="os" name="os">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="mainCamera" class="form-label">Camera chính</label>
                                    <input type="text" class="form-control" id="mainCamera" name="mainCamera">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="selfieCamera" class="form-label">Camera selfie</label>
                                    <input type="text" class="form-control" id="selfieCamera" name="selfieCamera">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="chip" class="form-label">Chip</label>
                                    <input type="text" class="form-control" id="chip" name="chip">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="ram" class="form-label">RAM</label>
                                    <input type="text" class="form-control" id="ram" name="ram">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="sim" class="form-label">SIM</label>
                                    <input type="text" class="form-control" id="sim" name="sim">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="battery" class="form-label">Pin</label>
                                    <input type="text" class="form-control" id="battery" name="battery">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="charger" class="form-label">Sạc</label>
                                    <input type="text" class="form-control" id="charger" name="charger">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary" id="saveDetailBtn">Lưu</button>
                </div>
            </div>
        </div>
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
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Sáng</h5>
                            </div>

                            <div class="col-4">
                                <div class="form-check card-radio">
                                    <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-dark" value="dark">
                                    <label class="form-check-label p-0 avatar-md w-100 bg-black" for="layout-color-dark">
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Tối</h5>
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

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>

    <script>
        // ========== Number Formatting Functions ==========
        
        // Format number as currency (add thousand separators)
        function formatCurrency(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        
        // Remove formatting to get plain number
        function unformatCurrency(formatted) {
            return formatted.replace(/,/g, '');
        }
        
        // Format input fields on load
        document.addEventListener('DOMContentLoaded', function() {
            const priceInput = document.getElementById('price');
            const discountInput = document.getElementById('discount');
            
            // Add event listeners for formatting
            priceInput.addEventListener('input', function(e) {
                let value = unformatCurrency(e.target.value);
                if (value && !isNaN(value)) {
                    e.target.value = formatCurrency(value);
                }
            });
            
            discountInput.addEventListener('input', function(e) {
                let value = unformatCurrency(e.target.value);
                if (value && !isNaN(value)) {
                    e.target.value = formatCurrency(value);
                }
            });
            
            // Before form submit, convert back to plain numbers
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                priceInput.value = unformatCurrency(priceInput.value);
                discountInput.value = unformatCurrency(discountInput.value);
            });
        });

        // ========== ProductDetail CRUD Functions ==========
        
        // Add new ProductDetail
        function addNewDetail() {
            // Reset form
            document.getElementById('productDetailForm').reset();
            document.getElementById('detailId').value = '';
            document.getElementById('productDetailModalLabel').textContent = 'Thêm Chi Tiết Sản Phẩm';
            
            // Show modal
            var modal = new bootstrap.Modal(document.getElementById('productDetailModal'));
            modal.show();
        }

        // Edit ProductDetail
        function editDetail(detailId) {
            // Fetch detail data via AJAX
            fetch('editProductDetail?action=get&detailId=' + detailId)
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Populate form
                    document.getElementById('detailId').value = data.data.ID;
                    document.getElementById('color').value = data.data.color || '';
                    document.getElementById('storage').value = data.data.storage || '';
                    document.getElementById('screen').value = data.data.screen || '';
                    document.getElementById('os').value = data.data.os || '';
                    document.getElementById('mainCamera').value = data.data.mainCamera || '';
                    document.getElementById('selfieCamera').value = data.data.selfieCamera || '';
                    document.getElementById('chip').value = data.data.chip || '';
                    document.getElementById('ram').value = data.data.ram || '';
                    document.getElementById('sim').value = data.data.sim || '';
                    document.getElementById('battery').value = data.data.battery || '';
                    document.getElementById('charger').value = data.data.charger || '';
                    
                    document.getElementById('productDetailModalLabel').textContent = 'Sửa Chi Tiết Sản Phẩm';
                    
                    // Show modal
                    var modal = new bootstrap.Modal(document.getElementById('productDetailModal'));
                    modal.show();
                } else {
                    alert('Lỗi khi tải dữ liệu: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Lỗi khi tải dữ liệu chi tiết sản phẩm');
            });
        }

        // Delete ProductDetail
        function deleteDetail(detailId) {
            console.log('deleteDetail called with ID:', detailId);
            
            if (confirm('Bạn có chắc chắn muốn xóa chi tiết sản phẩm này?')) {
                // Create form data
                const formData = new FormData();
                formData.append('action', 'delete');
                formData.append('detailId', detailId);
                
                console.log('Delete detailId:', detailId);
                console.log('Delete FormData contents:');
                for (let [key, value] of formData.entries()) {
                    console.log(key + ': ' + value);
                }

                fetch('editProductDetail', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: new URLSearchParams(formData).toString()
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Xóa thành công!');
                        location.reload(); // Refresh to update table
                    } else {
                        alert('Lỗi khi xóa: ' + data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Lỗi khi xóa chi tiết sản phẩm');
                });
            }
        }

        // Save ProductDetail (Add/Update)
        document.getElementById('saveDetailBtn').addEventListener('click', function() {
            const form = document.getElementById('productDetailForm');
            
            // Validate required fields
            const color = document.getElementById('color').value.trim();
            const storage = document.getElementById('storage').value.trim();
            
            if (!color || !storage) {
                alert('Vui lòng nhập đầy đủ màu sắc và dung lượng!');
                return;
            }
            
            const formData = new FormData();
            
            // Add all form fields manually
            formData.append('productId', document.getElementById('productId').value);
            formData.append('color', document.getElementById('color').value);
            formData.append('storage', document.getElementById('storage').value);
            formData.append('screen', document.getElementById('screen').value);
            formData.append('os', document.getElementById('os').value);
            formData.append('mainCamera', document.getElementById('mainCamera').value);
            formData.append('selfieCamera', document.getElementById('selfieCamera').value);
            formData.append('chip', document.getElementById('chip').value);
            formData.append('ram', document.getElementById('ram').value);
            formData.append('sim', document.getElementById('sim').value);
            formData.append('battery', document.getElementById('battery').value);
            formData.append('charger', document.getElementById('charger').value);
            
            // Determine action based on whether detailId exists
            const detailId = document.getElementById('detailId').value;
            console.log('detailId:', detailId);
            
            if (detailId && detailId.trim() !== '') {
                formData.append('action', 'update');
                formData.append('detailId', detailId);
                console.log('Action: update');
            } else {
                formData.append('action', 'add');
                console.log('Action: add');
            }
            
            // Debug: log all form data
            console.log('FormData contents:');
            for (let [key, value] of formData.entries()) {
                console.log(key + ': ' + value);
            }

            fetch('editProductDetail', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams(formData).toString()
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Lưu thành công!');
                    
                    // Hide modal
                    var modal = bootstrap.Modal.getInstance(document.getElementById('productDetailModal'));
                    modal.hide();
                    
                    // Refresh page to update table
                    location.reload();
                } else {
                    alert('Lỗi khi lưu: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Lỗi khi lưu chi tiết sản phẩm');
            });
        });
    </script>

</body>
</html>
