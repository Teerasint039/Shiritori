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
public class Vocab {
    private String vocab;
    private String result;

    public Vocab() {
    }

    public Vocab(String vocab, String result) {
        this.vocab = vocab;
        this.result = result;
    }

    public String getVocab() {
        return vocab;
    }

    public void setVocab(String vocab) {
        this.vocab = vocab;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
    
    
}
