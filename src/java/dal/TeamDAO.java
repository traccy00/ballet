/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.Team;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TeamDAO {

    public List<Team> getTeamList() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlSelect = "SELECT * FROM OurTeam";
        List<Team> list = new ArrayList<>();
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String position =rs.getString("position");
                String description = rs.getString("description");
                String email = rs.getString("email");
                String image = rs.getString("image");
                list.add(new Team(id, name, position, description, email, image));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        System.out.println("list " + list.size());
        return list;

    }
}
