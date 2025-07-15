
package model;

import java.io.Serializable;
import java.sql.*;

public class Products implements Serializable{

    private int productID;
    private String name;
    private int price;
    private int discount;
    private int quantity;
    private Date created_at;
    private Date updated_at;
    private String description;
    private String thumbnail;
    //thuộc tính không có trong database
    private String priceString;
    private String disString;

    public Products() {
    }

    public Products(int productID, String name, int price, int discount, int quantity, Date created_at, Date updated_at, String description, String thumbnail) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.description = description;
        this.thumbnail = thumbnail;
    }

    public String getPriceString() {
        return priceString;
    }

    public void setPriceString(String priceString) {
        this.priceString = priceString;
    }

    public String getDisString() {
        return disString;
    }

    public void setDisString(String disString) {
        this.disString = disString;
    }
    

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    @Override
    public String toString() {
        return "Products{" + "productID=" + productID + ", name=" + name + ", price=" + price + ", discount=" + discount + ", quantity=" + quantity + ", created_at=" + created_at + ", updated_at=" + updated_at + ", description=" + description + ", thumbnail=" + thumbnail + '}';
    }
}
