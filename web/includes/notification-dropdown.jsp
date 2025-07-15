<%-- Customer Notification Dropdown Include --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Customer Notification Dropdown -->
<li class="nav-item iconChange dropdown me-4 pt-2">
    <a href="#" class="nav-link text-center p-0" data-bs-toggle="dropdown" aria-expanded="false">
        <div class="d-flex align-items-center overflow-hidden changeWidth mx-auto">
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
