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

/**
 *
 * @author Teerasint
 */
public class SingleModeGame {

    private int singleModeGameId;
    private int userId;
    private String startTime;

    public SingleModeGame() {
    }

    public SingleModeGame(int userId, String startTime) {
        this.userId = userId;
        this.startTime = startTime;
    }

    public SingleModeGame(ResultSet rs) throws SQLException {
        singleModeGameId = rs.getInt("GameId");
        userId = rs.getInt("userId");
        startTime = rs.getString("StartTime");
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

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public int newGame(int UserId) {
        SingleModeGame smg = null;
        long currentDateTime = System.currentTimeMillis();
        Date currentDate = new Date(currentDateTime);

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timestamp = dateFormat.format(currentDate);
        Timestamp time = null;
        int id = 0;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " INSERT INTO `SinglePlayer_Game`(`UserId`, `StartTime`)"
                    + " VALUES ('"+UserId+"','"+timestamp+"')";
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

    @Override
    public String toString() {
        return "SingleModeGame{" + "singleModeGameId=" + singleModeGameId + ", userId=" + userId + ", startTime=" + startTime + '}';
    }

}
