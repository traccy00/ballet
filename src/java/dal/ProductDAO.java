/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import Model.Product;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    public List<Product> getProductListPaging(int pageNo, int pageSize) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        int from = pageNo * pageSize - (pageSize - 1);
        int to = pageNo * pageSize;
        List<Product> list = new ArrayList<>();
        String sqlSelect = "with result as (select ROW_NUMBER() over (order by CreateDate desc)  as r, * from Product) select * from result where r between ? and ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            ps.setInt(1, from);
            ps.setInt(2, to);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("ProductName");
                int avai = rs.getInt("Available");
                double unitPrice = rs.getDouble("UnitPrice");
                String des = rs.getString("Description");
                int sold = rs.getInt("Sold");
                int sCategoryid = rs.getInt("SubCategoryID");
                Date createDate = rs.getTimestamp("CreateDate");
                String image = rs.getString("Image");
                list.add(new Product(id, name, avai, unitPrice, des, sold, sCategoryid, createDate, image));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return list;
    }

    //top 4 product are the most sellest - top 4 top most
    public List<Product> getFeatureProduct() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        List<Product> list = new ArrayList<>();
        String sqlSelect = "SELECT TOP(4) * FROM Product ORDER BY Sold DESC";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("ProductName");
                int avai = rs.getInt("Available");
                double unitPrice = rs.getDouble("UnitPrice");
                String des = rs.getString("Description");
                int sold = rs.getInt("Sold");
                int sCategoryid = rs.getInt("SubCategoryID");
                Date createDate = rs.getTimestamp("CreateDate");
                String image = rs.getString("Image");
                list.add(new Product(id, name, avai, unitPrice, des, sold, sCategoryid, createDate, image));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return list;
    }

    //get top 3 new arrival product
    public List<Product> getNewArrivalProduct() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        List<Product> list = new ArrayList<>();
        String sqlSelect = "SELECT TOP(3) * FROM Product ORDER BY CreateDate DESC";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("ProductName");
                int avai = rs.getInt("Available");
                double unitPrice = rs.getDouble("UnitPrice");
                String des = rs.getString("Description");
                int sold = rs.getInt("Sold");
                int sCategoryid = rs.getInt("SubCategoryID");
                Date createDate = rs.getTimestamp("CreateDate");
                String image = rs.getString("Image");
                list.add(new Product(id, name, avai, unitPrice, des, sold, sCategoryid, createDate, image));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return list;
    }

    //find product by id
    public Product getProductById(int id) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Product product = null;
        String sqlSelect = "SELECT * FROM Product WHERE id = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("ProductName");
                int avai = rs.getInt("Available");
                double unitPrice = rs.getDouble("UnitPrice");
                String des = rs.getString("Description");
                int sold = rs.getInt("Sold");
                int sCategoryid = rs.getInt("SubCategoryID");
                Date createDate = rs.getTimestamp("CreateDate");
                String image = rs.getString("Image");
                product = new Product(id, name, avai, unitPrice, des, sold, sCategoryid, createDate, image);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return product;
    }
    
    public int getTotalProduct() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Product product = null;
        String sqlSelect = "SELECT count(*) as count FROM Product";
        int totalProduct = 0;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            while(rs.next()) {
                totalProduct = rs.getInt("count");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return totalProduct;
    }

    public ResultSet addProduct(String productid, String productname, int quantity, double price, String imageName, String description, int categoryid) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        String sqlInsert = "INSERT INTO tblProduct values("
                + "'" + productid + "','" + productname + "'," + quantity + ","
                + price + ",'" + imageName + "','" + description + "'," + categoryid + ");";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlInsert);
            rs = ps.executeQuery(sqlInsert);
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return rs;
    }

    public void deleteProduct(String productid) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        String sqlDelete = "Delete from tblProduct where ProductID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlDelete);
            ps.setString(1, productid);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
    }

    public void updateProduct(int quantity, String productid) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        String sqlUpdate = "UPDATE tblProduct set quantity=? where ProductID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlUpdate);
            ps.setInt(1, quantity);
            ps.setString(2, productid);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
    }

    public void editProduct(String id, String image, String name,
            String description, int quantity, double price, int category, String chooeseid) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        String sqlUpdate = "UPDATE tblProduct set ProductID=?,Image=?,ProductName=?,Description=?,Quantity=?,Price=?,CategoryID=?"
                + " where ProductID=?";
        try {
            conn = db.getConnection();

            ps = conn.prepareStatement(sqlUpdate);
            ps.setString(1, id);
            ps.setString(2, image);
            ps.setString(3, name);
            ps.setString(4, description);
            ps.setInt(5, quantity);
            ps.setDouble(6, price);
            ps.setInt(7, category);
            ps.setString(8, chooeseid);

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
    }
}
