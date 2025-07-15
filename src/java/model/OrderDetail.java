/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author hotaru
 */
public class OrderDetail {
    private int ID;
    private int productID;
    private int orderID;
    private int quantity;
    private double price;
    private String color;
    //Thêm cho admin hiển thị tên sp
    private String name;
    //ko co trong db
    private String priceString;
    //hiểm thị chọn trong admin order edit
    private List<String> colorList;

    public OrderDetail() {
    }

    public OrderDetail(int ID, int productID, int orderID, int quantity, double price) {
        this.ID = ID;
        this.productID = productID;
        this.orderID = orderID;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderDetail(int ID, int productID, int orderID, int quantity, double price, String color) {
        this.ID = ID;
        this.productID = productID;
        this.orderID = orderID;
        this.quantity = quantity;
        this.price = price;
        this.color = color;
    }

    public OrderDetail(int ID, int productID, int orderID, int quantity, double price, String color, String name) {
        this.ID = ID;
        this.productID = productID;
        this.orderID = orderID;
        this.quantity = quantity;
        this.price = price;
        this.color = color;
        this.name = name;
    }

    public List<String> getColorList() {
        return colorList;
    }

    public void setColorList(List<String> colorList) {
        this.colorList = colorList;
    }
    
    public String getPriceString() {
        return priceString;
    }

    public void setPriceString(String priceString) {
        this.priceString = priceString;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
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

    @Override
    public String toString() {
        return "OrderDetail{" + "ID=" + ID + ", productID=" + productID + ", orderID=" + orderID + ", quantity=" + quantity + ", price=" + price + ", color=" + color + ", name=" + name + ", priceString=" + priceString + '}';
    }

}
