
package model;

import java.io.Serializable;

public class Categories implements Serializable {
    private int categoryID;
    private String name;
    private String description;

    public Categories() {
    }

    public Categories(int categoryID, String name, String description) {
        this.categoryID = categoryID;
        this.name = name;
        this.description = description;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Categories{" + "categoryID=" + categoryID + ", name=" + name + ", description=" + description + '}';
    }

}
