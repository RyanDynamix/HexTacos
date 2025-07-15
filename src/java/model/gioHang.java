
package model;

public class gioHang {
    private int orderID;
    private int productID;
    private String productName;
    private String thumbnail;
    private String storage;
    private String color;      //lấy theo bên OrderDetail
    private int quantity;
    private int price;
    private int totalMoney;
    //thuộc tính không có trong database
    private String disString;
    private String thanhTien;
    private String totalString;
    //có trong db
    private String nameOrder;
    private String deliveryLocation;
    private String phone;
    private String deliveryStatus;      //Delivered - Processing - Cancelled      - Watting
    
    public gioHang() {
    }

//    public gioHang(int orderID, String productName, String storage, String color, int quantity, int price, int totalMoney) {
//        this.orderID = orderID;
//        this.productName = productName;
//        this.storage = storage;
//        this.color = color;
//        this.quantity = quantity;
//        this.price = price;
//        this.totalMoney = totalMoney;
//    }

    public gioHang(int orderID, String productName, String storage, String color, int quantity, int price, int totalMoney) {
        this.orderID = orderID;
        this.productName = productName;
        this.storage = storage;
        this.color = color;
        this.quantity = quantity;
        this.price = price;
        this.totalMoney = totalMoney;
    }
    

    public gioHang(int orderID, int productID, String productName, String thumbnail, String storage, String color, int quantity, int price, int totalMoney) {
        this.orderID = orderID;
        this.productID = productID;
        this.productName = productName;
        this.thumbnail = thumbnail;
        this.storage = storage;
        this.color = color;
        this.quantity = quantity;
        this.price = price;
        this.totalMoney = totalMoney;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNameOrder() {
        return nameOrder;
    }

    public void setNameOrder(String nameOrder) {
        this.nameOrder = nameOrder;
    }

    public String getDeliveryLocation() {
        return deliveryLocation;
    }

    public void setDeliveryLocation(String deliveryLocation) {
        this.deliveryLocation = deliveryLocation;
    }

    public String getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(String thanhTien) {
        this.thanhTien = thanhTien;
    }

    
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }
    
    public String getTotalString() {
        return totalString;
    }

    public void setTotalString(String totalString) {
        this.totalString = totalString;
    }
    
    public String getDisString() {
        return disString;
    }

    public void setDisString(String disString) {
        this.disString = disString;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
    

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

   public long getTotalMoney() {
    return this.price * this.quantity;
}


    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

//    @Override
//    public String toString() {
//        return "gioHang{" + "orderID=" + orderID + ", productName=" + productName + ", storage=" + storage + ", color=" + color + ", quantity=" + quantity + ", price=" + price + ", totalMoney=" + totalMoney + '}';
//    }

    @Override
    public String toString() {
        return "gioHang{" + "orderID=" + orderID + ", productID=" + productID + ", productName=" + productName + ", thumbnail=" + thumbnail + ", storage=" + storage + ", color=" + color + ", quantity=" + quantity + ", price=" + price + ", totalMoney=" + totalMoney + '}';
    }
    
}
