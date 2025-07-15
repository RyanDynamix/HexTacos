package dal;

import model.Notification;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class NotificationDAO extends DBContext {
    
    private static final Logger LOGGER = Logger.getLogger(NotificationDAO.class.getName());
    
    /**
     * Get all notifications
     */
    public List<Notification> getAllNotifications() {
        List<Notification> notifications = new ArrayList<>();
        String sql = "SELECT NotificationID, RecipientType, Title, Message, CreatedAt FROM Notifications ORDER BY CreatedAt DESC";
        connection = getConnection();
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                Notification notification = new Notification();
                notification.setNotificationID(resultSet.getInt("NotificationID"));
                notification.setRecipientType(resultSet.getString("RecipientType"));
                notification.setTitle(resultSet.getString("Title"));
                notification.setMessage(resultSet.getString("Message"));
                notification.setCreatedAt(resultSet.getTimestamp("CreatedAt"));
                notifications.add(notification);
            }
            statement.close();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all notifications: " + e.getMessage(), e);
        }
        
        return notifications;
    }
    
    /**
     * Get notification by ID
     */
    public Notification getNotificationById(int notificationId) {
        Notification notification = null;
        String sql = "SELECT NotificationID, RecipientType, Title, Message, CreatedAt FROM Notifications WHERE NotificationID = ?";
        connection = getConnection();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, notificationId);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    notification = new Notification();
                    notification.setNotificationID(resultSet.getInt("NotificationID"));
                    notification.setRecipientType(resultSet.getString("RecipientType"));
                    notification.setTitle(resultSet.getString("Title"));
                    notification.setMessage(resultSet.getString("Message"));
                    notification.setCreatedAt(resultSet.getTimestamp("CreatedAt"));
                }
            }
            statement.close();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting notification by ID: " + e.getMessage(), e);
        }
        
        return notification;
    }
    
    /**
     * Insert new notification
     */
    public boolean insertNotification(Notification notification) {
        String sql = "INSERT INTO Notifications (RecipientType, Title, Message) VALUES (?, ?, ?)";
        connection = getConnection();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, notification.getRecipientType());
            statement.setString(2, notification.getTitle());
            statement.setString(3, notification.getMessage());
            
            int rowsAffected = statement.executeUpdate();
            statement.close();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error inserting notification: " + e.getMessage(), e);
            return false;
        }
    }
    
    /**
     * Update notification
     */
    public boolean updateNotification(Notification notification) {
        String sql = "UPDATE Notifications SET RecipientType = ?, Title = ?, Message = ? WHERE NotificationID = ?";
        connection = getConnection();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, notification.getRecipientType());
            statement.setString(2, notification.getTitle());
            statement.setString(3, notification.getMessage());
            statement.setInt(4, notification.getNotificationID());
            
            LOGGER.log(Level.INFO, "Executing update for notification ID: {0}", notification.getNotificationID());
            
            int rowsAffected = statement.executeUpdate();
            statement.close();
            LOGGER.log(Level.INFO, "Rows affected: {0}", rowsAffected);
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating notification: " + e.getMessage(), e);
            return false;
        }
    }
    
    /**
     * Delete notification
     */
    public boolean deleteNotification(int notificationId) {
        String sql = "DELETE FROM Notifications WHERE NotificationID = ?";
        connection = getConnection();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, notificationId);
            
            int rowsAffected = statement.executeUpdate();
            statement.close();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting notification: " + e.getMessage(), e);
            return false;
        
    
        }    
        
    }
    
    /**
     * Get notifications by recipient type
     */
    public List<Notification> getNotificationsByRecipientType(String recipientType) {
        List<Notification> notifications = new ArrayList<>();
        String sql;
        
        if ("All".equals(recipientType)) {
            // If requesting "All", get all notifications
            sql = "SELECT NotificationID, RecipientType, Title, Message, CreatedAt FROM Notifications ORDER BY CreatedAt DESC";
        } else {
            // Get notifications for specific type AND 'All' type
            sql = "SELECT NotificationID, RecipientType, Title, Message, CreatedAt FROM Notifications WHERE RecipientType = ? OR RecipientType = 'All' ORDER BY CreatedAt DESC";
        }
        
        connection = getConnection();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            if (!"All".equals(recipientType)) {
                statement.setString(1, recipientType);
            }
            
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Notification notification = new Notification();
                    notification.setNotificationID(resultSet.getInt("NotificationID"));
                    notification.setRecipientType(resultSet.getString("RecipientType"));
                    notification.setTitle(resultSet.getString("Title"));
                    notification.setMessage(resultSet.getString("Message"));
                    notification.setCreatedAt(resultSet.getTimestamp("CreatedAt"));
                    notifications.add(notification);
                }
            }
            statement.close();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting notifications by recipient type: " + e.getMessage(), e);
        }
        
        return notifications;
    }
    
    /**
     * Get notification count by recipient type
     */
    public int getNotificationCount(String recipientType) {
        String sql = "SELECT COUNT(*) FROM Notifications WHERE RecipientType = ? OR RecipientType = 'All'";
        connection = getConnection();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, recipientType);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
            statement.close();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting notification count: " + e.getMessage(), e);
        }
        
        return 0;
    }
}
