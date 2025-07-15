
package model;

import java.io.Serializable;

public class productCategories implements Serializable{
    private int productID;
    private int categoryID;

    public productCategories() {
    }

    public productCategories(int productID, int categoryID) {
        this.productID = productID;
        this.categoryID = categoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "productCategories{" + "productID=" + productID + ", categoryID=" + categoryID + '}';
    }
    
}
