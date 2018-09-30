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
public class TestMethod {
    public static void main(String[] args) {
        
        CategoryVocab cv = new CategoryVocab();
        Vocab vocab = new Vocab();
//        List<String> vocabs = cv.showAllVocabInCategory(1);
//        for (String a : vocabs) {
//            System.out.println(a.toString());
//        }
//        System.out.println("------------------");
//        
//        List<String> vocabs1 = cv.showAllVocabInCategory(2);
//        for (String a : vocabs1) {
//            System.out.println(a.toString());
//        }
//        System.out.println("------------------");
//        
//        List<String> vocabs2 = cv.showAllVocabInCategory(3);
//        for (String a : vocabs2) {
//            System.out.println(a.toString());
//        }
//        System.out.println("------------------");
        
        List<String> vocabs3 = cv.showAllVocabInCategory(4);
        for (String a : vocabs3) {
            System.out.println(a.toString());
        }
        System.out.println(vocabs3.get(1));
        System.out.println("size: "+vocabs3.size());
        System.out.println("-----------------------------");
        
//        List<Integer> vocabIds = cv.showAllVocabIdInCategory(4);
//        for (int a : vocabIds) {
//            System.out.println(a);
//            System.out.println(vocab.getVocabFromId(a));
//        }



        
//        Vocab vocab = new Vocab();
//        List<Vocab> vocabs = vocab.showAllVocabDetailLevel(1);
//        for (Vocab a : vocabs) {
//            System.out.print("VocabId: "+a.getVocabId());
//            System.out.print("Vocab: "+a.getVocab());
//            System.out.print("Part of Speech: "+a.getPartofSpeech());
//            System.out.println("Meaning: "+a.getMeaning());
//        }
        
//        PracticeModeResult pmr = new PracticeModeResult();
//        String status = pmr.checkAnswer("test","tEsT");
//        System.out.println("status: "+status);
        
//        System.out.println();
        
//        Vocab v = new Vocab();
//        System.out.println(v.getVocabFromId(3));
//        
        
    }
}
