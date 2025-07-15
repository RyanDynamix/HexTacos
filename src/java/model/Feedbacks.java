
package model;

import java.io.Serializable;

public class Feedbacks implements Serializable {
    private int id;
    private int productID;
    private int userID;
    private String note;

    public Feedbacks() {
    }

    public Feedbacks(int id, int productID, int userID, String note) {
        this.id = id;
        this.productID = productID;
        this.userID = userID;
        this.note = note;
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

    @Override
    public String toString() {
        return "Feedbacks{" + "id=" + id + ", productID=" + productID + ", userID=" + userID + ", note=" + note + '}';
    }
    
}
