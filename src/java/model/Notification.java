package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Notification implements Serializable {
    private int notificationID;
    private String recipientType;
    private String title;
    private String message;
    private Timestamp createdAt;

    public Notification() {
    }

    public Notification(int notificationID, String recipientType, String title, String message, Timestamp createdAt) {
        this.notificationID = notificationID;
        this.recipientType = recipientType;
        this.title = title;
        this.message = message;
        this.createdAt = createdAt;
    }

    public Notification(String recipientType, String title, String message) {
        this.recipientType = recipientType;
        this.title = title;
        this.message = message;
    }

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public String getRecipientType() {
        return recipientType;
    }

    public void setRecipientType(String recipientType) {
        this.recipientType = recipientType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Notification{" +
                "notificationID=" + notificationID +
                ", recipientType='" + recipientType + '\'' +
                ", title='" + title + '\'' +
                ", message='" + message + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
