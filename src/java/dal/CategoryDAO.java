/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Model.Category;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryDAO {
    public List<Category> getCategoryList() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        List<Category> list = new ArrayList<>();
        String sqlSelect = "SELECT * from Category";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                int ids = rs.getInt(1);
                String names = rs.getString(2);
                list.add(new Category(ids, names));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return list;
    }
}
