/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class EmailDAO {
    public void addEmail(String email) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        String sqlUpdate = "INSERT INTO subcribeEmail VALUES (?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlUpdate);
            ps.setString(1, email);
            ps.execute();
            System.out.println("add");
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
    }

}
