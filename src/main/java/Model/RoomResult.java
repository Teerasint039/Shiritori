/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Teerasint
 */
public class RoomResult {

    private String userName;
    private int score;

    public RoomResult(String userName, int score) {
        this.userName = userName;
        this.score = score;
    }

    public RoomResult() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public static List<RoomResult> showRoomResult(String roomCode) {
        List<RoomResult> results = null;
        RoomResult result = new RoomResult();
        User user = new User();
        Room room = new Room();
        SingleModeGame smg = new SingleModeGame();
        if (room.checkCanShowResult(roomCode)) {
            System.out.println("showRoomResult method");
            List<SingleModeGame> smgs = smg.getGamebyRoomCode(roomCode);
            for (SingleModeGame sin : smgs) {
                result = new RoomResult(user.getUserNameFromID(sin.getUserId()), sin.getScore());
                if (results == null) {
                    results = new ArrayList();
                }
                results.add(result);
            }
        }
        return results;
    }

    @Override
    public String toString() {
        return "RoomResult{" + "userName=" + userName + ", score=" + score + '}';
    }

}
