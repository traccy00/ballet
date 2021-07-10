/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public List<User> getUserList() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<User> list = new ArrayList<>();
        String sqlSelect = "SELECT * FROM [User]";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String avatar = rs.getString("avatar");
                String account = rs.getString("account");
                String password = rs.getString("password");
                String email = rs.getString("email");
                boolean permission = rs.getBoolean("permission");
                String phoneNumber = rs.getString("PhoneNumber");
                list.add(new User(id, avatar, account, password, email, permission, phoneNumber));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return list;
    }

    public User getUserByID(int id) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        String sqlSelect = "SELECT * FROM [User] WHERE id = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                String avatar = rs.getString("avatar");
                String account = rs.getString("account");
                String password = rs.getString("password");
                String email = rs.getString("email");
                boolean permission = rs.getBoolean("permission");
                String phoneNumber = rs.getString("PhoneNumber");
                user = new User(id, avatar, account, password, email, permission, phoneNumber);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return user;
    }
    
    //login
    public User getUserByUsernameAndPassword(String username, String password) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        String sqlSelect = "SELECT * FROM [Users] WHERE Username like ? AND [Password] like ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String avatar = rs.getString("Avatar");
                username = rs.getString("Username");
                password = rs.getString("Password");
                String email = rs.getString("Email");
                boolean permission = rs.getBoolean("Permission");
                String phoneNumber = rs.getString("PhoneNumber");
                user = new User(id, avatar, username, password, email, permission, phoneNumber);
            }
            System.out.println("username " + username + " " + password);
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return user;
    }
    
    //if user get password fail, show the user account and avatar for user identify
    public User getUserByUsername(String userName) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        String sqlSelect = "SELECT * FROM [Users] WHERE Username like ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String avatar = rs.getString("Avatar");
                userName = rs.getString("Username");
                String password = rs.getString("Password");
                String email = rs.getString("Email");
                boolean permission = rs.getBoolean("Permission");
                String phoneNumber = rs.getString("PhoneNumber");
                user = new User(id, avatar, userName, password, email, permission, phoneNumber);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return user;
    }
    
    public User getUserByPhoneNumber(String phoneNumber) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        String sqlSelect = "SELECT * FROM [Users] WHERE PhoneNumber like ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            ps.setString(1, phoneNumber);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String avatar = rs.getString("Avatar");
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                String email = rs.getString("Email");
                boolean permission = rs.getBoolean("Permission");
                user = new User(id, avatar, username, password, email, permission, phoneNumber);
                phoneNumber = rs.getString("PhoneNumber");
                user = new User(id, avatar, username, password, email, permission, phoneNumber);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return user;
    }
    
    public User getUserByEmail(String email) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        String sqlSelect = "SELECT * FROM [Users] WHERE Email like ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlSelect);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String avatar = rs.getString("Avatar");
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                email = rs.getString("Email");
                boolean permission = rs.getBoolean("Permission");
                String phoneNumber = rs.getString("PhoneNumber");
                user = new User(id, avatar, username, password, email, permission, phoneNumber);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return user;
    }
    
    public int addCustomer(User insertedUser) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int n = 0;
        String sqlInsert = "INSERT INTO Users VALUES (?,?,?,?,?,?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sqlInsert);
            ps.setString(1, "avatar1.jpg");
            ps.setString(2, insertedUser.getUserName());
            ps.setString(3, insertedUser.getPassword());
            ps.setString(4, insertedUser.getEmail());
            ps.setBoolean(5, false);
            ps.setString(6, insertedUser.getPhoneNumber());
            n = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return n;
    }

}
