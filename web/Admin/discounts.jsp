<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Quản lý mã giảm giá</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- third party css -->
    <link href="assets/vendor/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendor/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendor/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/vendor/datatables.net-select-bs5/css/select.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <!-- third party css end -->

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
                            </form>                            </div>
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
                            <form action="index" method="POST">
                                <a class="dropdown-item">
                                    <button value="submit" id="loginBtn" class="btn btn-sm m-1 bg-primary text-white rounded-5 px-sm-3 px-2">
                                        <i class="mdi mdi-logout me-1"></i>
                                        <span>Logout</span>
                                    </button>
                                </a>
                            </form>
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
                                    <a href="customers">Tài khoản</a>
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
                            <a class="btn btn-outline-primary" href="#" type="button">Quyền riềng tư & Bảo mật</a>

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

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="index">Trang chủ</a></li>
                                        <li class="breadcrumb-item active">Mã giảm giá</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Mã giảm giá</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-sm-5">
                                            <a href="adminDiscount?action=add" class="btn btn-danger mb-2"><i class="mdi mdi-plus-circle me-2"></i> Thêm mã giảm giá</a>
                                        </div>
                                        <div class="col-sm-7">
                                            <div class="text-sm-end">
                                                <button type="button" class="btn btn-success mb-2 me-1"><i class="mdi mdi-cog-outline"></i></button>
                                                <button type="button" class="btn btn-light mb-2 me-1">Import</button>
                                                <button type="button" class="btn btn-light mb-2">Export</button>
                                            </div>
                                        </div><!-- end col-->
                                    </div>

                                    <!-- Display success or error message if any -->
                                    <c:if test="${not empty successMessage}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            ${successMessage}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty errorMessage}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            ${errorMessage}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>

                                    <div class="table-responsive">
                                        <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable">
                                            <thead class="table-light">
                                                <tr>
                                                    <th class="all">Mã</th>
                                                    <th>Tên</th>
                                                    <th>Loại</th>
                                                    <th>Giá trị</th>
                                                    <th>Đơn tối thiểu</th>
                                                    <th>Số lượng</th>
                                                    <th>Ngày bắt đầu</th>
                                                    <th>Ngày kết thúc</th>
                                                    <th>Trạng thái</th>
                                                    <th>Ngày tạo</th>
                                                    <th style="width: 85px;">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="discount" items="${discounts}">
                                                    <tr>
                                                        <td>${discount.code}</td>
                                                        <td>${discount.name}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${discount.type eq 'percentage'}">
                                                                    <span class="badge bg-info">Phần trăm</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-primary">Cố định</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${discount.valueString}</td>
                                                        <td>${discount.minOrderValueString}</td>
                                                        <td>${discount.quantity}</td>
                                                        <td>${discount.startDateString}</td>
                                                        <td>${discount.endDateString}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${discount.status}">
                                                                    <span class="badge bg-success">Active</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-danger">InActive</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${discount.createdAtString}</td>
                                                        <td class="table-action">
                                                            <a href="adminDiscount?action=edit&id=${discount.discountID}" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>
                                                            <c:if test="${discount.status}">
                                                                <a href="javascript:void(0);" class="action-icon" onclick="confirmDeactivate(${discount.discountID})"> <i class="mdi mdi-delete"></i></a>
                                                            </c:if>
                                                            <c:if test="${!discount.status}">
                                                                <a href="javascript:void(0);" class="action-icon" onclick="confirmActivate(${discount.discountID})"> <i class="mdi mdi-refresh"></i></a>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                </div> <!-- container -->

            </div> <!-- content -->

            <!-- Footer Start -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <script>document.write(new Date().getFullYear())</script> 
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

    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- third party js -->
    <script src="assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="assets/vendor/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
    <script src="assets/vendor/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="assets/vendor/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
    <script src="assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="assets/vendor/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script>
    <script src="assets/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="assets/vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="assets/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="assets/vendor/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="assets/vendor/datatables.net-select/js/dataTables.select.min.js"></script>
    <!-- third party js ends -->

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>

    <!-- Datatables init -->
    <script>
        $(document).ready(function() {
            $('#products-datatable').DataTable({
                responsive: true,
                language: {
                    paginate: {
                        previous: "<i class='mdi mdi-chevron-left'>",
                        next: "<i class='mdi mdi-chevron-right'>"
                    },
                    info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                    search: "Tìm kiếm:",
                    lengthMenu: "Hiển thị _MENU_ mục",
                    emptyTable: "Không có dữ liệu",
                    zeroRecords: "Không tìm thấy kết quả"
                },
                drawCallback: function() {
                    $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
                    $('.dataTables_length').addClass('mb-2');
                }
            });
        });
        
        function confirmDeactivate(id) {
            if (confirm('Bạn có chắc chắn muốn hủy kích hoạt mã giảm giá này?')) {
                window.location.href = 'adminDiscount?action=deactivate&id=' + id;
            }
        }
        
        function confirmActivate(id) {
            if (confirm('Bạn có chắc chắn muốn kích hoạt lại mã giảm giá này?')) {
                window.location.href = 'adminDiscount?action=activate&id=' + id;
            }
        }
    </script>
    
    <%@ include file="includes/notification-js.jsp" %>

</body>

</html> 