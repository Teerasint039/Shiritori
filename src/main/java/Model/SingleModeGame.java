/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Teerasint
 */
public class SingleModeGame {

    private int singleModeGameId;
    private int userId;
    private int score;
    private String startTime;
    private String roomCode;

    public SingleModeGame(int userId, String startTime, String roomCode) {
        this.userId = userId;
        this.startTime = startTime;
        this.roomCode = roomCode;
    }

    public SingleModeGame() {
    }

    public SingleModeGame(ResultSet rs) throws SQLException {
        singleModeGameId = rs.getInt("GameId");
        userId = rs.getInt("userId");
        score = rs.getInt("Score");
        startTime = rs.getString("StartTime");
        roomCode = rs.getString("RoomCode");
    }

    public int getSingleModeGameId() {
        return singleModeGameId;
    }

    public void setSingleModeGameId(int singleModeGameId) {
        this.singleModeGameId = singleModeGameId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getStartTime() {
        return startTime;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getRoomCode() {
        return roomCode;
    }

    public void setRoomCode(String roomCode) {
        this.roomCode = roomCode;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public int newGame(int UserId, String roomcode) {
        SingleModeGame smg = null;
        long currentDateTime = System.currentTimeMillis();
        Date currentDate = new Date(currentDateTime);

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timestamp = dateFormat.format(currentDate);
        Timestamp time = null;
        int id = 0;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " INSERT INTO `SinglePlayer_Game`(`UserId`, `StartTime`, `RoomCode`)"
                    + " VALUES ('"+UserId+"','"+timestamp + "','"+roomcode+"')";
            System.out.println("Insert Time: "+timestamp);

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
//            preparedStmt.setInt(1, userId);
//            preparedStmt.setString(2, timestamp);

            // execute the preparedstatement
            preparedStmt.execute();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `SinglePlayer_Game` WHERE `UserId` = '" + UserId + "' AND `StartTime` = '"+timestamp+"';");
            ResultSet rs = pstm.executeQuery();
            
            System.out.println("Select Time: "+timestamp);
            while (rs.next()) {
                smg = new SingleModeGame(rs);
            }
            id = smg.getSingleModeGameId();
            rs.close();
            pstm.close();

            conn.close();
        } catch (Exception e) {
        }
        return id;
    }
    
    public SingleModeGame showGameDetail(int gameId){
        SingleModeGame smg = null;
         try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `SinglePlayer_Game` WHERE GameId = '" + gameId + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                smg = new SingleModeGame(rs);
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }
        return smg;
    }
    
    public static List<SingleModeGame> getGamebyRoomCode(String roomCode) {
        List<SingleModeGame> smgs = null;
        SingleModeGame smg = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `SinglePlayer_Game` WHERE RoomCode = '"+roomCode+"'");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    smg = new SingleModeGame(rs);
                    if (smgs == null) {
                        smgs = new ArrayList();
                    }
                    smgs.add(smg);
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
        return smgs;
    }
    
    public static List<Integer> getAllUserInRoom(String roomCode) {
        List<Integer> userids = null;
        int userid;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT `UserId` FROM `SinglePlayer_Game` WHERE RoomCode = '"+roomCode+"'");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    userid = rs.getInt("UserId");
                    if (userids == null) {
                        userids = new ArrayList();
                    }
                    userids.add(userid);
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
        return userids;
    }
    
    //Add Update gameId (add score)
    public void editScore(int gameId, int score) {
        try {
            Connection conn = Connectionbuilder.connect();

            PreparedStatement pstmu = conn.prepareStatement("UPDATE `SinglePlayer_Game` SET `Score`='"+score+"' WHERE GameId='" + gameId + "';");
            int rsu = pstmu.executeUpdate();
            pstmu.close();
            conn.close();

        } catch (Exception ex) {

        }
    }
    
    public boolean checkUserinRoom(int userId, String roomCode){
        boolean isValid = false;
        List<Integer> Ids = getAllUserInRoom(roomCode);
        if (Ids.indexOf(userId) != -1) {
            isValid = true;
        }
        return isValid;
    }

    @Override
    public String toString() {
        return "SingleModeGame{" + "singleModeGameId=" + singleModeGameId + ", userId=" + userId + ", score=" + score + ", startTime=" + startTime + ", roomCode=" + roomCode + '}';
    }

    

}
