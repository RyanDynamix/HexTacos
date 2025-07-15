package model;

import java.io.Serializable;

public class ProductDetail implements Serializable {
    private int ID;
    private int productID;
    private String screen;
    private String os;
    private String mainCamera;
    private String selfieCamera;
    private String chip;
    private String ram;
    private String storage;
    private String sim;
    private String battery;
    private String charger;
    private String color;

    public ProductDetail() {
    }

    public ProductDetail(int ID, int productID, String screen, String os, String mainCamera, String selfieCamera, String chip, String ram, String storage, String sim, String battery, String charger, String color) {
        this.ID = ID;
        this.productID = productID;
        this.screen = screen;
        this.os = os;
        this.mainCamera = mainCamera;
        this.selfieCamera = selfieCamera;
        this.chip = chip;
        this.ram = ram;
        this.storage = storage;
        this.sim = sim;
        this.battery = battery;
        this.charger = charger;
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

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "ProductDetail{" + "ID=" + ID + ", productID=" + productID + ", screen=" + screen + ", os=" + os + ", mainCamera=" + mainCamera + ", selfieCamera=" + selfieCamera + ", chip=" + chip + ", ram=" + ram + ", storage=" + storage + ", sim=" + sim + ", battery=" + battery + ", charger=" + charger + ", color=" + color + '}';
    }

}
