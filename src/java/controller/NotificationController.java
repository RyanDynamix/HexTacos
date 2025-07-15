package controller;

import dal.NotificationDAO;
import model.Notification;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class NotificationController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(NotificationController.class.getName());
    private NotificationDAO notificationDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        notificationDAO = new NotificationDAO();
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     * Load notifications for display
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "GET request received to NotificationController");
        
        try {
            String action = request.getParameter("action");
            
            if ("edit".equals(action)) {
                handleEditNotification(request, response);
            } else if ("delete".equals(action)) {
                handleDeleteNotification(request, response);
            } else if ("api".equals(action)) {
                handleApiRequest(request, response);
            } else {
                // Default: show all notifications
                handleListNotifications(request, response);
            }
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doGet: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "Error loading notifications: " + e.getMessage());
            request.getRequestDispatcher("/Admin/notifications.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * Process notification creation/update
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "POST request received to NotificationController");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        try {
            String action = request.getParameter("action");
            
            if ("add".equals(action)) {
                handleAddNotification(request, response);
            } else if ("update".equals(action)) {
                handleUpdateNotification(request, response);
            } else {
                response.sendRedirect("notifications");
            }
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doPost: " + e.getMessage(), e);
            request.getSession().setAttribute("errorMessage", "Error processing notification: " + e.getMessage());
            response.sendRedirect("notifications");
        }
    }
    
    /**
     * Handle listing all notifications
     */
    private void handleListNotifications(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Notification> notifications = notificationDAO.getAllNotifications();
            request.setAttribute("notifications", notifications);
            
            LOGGER.log(Level.INFO, "Found {0} notifications", notifications.size());
            
            request.getRequestDispatcher("/Admin/notifications.jsp").forward(request, response);
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error listing notifications: " + e.getMessage(), e);
            throw e;
        }
    }
    
    /**
     * Handle editing notification
     */
    private void handleEditNotification(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String notificationIdStr = request.getParameter("id");
            if (notificationIdStr == null || notificationIdStr.isEmpty()) {
                request.getSession().setAttribute("errorMessage", "Notification ID is required");
                response.sendRedirect("notifications");
                return;
            }
            
            int notificationId = Integer.parseInt(notificationIdStr);
            Notification notification = notificationDAO.getNotificationById(notificationId);
            
            if (notification == null) {
                request.getSession().setAttribute("errorMessage", "Notification not found");
                response.sendRedirect("notifications");
                return;
            }
            
            request.setAttribute("notification", notification);
            request.setAttribute("isEdit", true);
            
            // Also get all notifications for the list
            List<Notification> notifications = notificationDAO.getAllNotifications();
            request.setAttribute("notifications", notifications);
            
            request.getRequestDispatcher("/Admin/notifications.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid notification ID format: " + e.getMessage());
            request.getSession().setAttribute("errorMessage", "Invalid notification ID");
            response.sendRedirect("notifications");
        }
    }
    
    /**
     * Handle deleting notification
     */
    private void handleDeleteNotification(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String notificationIdStr = request.getParameter("id");
            if (notificationIdStr == null || notificationIdStr.isEmpty()) {
                request.getSession().setAttribute("errorMessage", "Notification ID is required");
                response.sendRedirect("notifications");
                return;
            }
            
            int notificationId = Integer.parseInt(notificationIdStr);
            boolean success = notificationDAO.deleteNotification(notificationId);
            
            if (success) {
                request.getSession().setAttribute("successMessage", "Notification deleted successfully");
                LOGGER.log(Level.INFO, "Successfully deleted notification ID: {0}", notificationId);
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to delete notification");
                LOGGER.log(Level.WARNING, "Failed to delete notification ID: {0}", notificationId);
            }
            
            response.sendRedirect("notifications");
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid notification ID format: " + e.getMessage());
            request.getSession().setAttribute("errorMessage", "Invalid notification ID");
            response.sendRedirect("notifications");
        }
    }
    
    /**
     * Handle adding new notification
     */
    private void handleAddNotification(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get form data
            String recipientType = request.getParameter("recipientType");
            String title = request.getParameter("title");
            String message = request.getParameter("message");
            
            // Validate required fields
            if (recipientType == null || recipientType.trim().isEmpty() ||
                title == null || title.trim().isEmpty() ||
                message == null || message.trim().isEmpty()) {
                request.getSession().setAttribute("errorMessage", "All fields are required");
                response.sendRedirect("notifications");
                return;
            }
            
            // Create notification object
            Notification notification = new Notification(recipientType.trim(), title.trim(), message.trim());
            
            // Save to database
            boolean success = notificationDAO.insertNotification(notification);
            
            if (success) {
                request.getSession().setAttribute("successMessage", "Notification added successfully");
                LOGGER.log(Level.INFO, "Successfully added notification: {0}", title);
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to add notification");
                LOGGER.log(Level.WARNING, "Failed to add notification: {0}", title);
            }
            
            response.sendRedirect("notifications");
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error adding notification: " + e.getMessage(), e);
            request.getSession().setAttribute("errorMessage", "Error adding notification: " + e.getMessage());
            response.sendRedirect("notifications");
        }
    }
    
    /**
     * Handle updating notification
     */
    private void handleUpdateNotification(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get notification ID
            String notificationIdStr = request.getParameter("notificationId");
            LOGGER.log(Level.INFO, "Update notification - notificationId parameter: {0}", notificationIdStr);
            
            if (notificationIdStr == null || notificationIdStr.isEmpty()) {
                request.getSession().setAttribute("errorMessage", "Notification ID is required");
                response.sendRedirect("notifications");
                return;
            }
            
            int notificationId = Integer.parseInt(notificationIdStr);
            LOGGER.log(Level.INFO, "Updating notification ID: {0}", notificationId);
            
            // Get form data
            String recipientType = request.getParameter("recipientType");
            String title = request.getParameter("title");
            String message = request.getParameter("message");
            
            LOGGER.log(Level.INFO, "Update data - recipientType: {0}, title: {1}, message length: {2}", 
                      new Object[]{recipientType, title, message != null ? message.length() : 0});
            
            // Validate required fields
            if (recipientType == null || recipientType.trim().isEmpty() ||
                title == null || title.trim().isEmpty() ||
                message == null || message.trim().isEmpty()) {
                request.getSession().setAttribute("errorMessage", "All fields are required");
                response.sendRedirect("notifications?action=edit&id=" + notificationId);
                return;
            }
            
            // Create notification object
            Notification notification = new Notification();
            notification.setNotificationID(notificationId);
            notification.setRecipientType(recipientType.trim());
            notification.setTitle(title.trim());
            notification.setMessage(message.trim());
            
            // Update in database
            boolean success = notificationDAO.updateNotification(notification);
            
            if (success) {
                request.getSession().setAttribute("successMessage", "Notification updated successfully");
                LOGGER.log(Level.INFO, "Successfully updated notification ID: {0}", notificationId);
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to update notification");
                LOGGER.log(Level.WARNING, "Failed to update notification ID: {0}", notificationId);
            }
            
            response.sendRedirect("notifications");
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid notification ID format: " + e.getMessage());
            request.getSession().setAttribute("errorMessage", "Invalid notification ID");
            response.sendRedirect("notifications");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating notification: " + e.getMessage(), e);
            request.getSession().setAttribute("errorMessage", "Error updating notification: " + e.getMessage());
            response.sendRedirect("notifications");
        }
    }

    /**
     * Handle API request for notifications
     */
    private void handleApiRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            String recipientType = request.getParameter("recipientType");
            
            if (recipientType == null || recipientType.isEmpty()) {
                response.getWriter().write("{\"success\": false, \"message\": \"Recipient type is required\"}");
                return;
            }
            
            List<Notification> notifications;
            
            if (recipientType.contains(",")) {
                // Handle multiple recipient types (for admin)
                String[] types = recipientType.split(",");
                notifications = new ArrayList<>();
                for (String type : types) {
                    notifications.addAll(notificationDAO.getNotificationsByRecipientType(type.trim()));
                }
            } else {
                // Handle single recipient type
                notifications = notificationDAO.getNotificationsByRecipientType(recipientType);
            }
            
            // Convert to JSON
            StringBuilder json = new StringBuilder();
            json.append("{\"success\": true, \"notifications\": [");
            
            for (int i = 0; i < notifications.size(); i++) {
                Notification notification = notifications.get(i);
                if (i > 0) json.append(",");
                
                json.append("{")
                    .append("\"notificationID\": ").append(notification.getNotificationID()).append(",")
                    .append("\"title\": \"").append(escapeJson(notification.getTitle())).append("\",")
                    .append("\"message\": \"").append(escapeJson(notification.getMessage())).append("\",")
                    .append("\"recipientType\": \"").append(notification.getRecipientType()).append("\",")
                    .append("\"createdAt\": \"").append(notification.getCreatedAt().toString()).append("\"")
                    .append("}");
            }
            
            json.append("]}");
            
            response.getWriter().write(json.toString());
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in API request: " + e.getMessage(), e);
            response.getWriter().write("{\"success\": false, \"message\": \"Error loading notifications\"}");
        }
    }
    
    /**
     * Escape JSON special characters
     */
    private String escapeJson(String str) {
        if (str == null) return "";
        return str.replace("\\", "\\\\")
                  .replace("\"", "\\\"")
                  .replace("\b", "\\b")
                  .replace("\f", "\\f")
                  .replace("\n", "\\n")
                  .replace("\r", "\\r")
                  .replace("\t", "\\t");
    }

    @Override
    public String getServletInfo() {
        return "Notification Management Controller";
    }
}
