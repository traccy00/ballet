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
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Invoice {

    //random unique ID
    private String invoiceid;
    private Date selldate;
    private String account;

    private Connection cnn;
    private Statement stm;
    private ResultSet rs;

    public Invoice() {
        connect();
    }

    public Invoice(String invoiceid, Date selldate, String account) {
        this.invoiceid = invoiceid;
        this.selldate = selldate;
        this.account = account;
        connect();
    }

    public void connect() {
        try {
            cnn = new DBContext().getConnection();
            System.out.println("Connect successfully");
        } catch (Exception e) {
            System.out.println("Connect fail " + e.getMessage());
        }
    }

    public String getInvoiceid() {
        return invoiceid;
    }

    public void setInvoiceid(String invoiceid) {
        this.invoiceid = invoiceid;
    }

    public Date getSelldate() {
        return selldate;
    }

    public void setSelldate(Date selldate) {
        this.selldate = selldate;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public ArrayList<Invoice> getInvoiceList() {
        ArrayList<Invoice> list = new ArrayList<>();
        String sqlSelect = "SELECT * from tblInvoice";
        try {
            PreparedStatement st = cnn.prepareStatement(sqlSelect);
            rs = st.executeQuery();
            while (rs.next()) {
                String sInvoiceid = rs.getString("invoiceid");
                Date sSelldate = rs.getDate("selldate");
                String sAccount = rs.getString("account");
                list.add(new Invoice(sInvoiceid, sSelldate, sAccount));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ResultSet addInvoice(String invoiceid, Date selldate, String account) {
        String sqlInsert = "INSERT INTO tblInvoice values("
                + "'" + invoiceid + "','" + selldate + "','" + account + "');";
        System.out.println(sqlInsert);
        if (cnn == null) {
            return null;
        }
        try {
            PreparedStatement pst = cnn.prepareStatement(sqlInsert);
            rs = pst.executeQuery();
            System.out.println("Add invoice successful");
            return rs;
        } catch (Exception e) {
            System.out.println("addInvoice: " + e.getMessage());
        }
        return null;
    }
    
}
