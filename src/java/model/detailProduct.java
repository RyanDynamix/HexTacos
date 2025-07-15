
package model;

public class detailProduct {
    private int productID;
    private String name;
    private double price;
    private double discount;
    private int quantity;
    private String thumbnail;
    private String screen;
    private String os;
    private String mainCamera;
    private String selfieCamera;
    private String chip;
    private String ram;
    private String stogare;
    private String sim;
    private String battery;
    private String charger;
    //thuộc tính không có trong database
    private String priceString;
    private String disString;

    public detailProduct() {
    }

    public detailProduct(int productID, String name, double price, double discount, int quantity, String thumbnail, String screen, String os, String mainCamera, String selfieCamera, String chip, String ram, String stogare, String sim, String battery, String charger) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.thumbnail = thumbnail;
        this.screen = screen;
        this.os = os;
        this.mainCamera = mainCamera;
        this.selfieCamera = selfieCamera;
        this.chip = chip;
        this.ram = ram;
        this.stogare = stogare;
        this.sim = sim;
        this.battery = battery;
        this.charger = charger;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getMainCamera() {
        return mainCamera;
    }

    public void setMainCamera(String mainCamera) {
        this.mainCamera = mainCamera;
    }

    public String getSelfieCamera() {
        return selfieCamera;
    }

    public void setSelfieCamera(String selfieCamera) {
        this.selfieCamera = selfieCamera;
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

    public String getSim() {
        return sim;
    }

    public void setSim(String sim) {
        this.sim = sim;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public String getCharger() {
        return charger;
    }

    public void setCharger(String charger) {
        this.charger = charger;
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
        return "detailProduct{" + "productID=" + productID + ", name=" + name + ", price=" + price + ", discount=" + discount + ", quantity=" + quantity + ", screen=" + screen + ", os=" + os + ", mainCamera=" + mainCamera + ", selfieCamera=" + selfieCamera + ", chip=" + chip + ", ram=" + ram + ", stogare=" + stogare + ", sim=" + sim + ", battery=" + battery + ", charger=" + charger + ", priceString=" + priceString + ", disString=" + disString + '}';
    }
    
}
