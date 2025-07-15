<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Quản lý thông báo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- Theme Config Js -->
    <script src="assets/js/hyper-config.js"></script>

    <!-- App css -->
    <link href="assets/css/app-saas.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    
    <style>
        .notification-card {
            transition: transform 0.2s ease-in-out;
        }
        
        .notification-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }
        
        .recipient-badge {
            font-size: 0.8em;
        }
        
        .message-preview {
            max-height: 60px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            line-clamp: 3;
            -webkit-box-orient: vertical;
        }
    </style>
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
                                        <li class="breadcrumb-item active">Quản lý thông báo</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Quản lý thông báo</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    
                                    <!-- Success/Error Messages -->
                                    <c:if test="${not empty sessionScope.successMessage}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <i class="mdi mdi-check-all me-2"></i>
                                            ${sessionScope.successMessage}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                        <c:remove var="successMessage" scope="session"/>
                                    </c:if>

                                    <c:if test="${not empty sessionScope.errorMessage}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <i class="mdi mdi-block-helper me-2"></i>
                                            ${sessionScope.errorMessage}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                        <c:remove var="errorMessage" scope="session"/>
                                    </c:if>

                                    <!-- Add Notification Button -->
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <div class="text-sm-start">
                                                <button type="button" class="btn btn-success mb-2 me-1" data-bs-toggle="modal" data-bs-target="#notificationModal" onclick="openAddModal()">
                                                    <i class="mdi mdi-plus-circle me-1"></i> Thêm thông báo
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="text-sm-end">
                                                <div class="text-sm-end">
                                                    <div class="d-flex justify-content-end">
                                                        <div class="dropdown">
                                                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                                                <i class="mdi mdi-dots-vertical"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-end">
                                                                <a href="javascript:void(0);" class="dropdown-item">Refresh</a>
                                                                <a href="javascript:void(0);" class="dropdown-item">Export</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Notifications List -->
                                    <c:choose>
                                        <c:when test="${empty notifications}">
                                            <div class="text-center py-5">
                                                <img src="assets/images/svg/file-searching.svg" height="96" alt="File not found Image">
                                                <h4 class="mt-3">Chưa có thông báo nào</h4>
                                                <p class="text-muted">Hãy thêm thông báo đầu tiên của bạn.</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="table-responsive">
                                                <table class="table table-centered table-nowrap table-striped">
                                                    <thead class="table-light">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Tiêu đề</th>
                                                            <th>Đối tượng</th>
                                                            <th>Nội dung</th>
                                                            <th>Ngày tạo</th>
                                                            <th style="width: 125px;">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="notification" items="${notifications}">
                                                            <tr>
                                                                <td>${notification.notificationID}</td>
                                                                <td>
                                                                    <h5 class="font-14 my-1">${notification.title}</h5>
                                                                </td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${notification.recipientType == 'Customer'}">
                                                                            <span class="badge badge-info-lighten">Khách hàng</span>
                                                                        </c:when>
                                                                        <c:when test="${notification.recipientType == 'Employee'}">
                                                                            <span class="badge badge-warning-lighten">Nhân viên</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="badge badge-success-lighten">Tất cả</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td>
                                                                    <div class="message-preview" style="max-width: 300px;">
                                                                        ${notification.message}
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${notification.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                                                </td>
                                                                <td>
                                                                    <a href="javascript:void(0);" class="action-icon" onclick="openEditModal('${notification.notificationID}', this)"> 
                                                                        <i class="mdi mdi-square-edit-outline"></i>
                                                                    </a>
                                                                    <a href="javascript:void(0);" class="action-icon" onclick="deleteNotification('${notification.notificationID}')"> 
                                                                        <i class="mdi mdi-delete"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div> <!-- end card body-->
                            </div> <!-- end card -->
                        </div><!-- end col-->
                    </div>
                    <!-- end row-->

                </div> <!-- container -->

            </div> <!-- content -->

            <!-- Footer Start -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            2025 
                        </div>
                        <div class="col-md-6">
                            <div class="text-md-end footer-links d-none d-md-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
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

    <!-- Notification Modal -->
    <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="notificationModalLabel">Thêm thông báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="notificationForm" action="notifications" method="post">
                    <div class="modal-body">
                        <input type="hidden" id="action" name="action" value="add">
                        <input type="hidden" id="notificationId" name="notificationId">
                        
                        <div class="mb-3">
                            <label for="recipientType" class="form-label">Đối tượng nhận <span class="text-danger">*</span></label>
                            <select class="form-select" id="recipientType" name="recipientType" required>
                                <option value="">-- Chọn đối tượng --</option>
                                <option value="Customer">Khách hàng</option>
                                <option value="Employee">Nhân viên</option>
                                <option value="All">Tất cả</option>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label for="title" class="form-label">Tiêu đề <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="title" name="title" maxlength="200" required>
                            <div class="form-text">Tối đa 200 ký tự</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="message" class="form-label">Nội dung <span class="text-danger">*</span></label>
                            <textarea class="form-control" id="message" name="message" rows="6" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-2"></i>Lưu
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>
    
    <script>
        // Open add modal
        function openAddModal() {
            document.getElementById('notificationModalLabel').textContent = 'Thêm thông báo';
            document.getElementById('action').value = 'add';
            document.getElementById('notificationId').value = '';
            document.getElementById('notificationForm').reset();
        }
        
        // Open edit modal  
        function openEditModal(notificationId, element) {
            console.log('Edit notification ID:', notificationId);
            
            // Get the table row from the clicked element
            const row = element.closest('tr');
            
            console.log('Found row:', row);
            
            if (!row) {
                console.error('Could not find table row');
                return;
            }
            
            // Get data from table columns
            const title = row.cells[1].querySelector('h5').textContent.trim();
            const recipientBadge = row.cells[2].querySelector('.badge').textContent.trim();
            const message = row.cells[3].querySelector('.message-preview').textContent.trim();
            
            console.log('Title:', title);
            console.log('Recipient badge:', recipientBadge);
            console.log('Message:', message);
            
            let recipientType = '';
            if (recipientBadge === 'Khách hàng') recipientType = 'Customer';
            else if (recipientBadge === 'Nhân viên') recipientType = 'Employee';
            else recipientType = 'All';
            
            console.log('Recipient type:', recipientType);
            
            // Populate modal immediately
            document.getElementById('notificationModalLabel').textContent = 'Sửa thông báo';
            document.getElementById('action').value = 'update';
            document.getElementById('notificationId').value = notificationId;
            document.getElementById('recipientType').value = recipientType;
            document.getElementById('title').value = title;
            document.getElementById('message').value = message;
            
            console.log('Modal populated, now showing...');
            
            // Show modal using Bootstrap Modal class
            var modal = new bootstrap.Modal(document.getElementById('notificationModal'));
            modal.show();
        }
        
        // Delete notification
        function deleteNotification(notificationId) {
            if (confirm('Bạn có chắc chắn muốn xóa thông báo này?')) {
                window.location.href = 'notifications?action=delete&id=' + notificationId;
            }
        }
        
        // Auto-dismiss alerts after 5 seconds
        setTimeout(function() {
            $('.alert').fadeOut('slow');
        }, 5000);
    </script>
    
    <%@ include file="includes/notification-js.jsp" %>
</body>
</html>
