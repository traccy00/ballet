/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.CartProduct;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CartProductDAO {

    public int addProductToCart(int productId, int quantity) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "INSERT INTO [dbo].[Cart]([ProductID] ,[Quantity]) VALUES (?,?)";
        int n = 0;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ps.setInt(2, quantity);
            n = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return n;
    }

    public int deleteFromCart(int cartID) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int n = 0;
        String sqlDelete = "DELETE FROM Cart WHERE id = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlDelete);
            ps.setInt(1, cartID);
            n = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return n;
    }

    public void updateCart(int quantity, String productid) {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sqlUpdate = "UPDATE tblCart set QuantityCart=? where productid=?";
            ps.setInt(1, quantity);
            ps.setString(2, productid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//    public static void main(String[] args) throws Exception {
//       int n = new CartProductDAO().addProductToCart(1, 4);
//       if(n > 0 ){ 
//           System.out.println("succ");
//       }
//    }
}
