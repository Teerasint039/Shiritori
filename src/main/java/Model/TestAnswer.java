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
        List<Answer> answers = answer.showAllAnswer(1);
        for (Answer a : answers) {
            System.out.println(a.toString());
        }
    }
}
