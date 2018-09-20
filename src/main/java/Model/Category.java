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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Teerasint
 */
public class Category {
    private int categoryId;
    private String categoryName;
    private String lastEditDate;
    private int userId;

    public Category(int categoryId, String categoryName, String lastEditDate, int userId) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.lastEditDate = lastEditDate;
        this.userId = userId;
    }

    public Category() {
    }
    
    public Category(ResultSet rs) throws SQLException {
        categoryId = rs.getInt("categoryId");
        userId = rs.getInt("UserId");
        categoryName = rs.getString("categoryName");
        lastEditDate = rs.getString("lastEditDate");
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getLastEditDate() {
        return lastEditDate;
    }

    public void setLastEditDate(String lastEditDate) {
        this.lastEditDate = lastEditDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public void createUserCategory(String categoryName, String createDate, int userId){
        Category cat = null;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into User_Category (CategoryName, LastEditDate, UserId)"
                    + " values (?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, categoryName);
            preparedStmt.setString(2, createDate);
            preparedStmt.setInt(3, userId);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }
    
    public List<Category> showCategory(int userId){
        List<Category> categorys = null;
        Category category = null;
        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT *  FROM `User_Category` WHERE UserId = '" + userId + " ;"); 
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    category = new Category(rs);
                    categorys.add(category);
                }
                PreparedStatement pstm_A = conn.prepareStatement("SELECT *  FROM `Admin_Category`;"); 
                ResultSet rs_A = pstm_A.executeQuery();
                while (rs_A.next()) {
                    category = new Category(rs_A);
                    categorys.add(category);
                }
                rs.close();
                pstm.close();
                conn.close();
            } catch (Exception ex) {
                Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorys;
    }
    
    
    
    
    
    
    
    
}
