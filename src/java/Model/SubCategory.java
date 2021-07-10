/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Admin
 */
public class SubCategory {
    private int CategoryID;
    private int SubCategoryID;
    private String description;

    public SubCategory() {
    }

    public SubCategory(int CategoryID, int SubCategoryID, String description) {
        this.CategoryID = CategoryID;
        this.SubCategoryID = SubCategoryID;
        this.description = description;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getSubCategoryID() {
        return SubCategoryID;
    }

    public void setSubCategoryID(int SubCategoryID) {
        this.SubCategoryID = SubCategoryID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
