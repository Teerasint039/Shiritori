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
public class TestAnswer {
    public static void main(String[] args) {
        Answer answer = new Answer();
        String vocab1 = "ache";
        String vocab2 = "arm";
        List<String> vocabs = answer.showAnswerVocabs(1);
//        for (String a : vocabs) {
//            System.out.println(a.toString());
//        }
//        System.out.println("ache: "+vocabs.indexOf("ache"));
        if (vocabs.indexOf(vocab2)>=0) {
            System.out.println("Repeat"); //repeat status
        }else{
            System.out.println("Not Repeat");
        }
//        System.out.println("arm: "+vocabs.indexOf("arm"));
//        System.out.println(answer.showAnswerVocab(1));
    }
    
}