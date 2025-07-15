<%-- Admin Notification JavaScript Include --%>
<script>
// Function to load admin notifications
function loadAdminNotifications() {
    // Check if elements exist
    const listElement = document.getElementById('adminNotificationList');
    const countElement = document.getElementById('adminNotificationCount');
    
    if (!listElement || !countElement) {
        return; // Elements not found, skip loading
    }
    
    // Show loading
    listElement.innerHTML = '<div class="text-center p-3"><small class="text-muted">Đang tải...</small></div>';
    
    // AJAX call with XMLHttpRequest
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'notifications?action=api&recipientType=Employee', true);
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                try {
                    const data = JSON.parse(xhr.responseText);
                    
                    if (data.success && data.notifications) {
                        const notifications = data.notifications;
                        
                        // Update count
                        countElement.textContent = notifications.length;
                        
                        if (notifications.length === 0) {
                            listElement.innerHTML = '<div class="text-center p-3"><small class="text-muted">Không có thông báo mới</small></div>';
                        } else {
                            // Clear existing content
                            listElement.innerHTML = '';
                            
                            notifications.forEach((notification) => {
                                const message = notification.Message || notification.message || 'No message';
                                
                                // Create DOM element directly
                                const div = document.createElement('div');
                                div.className = 'dropdown-item';
                                div.style.padding = '10px 15px';
                                div.style.borderBottom = '1px solid #eee';
                                div.style.whiteSpace = 'normal';
                                div.style.cursor = 'pointer';
                                div.textContent = message;
                                
                                listElement.appendChild(div);
                            });
                        }
                    } else {
                        listElement.innerHTML = '<div class="text-center p-3"><small class="text-muted">Lỗi: Dữ liệu không hợp lệ</small></div>';
                        countElement.textContent = '0';
                    }
                } catch (e) {
                    listElement.innerHTML = '<div class="text-center p-3"><small class="text-muted">Lỗi: Không thể parse JSON</small></div>';
                    countElement.textContent = '0';
                }
            } else {
                listElement.innerHTML = '<div class="text-center p-3"><small class="text-muted">Lỗi: HTTP ' + xhr.status + '</small></div>';
                countElement.textContent = '0';
            }
        }
    };
    
    xhr.onerror = function() {
        listElement.innerHTML = '<div class="text-center p-3"><small class="text-muted">Lỗi mạng</small></div>';
        countElement.textContent = '0';
    };
    
    xhr.send();
}

// Auto-load notifications when page loads
document.addEventListener("DOMContentLoaded", function() {
    // Add small delay to ensure DOM is fully loaded
    setTimeout(loadAdminNotifications, 500);
});
</script>
