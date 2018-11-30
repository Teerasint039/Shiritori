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
    private String partofSpeech;
    private int level;

    public Vocab() {
    }

    public Vocab(String vocab, String meaning, String partofSpeech) {
        this.vocab = vocab;
        this.meaning = meaning;
        this.partofSpeech = partofSpeech;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public Vocab(int vocabId, String vocab, String meaning, String partofSpeech, int level) {
        this.vocabId = vocabId;
        this.vocab = vocab;
        this.meaning = meaning;
        this.partofSpeech = partofSpeech;
        this.level = level;
    }

    public Vocab(ResultSet rs) throws SQLException {
        vocabId = rs.getInt("VocabId");
        vocab = rs.getString("Vocab");
        meaning = rs.getString("Meaning");
        partofSpeech = rs.getString("PartsofSpeech");
        level = rs.getInt("Level");
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

    public String getPartofSpeech() {
        return partofSpeech;
    }

    public void setPartofSpeech(String partofSpeech) {
        this.partofSpeech = partofSpeech;
    }

    public void addVocab(String vocab, String meaning, String partofSpeech, int level) {

        Vocab vocabs = new Vocab();

        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into Vocab (Vocab, Meaning, PartofSpeech, Level)"
                    + " values (?, ?, ?, ?)";
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, vocab);
            preparedStmt.setString(2, meaning);
            preparedStmt.setString(3, partofSpeech);
            preparedStmt.setInt(4, level);
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }

    }

    public void editVocab(int vocabId, String vocab, String meaning, String partofSpeech, int level) {
        try {
            Connection conn = Connectionbuilder.connect();

            PreparedStatement pstmu = conn.prepareStatement("UPDATE Vocab SET Vocab = '" + vocab + "', Meaning = '" + meaning + "', PartofSpeech ='" + partofSpeech + "', Level ='" + level + "' WHERE VocabId='" + vocabId + "';");
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

    public String showVocabName(int vocabId) {

        String vocab = null;

        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT vocab FROM `Vocab` WHERE Vocab = '" + vocabId + "';");
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

    public List<String> showAllVocab() {
        List<String> vocabs = null;
        String vocab = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT Vocab FROM `Vocab`;");
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

    public List<String> showAllVocabLevel(int level) {
        List<String> vocabs = null;
        String vocab = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT Vocab FROM `Vocab` WHERE Level = '" + level + "';");
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

    public static List<Vocab> showAllVocabDetailLevel(int level) {
        List<Vocab> vocabs = null;
        Vocab vocab = null;
        if (level >= 1 && level <= 3) {
            try {
                Connection conn = Connectionbuilder.connect();

                try {
                    PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Vocab` WHERE Level = '" + level + "';");
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
        }
        return vocabs;
    }

    public String getVocabFromId(int vocabId) {
        String vocab = "";
        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT vocab FROM `Vocab` WHERE vocabId = '" + vocabId + "'");
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

    public int getVocabIdFromVocab(String vocab) {
        int vocabid;
        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT VocabId FROM `Vocab` WHERE Vocab = '" + vocab + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                vocabId = rs.getInt("VocabId");
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }
        return vocabId;
    }

    @Override
    public String toString() {
        return "Vocab{" + "vocabId=" + vocabId + ", vocab=" + vocab + ", meaning=" + meaning + ", partofSpeech=" + partofSpeech + '}';
    }

}
