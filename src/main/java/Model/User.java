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
//    private String password;

    public User() {
    }

    public User(String userName) {
        this.userName = userName;
    }
    

//    public User(String userName, String password) {
//        this.userName = userName;
//        this.password = password;
//    }

    public User(ResultSet rs) throws SQLException {
        userId = rs.getInt("UserId");
        userName = rs.getString("UserName");
//        password = rs.getString("Password");
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

//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }

    public int login(String username) {
        boolean login = false;
        User user = null;
        String lowerCaseUserName = username.toLowerCase();
        int id = -1;
        System.out.println("in login method");

        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `User` WHERE UserName = '" + lowerCaseUserName + "';");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                user = new User(rs);
            }
            if (user != null) {
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
  

    public void addUser(String userName) {
        User user = null;
        String lowerCaseUserName = userName.toLowerCase();
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into User (UserName)"
                    + " values (?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, lowerCaseUserName);

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
    
    public String getUserNameFromID(int userId) {
        String user = null;

        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT `UserName` FROM `User` WHERE `UserId`=" + userId);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                user = rs.getString("UserName");
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
        String lowerCaseUserName = username.toLowerCase();

        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `User` WHERE UserName = '" + lowerCaseUserName + "'");
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
        return "User{" + "userId=" + userId + ", userName=" + userName + '}';
    }

}
