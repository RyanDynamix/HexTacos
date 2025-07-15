
package model;

import java.io.Serializable;
import java.sql.*;

public class Orders implements Serializable {
    private int orderID;
    private int userID;
    private boolean orderConfirmed;
    private Date orderDate;
    private double totalMoney;
    private String phone;
    private String paymentStatus;       //Paid      - Unpaid     - Payment Failed - Watting
    private String deliveryStatus;      //Delivered - Processing - Cancelled      - Watting
    private String paymentType;         //COD, Online banking,...
    private String deliveryInfo;        //Đơn vị vận chuyển
    private String nameOrder;           //Tên người nhận
    private String deliveryLocation;    //Địa chỉ nhận
    //set lấy totalMoney
    private String totalString;
    
    public Orders() {
    }

    public String getTotalString() {
        return totalString;
    }

    public void setTotalString(String totalString) {
        this.totalString = totalString;
    }
    
    public Orders(int orderID, Date orderDate, String paymentStatus, double totalMoney, String phone, String deliveryStatus) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.paymentStatus = paymentStatus;
        this.phone = phone;
        this.deliveryStatus = deliveryStatus;
    }
    
    
    //construct ko có orderDate
    public Orders(int orderID, int userID, boolean orderConfirmed, double totalMoney, String phone, String paymentStatus, String deliveryStatus, String paymentType, String deliveryInfo, String nameOrder, String deliveryLocation) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderConfirmed = orderConfirmed;
        this.totalMoney = totalMoney;
        this.phone = phone;
        this.paymentStatus = paymentStatus;
        this.deliveryStatus = deliveryStatus;
        this.paymentType = paymentType;
        this.deliveryInfo = deliveryInfo;
        this.nameOrder = nameOrder;
        this.deliveryLocation = deliveryLocation;
    }

    public Orders(int orderID, int userID, boolean orderConfirmed, Date orderDate, double totalMoney, String phone, String paymentStatus, String deliveryStatus, String paymentType, String deliveryInfo, String nameOrder, String deliveryLocation) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderConfirmed = orderConfirmed;
        this.orderDate = orderDate;
        this.totalMoney = totalMoney;
        this.phone = phone;
        this.paymentStatus = paymentStatus;
        this.deliveryStatus = deliveryStatus;
        this.paymentType = paymentType;
        this.deliveryInfo = deliveryInfo;
        this.nameOrder = nameOrder;
        this.deliveryLocation = deliveryLocation;
    }
    
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public boolean isOrderConfirmed() {
        return orderConfirmed;
    }

    public void setOrderConfirmed(boolean orderConfirmed) {
        this.orderConfirmed = orderConfirmed;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public String getDeliveryInfo() {
        return deliveryInfo;
    }

    public void setDeliveryInfo(String deliveryInfo) {
        this.deliveryInfo = deliveryInfo;
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

    @Override
    public String toString() {
        return "Orders{" + "orderID=" + orderID + ", userID=" + userID + ", orderConfirmed=" + orderConfirmed + ", orderDate=" + orderDate + ", totalMoney=" + totalMoney + ", phone=" + phone + ", paymentStatus=" + paymentStatus + ", deliveryStatus=" + deliveryStatus + ", paymentType=" + paymentType + ", deliveryInfo=" + deliveryInfo + ", nameOrder=" + nameOrder + ", deliveryLocation=" + deliveryLocation + ", totalString=" + totalString + '}';
    }

    public void setTransactionId(String vnp_TransactionNo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}
