/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.Infor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class InforDAO {

    public Infor getDefaultInfor(int userID) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Infor infor = null;
        String sql = "SELECT * FROM Infor WHERE isDefault = ? AND UserID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setInt(2, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("FullName");
                String phoneNumber = rs.getString("PhoneNumber");
                String address = rs.getString("Address");
                userID = rs.getInt("UserID");
                boolean isDefault = rs.getBoolean("isDefault");
                infor = new Infor(id, fullName, phoneNumber, address, userID, isDefault);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return infor;
    }

    public List<Infor> getInforList(int userID) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Infor> list = new ArrayList<>();
        String sqlSelect = "SELECT * FROM Infor WHERE UserID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("FullName");
                String phoneNumber = rs.getString("PhoneNumber");
                String address = rs.getString("Address");
                userID = rs.getInt("UserID");
                boolean isDefault = rs.getBoolean("isDefault");
                list.add(new Infor(id, fullName, phoneNumber, address, userID, isDefault));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return list;
    }
    
    public int changeDefaultAddress() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int n = 0;
        String query = "";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return n;
    }
}
