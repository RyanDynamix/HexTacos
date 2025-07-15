package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Discounts implements Serializable {
    private int discountID;
    private String code;
    private String name;
    private String type;
    private BigDecimal value;
    private BigDecimal minOrderValue;
    private int quantity;
    private Date startDate;
    private Date endDate;
    private boolean status;
    private Date createdAt;
    
    public Discounts() {
    }
    
    public Discounts(int discountID, String code, String name, String type, 
                    BigDecimal value, BigDecimal minOrderValue, int quantity, 
                    Date startDate, Date endDate, boolean status, Date createdAt) {
        this.discountID = discountID;
        this.code = code;
        this.name = name;
        this.type = type;
        this.value = value;
        this.minOrderValue = minOrderValue;
        this.quantity = quantity;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.createdAt = createdAt;
    }
    
    public Discounts(String code, String name, String type, 
                    BigDecimal value, BigDecimal minOrderValue, int quantity, 
                    Date startDate, Date endDate, boolean status) {
        this.code = code;
        this.name = name;
        this.type = type;
        this.value = value;
        this.minOrderValue = minOrderValue;
        this.quantity = quantity;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public BigDecimal getValue() {
        return value;
    }

    public void setValue(BigDecimal value) {
        this.value = value;
    }
    
    public String getValueString() {
        DecimalFormat df = new DecimalFormat("#,###");
        if (type.equalsIgnoreCase("percentage")) {
            return value + "%";
        } else {
            return df.format(value) + " VND";
        }
    }

    public BigDecimal getMinOrderValue() {
        return minOrderValue;
    }
    
    public String getMinOrderValueString() {
        DecimalFormat df = new DecimalFormat("#,###");
        return df.format(minOrderValue) + " VND";
    }

    public void setMinOrderValue(BigDecimal minOrderValue) {
        this.minOrderValue = minOrderValue;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getStartDate() {
        return startDate;
    }
    
    public String getStartDateString() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(startDate);
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }
    
    public String getEndDateString() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(endDate);
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }
    
    public String getCreatedAtString() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        return sdf.format(createdAt);
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Discounts{" + "discountID=" + discountID + ", code=" + code + ", name=" + name + 
                ", type=" + type + ", value=" + value + ", minOrderValue=" + minOrderValue + 
                ", quantity=" + quantity + ", startDate=" + startDate + ", endDate=" + endDate + 
                ", status=" + status + ", createdAt=" + createdAt + '}';
    }
} 