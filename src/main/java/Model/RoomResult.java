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

    private RoomResult(ResultSet rs) throws SQLException {
        userName = rs.getString("UserName");
        score  =rs.getInt("Score");
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
        System.out.println("step 1");
        if (room.checkCanShowResult(roomCode)) {
            try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT DISTINCT * FROM `RoomResult` WHERE RoomCode = '"+roomCode+"' ORDER by Score DESC");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    result = new RoomResult(rs);
                    if (results == null) {
                        results = new ArrayList();
                    }
                    results.add(result);
                }
                rs.close();
                pstm.close();
                conn.close();
            } catch (Exception ex) {
                Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Vocab.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        return results;
    }

    @Override
    public String toString() {
        return "RoomResult{" + "userName=" + userName + ", score=" + score + '}';
    }

}
