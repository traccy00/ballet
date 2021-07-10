/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.ProductImage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductImageDAO {

    public List<ProductImage> getProductImageByProductID(int productID) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ProductImage> list = new ArrayList<>();
        String querySelect = "SELECT * FROM ProductImage WHERE ProductID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(querySelect);
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                productID = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String type = rs.getString("Type");
                String description = rs.getString("Description");
                list.add(new ProductImage(id, productID, name, type, description));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return list;
    }
//    public static void main(String[] args) throws Exception {
//        new ProductImageDAO().getProductImageByProductID(1);
//    }
}
