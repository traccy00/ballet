/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class OrderItem {

    String invoiceid;
    String productid;
    String productname;
    int quantity;
    double price;

    private Connection cnn;
    private Statement stm;
    private ResultSet rs;

    public void connect() {
        try {
            cnn = new DBContext().getConnection();
            System.out.println("Connect successfully");
        } catch (Exception e) {
            System.out.println("Connect fail " + e.getMessage());
        }
    }

    public OrderItem() {
        connect();
    }

    public OrderItem(String invoiceid, String productid, String productname, int quantity, double price) {
        this.invoiceid = invoiceid;
        this.productid = productid;
        this.productname = productname;
        this.quantity = quantity;
        this.price = price;
        connect();
    }

    public String getInvoiceid() {
        return invoiceid;
    }

    public void setInvoiceid(String invoiceid) {
        this.invoiceid = invoiceid;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public ArrayList<OrderItem> getOrderItemList() {
        ArrayList<OrderItem> list = new ArrayList<>();
        String sqlSelect = "SELECT * from tblOrderItem";
        try {
            PreparedStatement st = cnn.prepareStatement(sqlSelect);
            rs = st.executeQuery();
            while (rs.next()) {
                String sInvoiceid = rs.getString("invoiceid");
                String sProductid = rs.getString("productid");
                String sProductname = rs.getString("productname");
                int sQuantity = rs.getInt("quantity");
                double sPrice = rs.getDouble("price");
                list.add(new OrderItem(sInvoiceid, sProductid, sProductname, sQuantity, sPrice));
            }
        } catch (Exception e) {
            System.out.println("add order " + e.getMessage());
        }
        return list;
    }

    public ResultSet addOrderItem(String invoiceid, String productid, String productname, int quantity, double price) {
        String sqlInsert = "insert into tblOrderItem values('"
                + invoiceid + "','" + productid + "','" + productname + "'," + quantity + "," + price + ")";
        System.out.println(sqlInsert);
        if (cnn == null) {
            return null;
        }
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(sqlInsert);
            System.out.println("add succ order");
            return rs;
        } catch (Exception e) {
            System.out.println("addOrder: " + e.getMessage());
        }
        return null;
    }

}
