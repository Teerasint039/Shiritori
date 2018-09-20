/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Teerasint
 */
public class PracticeModeResult {
    private int practiceGameId;
    private int countCorrect;
    private int vocabInAnswerId;
    private int gameId;
    private int usedTime;

    public PracticeModeResult(int countCorrect, int vocabInAnswerId, int gameId, int usedTime) {
        this.countCorrect = countCorrect;
        this.vocabInAnswerId = vocabInAnswerId;
        this.gameId = gameId;
        this.usedTime = usedTime;
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
    
}
