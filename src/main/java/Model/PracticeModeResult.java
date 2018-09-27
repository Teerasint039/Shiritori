/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Teerasint
 */
public class PracticeModeResult {
    private int practiceGameId;
    private int countCorrect;
    private int vocabInAnswerId;
    private String vocab;
    private int gameId;
    private int usedTime;

    public PracticeModeResult(int practiceGameId, int countCorrect, int vocabInAnswerId, String vocab, int gameId, int usedTime) {
        this.practiceGameId = practiceGameId;
        this.countCorrect = countCorrect;
        this.vocabInAnswerId = vocabInAnswerId;
        this.vocab = vocab;
        this.gameId = gameId;
        this.usedTime = usedTime;
    }

    public String getVocab() {
        return vocab;
    }

    public void setVocab(String vocab) {
        this.vocab = vocab;
    }

    public PracticeModeResult() {
    }

    public int getPracticeGameId() {
        return practiceGameId;
    }

    public void setPracticeGameId(int practiceGameId) {
        this.practiceGameId = practiceGameId;
    }

    public int getCountCorrect() {
        return countCorrect;
    }

    public void setCountCorrect(int countCorrect) {
        this.countCorrect = countCorrect;
    }

    public int getVocabInAnswerId() {
        return vocabInAnswerId;
    }

    public void setVocabInAnswerId(int vocabInAnswerId) {
        this.vocabInAnswerId = vocabInAnswerId;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public int getUsedTime() {
        return usedTime;
    }

    public void setUsedTime(int usedTime) {
        this.usedTime = usedTime;
    }
    
    public String checkAnswer(String vocab, String answer){
        String status = "";
        if (vocab.equalsIgnoreCase(answer)) {
            status = "Correct";
        }else{
            status = "Incorrect";
        }
        return status;
    }
    
    public void addAnswer(String status, int vocabId, String answerVocab,int gameId){
        CategoryVocab cv = null;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into `PracticeMode_Vocab` (status, vocabId, answerVocab, GameId)"
                    + " values (?, ?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, status);
            preparedStmt.setInt(2, vocabId);
            preparedStmt.setString(3, answerVocab);
            preparedStmt.setInt(4, gameId);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }
    
}
