package model;

import java.io.Serializable;
import java.util.Date;

public class Feedbacks implements Serializable {
    private int id;
    private int productID;
    private int userID;
    private String note;
    private int rating;


    public Feedbacks() {
    }

    // Constructor đầy đủ 6 tham số
    public Feedbacks(int id, int productID, int userID, String note, int rating) {
        this.id = id;
        this.productID = productID;
        this.userID = userID;
        this.note = note;
        this.rating = rating;
    }

    // Constructor không có ID và createdDate (dùng khi thêm mới)
    public Feedbacks(int productID, int userID, String note, int rating) {
        this.productID = productID;
        this.userID = userID;
        this.note = note;
        this.rating = rating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = Math.max(1, Math.min(rating, 5)); // đảm bảo trong 1-5
    }



    @Override
    public String toString() {
        return "Feedbacks{" +
                "id=" + id +
                ", productID=" + productID +
                ", userID=" + userID +
                ", note='" + note + '\'' +
                ", rating=" + rating +
                '}';
    }
}