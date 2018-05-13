/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;

/**
 *
 * @author Teerasint
 */
public class TestVocab {
    public static void main(String[] args) {
        Vocab vocab = new Vocab();
        Vocab vocabModel = vocab.showVocabDetail("ache");
        String vocab1 = "easy";
        List<String> vocabs = vocab.showAllVocab();
         if (vocabs.indexOf(vocab1)>=0) {
            System.out.println("In DB");
        }else{
            System.out.println("Not in DB");//out of scope status
        }
         for(String a : vocabs){
             System.out.println(a);
         }
//        System.out.println("All Vocab: "+vocab.showAllVocab());
//        System.out.println(vocabModel.getMeaning());
//        System.out.println("InDB: "+vocabModel.isInDB("ache"));
//        System.out.println("allVocab: "+vocabModel.showAllVocabDetail());
    }
}
