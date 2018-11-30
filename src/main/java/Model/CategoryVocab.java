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
public class CategoryVocab {
    private int categoryId;
    private int vocabId;

    public CategoryVocab(int categoryId, int vocabId) {
        this.categoryId = categoryId;
        this.vocabId = vocabId;
    }

    public CategoryVocab() {
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getVocabId() {
        return vocabId;
    }

    public void addVocabToAdminCategory(int categoryId, int vocabId){
        CategoryVocab cv = null;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into Vocab_Admin_Category (ACId, VocabId)"
                    + " values (?, ?)";
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setInt(1, categoryId);
            preparedStmt.setInt(2, vocabId);
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }
    
    public List<String> showAllVocabInCategory(int categoryId){ //return to list of set (VACId,vocab)
        String vocab = null;
        List<String> vocabs = null;
        try {
            Connection conn = Connectionbuilder.connect();        
            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT `Vocab`.vocab FROM `Vocab_Admin_Category`JOIN `Vocab`"
                        +" WHERE `Vocab_Admin_Category`.`VocabId` = `Vocab`.`VocabId` AND `Vocab_Admin_Category`.ACId = '" + categoryId + "';");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    vocab = rs.getString("Vocab");
                    if (vocabs == null) {
                        vocabs = new ArrayList();
                    }
                    vocabs.add(vocab);
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
        return vocabs;
    }
    
    public List<Integer> showAllVocabIdInCategory(int categoryId){ 
        int id;
        List<Integer> vocabIds = null;
        try {
            Connection conn = Connectionbuilder.connect();        
            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT vocabId FROM `Vocab_Admin_Category` WHERE ACId = '" + categoryId + "';");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    id = rs.getInt("vocabId");
                    if (vocabIds == null) {
                        vocabIds = new ArrayList();
                    }
                    vocabIds.add(id);
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
        return vocabIds;
    }
    
    public void editVocabInCategory(int vocabId, int categoryId, int old_vocabId, int old_categoryId,String user) {
        try {
            Connection conn = Connectionbuilder.connect();
            if (user.equalsIgnoreCase("admin")) {
                PreparedStatement pstmu = conn.prepareStatement("UPDATE Vocab_Admin_Category SET VocabId = '" + vocabId + "', ACId = '" + categoryId + "' WHERE VACId='" + old_vocabId + "' AND ACId ='" + old_categoryId + "';");
            int rsu = pstmu.executeUpdate();
            pstmu.close();
            conn.close();
            }else if (user.equalsIgnoreCase("user")) {
                PreparedStatement pstmu = conn.prepareStatement("UPDATE Vocab_User_Category SET VUCId = '" + vocabId + "', UCId = '" + categoryId + "' WHERE VUCId='" + old_vocabId + "' AND UCId ='" + old_categoryId +  "';");
            int rsu = pstmu.executeUpdate();
            pstmu.close();
            conn.close();
            }
        } catch (Exception ex) {
            System.out.println("ERROR!..Have Exception!");
        }
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
    
    public String getVocabFromVACId(int VACId){
        String vocab = "";
        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT `Vocab`.Vocab FROM `Vocab_Admin_Category` JOIN `Vocab` ON `Vocab_Admin_Category`.VocabId = `Vocab`.VocabId WHERE `Vocab_Admin_Category`.VACId = '" + VACId + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                vocab = rs.getString("Vocab");
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }    
        
        return vocab;
    }
    
}
