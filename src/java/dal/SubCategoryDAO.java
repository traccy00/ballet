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
import java.util.List;
import Model.SubCategory;

/**
 *
 * @author Admin
 */
public class SubCategoryDAO {

    public List<SubCategory> getListSubCategory() throws Exception{
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM SubCategory";
        ArrayList<SubCategory> list = new ArrayList<>();
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                int catid = rs.getInt("CategoryID");
                int subid = rs.getInt("SubCategoryID");
                String description = rs.getString("Description");
                list.add(new SubCategory(catid, subid,description));
            }
        } catch (Exception e) {
            throw e;
        }finally {
            db.closeConnection(rs, ps, conn);
        }
        return list;
    }
}
