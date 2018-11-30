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
public class Answer {

    private int answerId;
    private int gameId;
    private String vocab;
    private String status;
    private int usedTime;

    public Answer() {
    }

    public Answer(int gameId, String vocab, String status, int usedTime) {
        this.gameId = gameId;
        this.vocab = vocab;
        this.status = status;
        this.usedTime = usedTime;
    }

    public Answer(ResultSet rs) throws SQLException {
        answerId = rs.getInt("SPVId");
        gameId = rs.getInt("GameId");
        vocab = rs.getString("Vocab");
        status = rs.getString("StatusName");
        usedTime = rs.getInt("UsedTime");
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public String getVocab() {
        return vocab;
    }

    public void setVocab(String vocab) {
        this.vocab = vocab;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUsedTime() {
        return usedTime;
    }

    public void setUsedTime(int usedTime) {
        this.usedTime = usedTime;
    }

    public String addAnswer(int gameId, String vocab, String status, int usedTime) {
        Answer answer = null;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " INSERT INTO `SinglePlayerMode_Vocab`(`Vocab`, `StatusName`, `UsedTime`, `GameId`) VALUES (?,?,?,?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, vocab);
            preparedStmt.setString(2, status);
            preparedStmt.setInt(3, usedTime);
            preparedStmt.setInt(4, gameId);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
        return "Success!!";
    }

    public boolean isRepeat(int gameId, String vocab) {//ใช้servletแทน codeแบบใน TestAnswer
        Answer answer = new Answer();
        boolean repeat = true;
        List<String> vocabs = answer.showAnswerVocabs(1);
        if (vocabs.indexOf("ache") > 0) {
            repeat = false;
        }
        return repeat;
    }

    public List<String> showAnswerVocabs(int gameId) {
        List<String> vocabs = null;
        List<String> blank = null;
        String vocab = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT Vocab FROM `SinglePlayerMode_Vocab` WHERE GameId = '" + gameId + "';");
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
            return blank;
        }
        return vocabs;
    }
    
    public List<String> showCorrectAnswerVocabs(int gameId) {
        List<String> vocabs = null;
        List<String> blank = null;
        String vocab = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT Vocab FROM `SinglePlayerMode_Vocab` WHERE GameId = '" + gameId + "' AND `StatusName` = 'Correct';");
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
            return blank;
        }
        return vocabs;
    }

    public List<Answer> showAllAnswer(int gameId) {
        List<Answer> answers = null;
        Answer answer = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `SinglePlayerMode_Vocab` WHERE GameId = '" + gameId + "';");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    answer = new Answer(rs);
                    if (answers == null) {
                        answers = new ArrayList();
                    }
                    answers.add(answer);
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
        return answers;
    }
        public List<Integer> showAllPlayedGameId() {
        List<Integer> gameIds = null;
        int gameId;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT DISTINCT `GameId` FROM `SinglePlayerMode_Vocab`");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    gameId = rs.getInt("GameId");
                    if (gameIds == null) {
                        gameIds = new ArrayList();
                    }
                    gameIds.add(gameId);
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
        return gameIds;
    } 
    
    public double findAverrageTime(int gameId){
        double avgTime = 0.0;
         try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT AVG(UsedTime) FROM `SinglePlayerMode_Vocab` WHERE GameId = '" + gameId + "';");
            ResultSet rs = pstm.executeQuery();
            avgTime = rs.getDouble("AVG(UsedTime)");
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {
        }
        return avgTime;
    }
    
    public int countAnswer(int gameId){
        int count = 0;
        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT COUNT(*) FROM `SinglePlayerMode_Vocab` WHERE GameId = '" + gameId + "';");
            ResultSet rs = pstm.executeQuery();

            count = rs.getInt("COUNT(*)");
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {
        }
        return count;
    }
    
    @Override
    public String toString() {
        if (status.equalsIgnoreCase("correct")) {
            return "Answer{" + "answerId=" + answerId + ", gameId=" + gameId + ", vocab=" + vocab + ", usedTime=" + usedTime + '}';
        } else {
            return "Answer{" + "answerId=" + answerId + ", gameId=" + gameId + ", vocab=" + vocab + ", status=" + status + '}';
        }
    }

}
