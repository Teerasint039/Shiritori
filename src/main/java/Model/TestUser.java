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
public class TestUser {

    public static void main(String[] args) {
//        User user = new User();
//        System.out.println(user.showUser(1).getUserName());
//        
//        Action action = new Action();
//        System.out.println(action.ShowAction(1).getActionName());
//        
//        Item item = new Item();
//        System.out.println(item.ShowItem(1).getItemName());
//        
//        Vocab vocab = new Vocab();
//        System.out.print("Vocab: "+vocab.showVocabDetail(1).getVocab()+", ");
//        System.out.println("Meaning: "+vocab.showVocabDetail(1).getMeaning());
        Answer answer = new Answer();
        List<Answer> answers = answer.showAllAnswer(1);

        if (answers != null) {
            for (Answer a : answers) {
                System.out.println(a.toString());
            }
        }
    }
}
