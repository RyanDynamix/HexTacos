
package model;

import java.sql.*;

public class donHang {
    private int orderID;
    private int productID;
    private String productName;
    private String thumbnail;
    private String storage;
    private String color;      //lấy theo bên OrderDetail
    private int quantity;
    private double price;
    private double totalMoney;
    //thêm vào
    private int userID;
    private String paymentStatus;
    private String deliveryStatus;
    private String paymentType;
    private Date orderDate;
    //thuộc tính không có trong database
    private String disString;
    private String totalString;
    //thuộc tính để hiển thị thành tiền
    private String thanhTien;
    //Thêm phone cho admin
    private String phone;
    
    public donHang() {
    }

    public donHang(int orderID, int productID, String productName, String thumbnail, String storage, String color, int quantity, double price, double totalMoney, int userID, String paymentStatus, String deliveryStatus, String paymentType, Date orderDate) {
        this.orderID = orderID;
        this.productID = productID;
        this.productName = productName;
        this.thumbnail = thumbnail;
        this.storage = storage;
        this.color = color;
        this.quantity = quantity;
        this.price = price;
        this.totalMoney = totalMoney;
        this.userID = userID;
        this.paymentStatus = paymentStatus;
        this.deliveryStatus = deliveryStatus;
        this.paymentType = paymentType;
        this.orderDate = orderDate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(String thanhTien) {
        this.thanhTien = thanhTien;
    }
    
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getDisString() {
        return disString;
    }

    public void setDisString(String disString) {
        this.disString = disString;
    }

    public String getTotalString() {
        return totalString;
    }

    public void setTotalString(String totalString) {
        this.totalString = totalString;
    }

    @Override
    public String toString() {
        return "donHang{" + "orderID=" + orderID + ", productID=" + productID + ", productName=" + productName + ", thumbnail=" + thumbnail + ", storage=" + storage + ", color=" + color + ", quantity=" + quantity + ", price=" + price + ", totalMoney=" + totalMoney + ", userID=" + userID + ", paymentStatus=" + paymentStatus + ", deliveryStatus=" + deliveryStatus + ", paymentType=" + paymentType + ", orderDate=" + orderDate + ", disString=" + disString + ", totalString=" + totalString + '}';
    }
    
}
