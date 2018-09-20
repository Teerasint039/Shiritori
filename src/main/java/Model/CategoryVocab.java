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
    private int catVocabId;
    private int categoryId;
    private int vocabId;

    public CategoryVocab(int categoryId, int vocabId) {
        this.categoryId = categoryId;
        this.vocabId = vocabId;
    }

    public CategoryVocab() {
    }

    public int getCatVocabId() {
        return catVocabId;
    }

    public void setCatVocabId(int catVocabId) {
        this.catVocabId = catVocabId;
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

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setInt(1, categoryId);
            preparedStmt.setInt(2, vocabId);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }
    
    public void addVocabToUserCategory(int categoryId, int vocabId){
        CategoryVocab cv = null;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into Vocab_User_Category (UCId, VocabId)"
                    + " values (?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setInt(1, categoryId);
            preparedStmt.setInt(2, vocabId);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }
    
    public List<Vocab> showVocabInCategory(String user,int categoryId){
        Vocab vocab = null;
        List<Vocab> vocabs = null;
        try {
            Connection conn = Connectionbuilder.connect();
        if (user.equalsIgnoreCase("user")) {            
            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Vocab` WHERE vocabId IN SELECT vocabId FROM `Vocab_User_Category` WHERE UCId( '" + categoryId + ")';");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    vocab = new Vocab(rs);
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
        }else if (user.equalsIgnoreCase("admin")) {
            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Vocab` WHERE vocabId IN SELECT vocabId FROM `Vocab_Admin_Category` WHERE ACId( '" + categoryId + ")';");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    vocab = new Vocab(rs);
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
        }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vocabs;
    }
    
    public void editVocabInCategory(int vocabId, int categoryId, int old_vocabId, int old_categoryId,String user) {
        try {
            Connection conn = Connectionbuilder.connect();
            if (user.equalsIgnoreCase("admin")) {
                PreparedStatement pstmu = conn.prepareStatement("UPDATE Vocab_Admin_Category SET VACId = '" + vocabId + "', ACId = '" + categoryId + "' WHERE VACId='" + old_vocabId + "' AND ACId ='" + old_categoryId + "';");
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
    
}