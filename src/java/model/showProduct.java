
package model;

import java.io.Serializable;

public class showProduct implements Serializable{
    private int productID;
    private String name;
    private double price;
    private double discount;
    private String thumbnail;
    private String screen;
    private String chip;
    private String ram;
    private String stogare;
    private String priceString;
    private String disString;
    private String categoryName;

    public showProduct() {
    }

    public showProduct(int productID, String name, double price, double discount, String thumbnail, String screen, String chip, String ram, String stogare, String priceString, String disString, String categoryName) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.thumbnail = thumbnail;
        this.screen = screen;
        this.chip = chip;
        this.ram = ram;
        this.stogare = stogare;
        this.priceString = priceString;
        this.disString = disString;
        this.categoryName = categoryName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getChip() {
        return chip;
    }

    public void setChip(String chip) {
        this.chip = chip;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getStogare() {
        return stogare;
    }

    public void setStogare(String stogare) {
        this.stogare = stogare;
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

    @Override
    public String toString() {
        return "showProduct{" + "productID=" + productID + ", name=" + name + ", price=" + price + ", discount=" + discount + ", thumbnail=" + thumbnail + ", screen=" + screen + ", chip=" + chip + ", ram=" + ram + ", stogare=" + stogare + ", priceString=" + priceString + ", disString=" + disString + '}';
    }

}
