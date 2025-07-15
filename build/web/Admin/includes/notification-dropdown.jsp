<%-- Admin Notification Dropdown Include --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Notification Dropdown -->
<li class="dropdown">
    <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
        <i class="ri-notification-line font-22"></i>
        <span class="badge bg-danger rounded-circle" id="adminNotificationCount" style="font-size: 10px; position: absolute; top: 8px; right: 8px;">0</span>
    </a>
    <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg py-0" style="width: 350px;">
        <div class="dropdown-header">
            <h6 class="m-0">Thông Báo</h6>
        </div>
        <div style="max-height: 400px; overflow-y: auto;" id="adminNotificationList">
            <div class="text-center p-3">
                <small class="text-muted">Đang Tải Thông Báo...</small>
            </div>
        </div>
        <div class="dropdown-divider"></div>
        <a href="notifications" class="dropdown-item text-center text-primary">
            Xem Tất Cả
        </a>
    </div>
</li>
