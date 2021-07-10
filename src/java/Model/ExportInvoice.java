/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class ExportInvoice implements Serializable{
    private String username;
    private String invoiceid;
    private Date selldate;
    private ArrayList<OrderItem> list;

    public ExportInvoice() {
    }

    public ExportInvoice(String username, String invoiceid, Date selldate, ArrayList<OrderItem> list) {
        this.username = username;
        this.invoiceid = invoiceid;
        this.selldate = selldate;
        this.list = list;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public ArrayList<OrderItem> getList() {
        return list;
    }

    public void setList(ArrayList<OrderItem> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "ExportInvoice{" + "username=" + username + ", invoiceid=" + invoiceid + ", selldate=" + selldate + ", list=" + list + '}';
    }
    
}
