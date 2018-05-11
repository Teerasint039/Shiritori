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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Teerasint
 */
public class Vocab {

    private int vocabId;
    private String vocab;
    private String meaning;
    private String pronunciation;

    public Vocab() {
    }

    public Vocab(String vocab, String meaning, String pronunciation) {
        this.vocab = vocab;
        this.meaning = meaning;
        this.pronunciation = pronunciation;
    }

    public Vocab(ResultSet rs) throws SQLException {
        vocabId = rs.getInt("VocabId");
        vocab = rs.getString("Vocab");
        meaning = rs.getString("Meaning");
        pronunciation = rs.getString("PartsofSpeech");
    }

    public String getVocab() {
        return vocab;
    }

    public void setVocab(String vocab) {
        this.vocab = vocab;
    }

    public int getVocabId() {
        return vocabId;
    }

    public void setVocabId(int vocabId) {
        this.vocabId = vocabId;
    }

    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }

    public String getPronunciation() {
        return pronunciation;
    }

    public void setPronunciation(String pronunciation) {
        this.pronunciation = pronunciation;
    }

    public void addVocab(String vocab, String meaning, String pronunciation) {

        Vocab vocabs = new Vocab();

        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into Vocab (Vocab, Meaning, Pronunciation)"
                    + " values (?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, vocab);
            preparedStmt.setString(2, meaning);
            preparedStmt.setString(3, pronunciation);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }

    }

    public void editVocab(int vocabId, String vocab, String meaning, String pronunciation) {
        try {
            Connection conn = Connectionbuilder.connect();

            PreparedStatement pstmu = conn.prepareStatement("UPDATE Vocab SET Vocab = '" + vocab + "', Meaning = '" + meaning + "', Pronunciation ='" + pronunciation + "' WHERE VocabId='" + vocabId + "';");
            int rsu = pstmu.executeUpdate();
            pstmu.close();
            conn.close();

        } catch (Exception ex) {

        }
    }

    public Vocab showVocabDetail(String vocabulary) {

        Vocab vocab = null;

        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Vocab` WHERE Vocab = '" + vocabulary + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                vocab = new Vocab(rs);
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }

        return vocab;
    }
    
    public boolean isInDB(String vocab){//not complete
        boolean inDb = false;
        
        return inDb;
    }
    
    public List<String> showAllVocab(){
        List<String> vocabs = null;
        String vocab = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT Vocab FROM `SinglePlayerMode_Vocab`;");
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

    public static List<Vocab> showAllVocabDetail() {

        List<Vocab> vocabs = null;
        Vocab vocab = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Vocab`");
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

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vocabs;
    }

    @Override
    public String toString() {
        return "Vocab{" + "vocabId=" + vocabId + ", vocab=" + vocab + ", meaning=" + meaning + ", pronunciation=" + pronunciation + '}';
    }

}
