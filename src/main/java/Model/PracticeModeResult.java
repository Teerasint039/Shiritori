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
    private int vocabId;
    private String status;
    private String vocabAnswer;
    private int gameId;

    public PracticeModeResult(int practiceGameId, int vocabId, String status, String vocabAnswer, int gameId) {
        this.practiceGameId = practiceGameId;
        this.vocabId = vocabId;
        this.status = status;
        this.vocabAnswer = vocabAnswer;
        this.gameId = gameId;
    }

    public PracticeModeResult() {
    }

    public int getPracticeGameId() {
        return practiceGameId;
    }

    public void setPracticeGameId(int practiceGameId) {
        this.practiceGameId = practiceGameId;
    }

    public int getVocabId() {
        return vocabId;
    }

    public void setVocabId(int vocabId) {
        this.vocabId = vocabId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getVocabAnswer() {
        return vocabAnswer;
    }

    public void setVocabAnswer(String vocabAnswer) {
        this.vocabAnswer = vocabAnswer;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }
//        
//    public String checkAnswer(String vocab, String answer){
//        String status = "";
//        if (vocab.equalsIgnoreCase(answer)) {
//            status = "Correct";
//        }else{
//            status = "Incorrect";
//        }
//        return status;
//    }
    
    public void addAnswer(String status, int vocabId, String answerVocab,int gameId){
        CategoryVocab cv = null;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into `PracticeMode_Vocab` (status, answerVocab, vocabId, GameId)"
                    + " values (?, ?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, status);
            preparedStmt.setString(2, answerVocab);
            preparedStmt.setInt(3, vocabId);
            preparedStmt.setInt(4, gameId);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }
    
}
