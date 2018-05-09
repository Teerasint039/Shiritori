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
public class TestVocab {
    public static void main(String[] args) {
        Vocab vocab = new Vocab();
        Vocab vocabModel = vocab.showVocabDetail("ache");
        
        System.out.println(vocabModel.getVocab());
    }
}
