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
public class TestTimeStamp {
    public static void main(String[] args) {
        String roomCode = "BBBBBB";
        Room rm = new Room();
        rm = rm.showRoom(roomCode);
        
        RoomResult room = new RoomResult();
        List<RoomResult> results = room.showRoomResult(roomCode);
        int number = 0;
        if (results != null) {
            for (RoomResult a : results) {
                number++;
                System.out.println("number: "+number);
                System.out.println("UserName: "+a.getUserName());
                System.out.println("Score: "+a.getScore());
            }
        }
        
//        User user = new User();
//        System.out.println(user.getUserNameFromID(1));
//        SingleModeGame smg = new SingleModeGame();
//        String roomCode = "AAAAAA";
//        Room rm = new Room();
//        System.out.println(rm.showRoom(roomCode).toString());
//        System.out.println(rm.checkCodeAvailable("AAAAAA"));
//        System.out.println(rm.);
//        
//        List<String> codes = rm.showAllRoomCode();
//
//        if (codes != null) {
//            for (String a : codes) {
//                System.out.println(a);
//            }
//        }
//        System.out.println("Index of AAAAAA:"+codes.indexOf("AAAAAB"));
        
//        smg.editScore(2, 0);
//        System.out.println(smg.newGame(1,"AAAAAA"));
        
    }
}
