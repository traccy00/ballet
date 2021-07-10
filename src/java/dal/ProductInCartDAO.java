/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.CartProduct;
import dto.ProductInCart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductInCartDAO {
    public List<ProductInCart> getCartProductList() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ProductInCart> list = new ArrayList<>();
        String sqlSelect = "SELECT Cart.id, Product.ProductName, Product.[Image], Product.UnitPrice, Cart.Quantity, Product.Description FROM Product INNER JOIN Cart ON Product.id = Cart.ProductID ORDER BY Product.CreateDate ASC";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("ProductName");
                String image = rs.getString("Image");
                double unitPrice = rs.getDouble("UnitPrice");
                int quantity = rs.getInt("Quantity");
                String description = rs.getString("Description");
                list.add(new ProductInCart(id, name, image, unitPrice, quantity, description));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return list;
    }
}
