/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Teerasint
 */
public class User {

    private int userId;
    private String userName;
    private String password;

    public User() {
    }

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public User(ResultSet rs) throws SQLException {
        userId = rs.getInt("UserId");
        userName = rs.getString("UserName");
        password = rs.getString("Password");
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int login(String username, String password) {
        boolean login = false;
        User user = null;
        int id = -1;
        System.out.println("in login method");

        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `User` WHERE UserName = '" + username + "';");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                user = new User(rs);
            }
            if (password.equals(user.getPassword())) {
                login = true;
                id = user.getUserId();
                System.out.println("UserID(): "+user.getUserId());
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }
        return id;
    }
  

    public void addUser(String userName, String password) {
        User user = null;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into User (UserName, Password)"
                    + " values (?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, userName);
            preparedStmt.setString(2, password);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }

    public User showUser(int userId) {
        User user = null;

        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `User` WHERE UserId = '" + userId + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                user = new User(rs);
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }
        return user;
    }
    
    public boolean checkUserNameAvailable(String username) {
        boolean available = false;
        String userName = null;

        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `User` WHERE UserName = '" + username + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                userName = rs.getString("UserName");
            }
            if (userName == null) {
                available = true;
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }
        return available;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", password=" + password + '}';
    }

}
