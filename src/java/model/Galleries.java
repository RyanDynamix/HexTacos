
package model;

import java.io.Serializable;

public class Galleries implements Serializable {
    private int qalleryID;
    private int productID;
    private String picLink;

    public Galleries() {
    }

    public Galleries(int qalleryID, int productID, String picLink) {
        this.qalleryID = qalleryID;
        this.productID = productID;
        this.picLink = picLink;
    }

    public int getQalleryID() {
        return qalleryID;
    }

    public void setQalleryID(int qalleryID) {
        this.qalleryID = qalleryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getPicLink() {
        return picLink;
    }

    public void setPicLink(String picLink) {
        this.picLink = picLink;
    }

    @Override
    public String toString() {
        return "Galleries{" + "qalleryID=" + qalleryID + ", productID=" + productID + ", picLink=" + picLink + '}';
    }
    
}
