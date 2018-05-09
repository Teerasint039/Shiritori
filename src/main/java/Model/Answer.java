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

    public void addAnswer(int gameId, String vocab, String status, int usedTime) {
        Answer answer = null;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into "
                    + "SinglePlayerMode_Vocab (Vocab, Status, UsedTime)"
                    + " values (?, ?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setInt(1, gameId);
            preparedStmt.setString(2, vocab);
            preparedStmt.setString(3, status);
            preparedStmt.setInt(4, usedTime);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }

    public boolean IsRepeat(String vocab) {
        boolean repeat = true;
        List<Answer> answers = null;
        Answer answer = null;
        List<String> vocabs = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `SinglePlayerMode_Vocab`");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    answer = new Answer(rs);
                    if (answers == null) {
                        answers = new ArrayList();
                    }
                    answers.add(answer);
                    vocabs.add(answer.getVocab());
                }
                if (vocabs.indexOf(vocab) != -1) {
                    repeat = false;
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
        return repeat;
    }

    public List<Answer> showAllAnswer(int gameId) {
        List<Answer> answers = null;
        Answer answer = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `SinglePlayerMode_Vocab` WHERE GameId = '"+gameId+"';");
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

    @Override
    public String toString() {
        if (status.equalsIgnoreCase("correct")) {
            return "Answer{" + "answerId=" + answerId + ", gameId=" + gameId + ", vocab=" + vocab + ", usedTime=" + usedTime + '}';
        }
        else
            return "Answer{" + "answerId=" + answerId + ", gameId=" + gameId + ", vocab=" + vocab + ", status=" + status + '}';
    }

}
