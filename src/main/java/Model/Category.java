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
    private int adminId;

    public Category(int categoryId, String categoryName, String lastEditDate, int adminId) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.lastEditDate = lastEditDate;
        this.adminId = adminId;
    }

    public Category() {
    }
    
    public Category(ResultSet rs) throws SQLException {
        categoryId = rs.getInt("categoryId");
        adminId = rs.getInt("AdminId");
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

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
    
    public void createCategory(String categoryName, String createDate, int adminId){
        Category cat = null;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into Admin_Category (CategoryName, LastEditDate, AdminId)"
                    + " values (?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, categoryName);
            preparedStmt.setString(2, createDate);
            preparedStmt.setInt(3, adminId);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }
    
    public List<Category> showCategory(){
        List<Category> categorys = null;
        Category category = null;
        try {
            Connection conn = Connectionbuilder.connect();
//
            try {
//                PreparedStatement pstm = conn.prepareStatement("SELECT *  FROM `Admin_Category` WHERE AdminId = '" + adminId + " ;"); 
//                ResultSet rs = pstm.executeQuery();
//                while (rs.next()) {
//                    category = new Category(rs);
//                    categorys.add(category);
//                }
                PreparedStatement pstm = conn.prepareStatement("SELECT *  FROM `Admin_Category`;"); 
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    category = new Category(rs);
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
    
    public String getCategoryNamebyId(int categoryId){
        String categoryName = "";
        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT `CategoryName`  FROM `Admin_Category` WHERE ACId = '" + categoryId + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                categoryName = rs.getString("CategoryName");
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }
        return categoryName;
    } 
       
}
