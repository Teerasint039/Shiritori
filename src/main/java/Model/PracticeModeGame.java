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
public class PracticeModeGame {
    private int practiceModeGameId;
    private int userId;
    private String startTime;

    public PracticeModeGame() {
    }

    public PracticeModeGame(int userId, String startTime) {
        this.userId = userId;
        this.startTime = startTime;
    }

    public PracticeModeGame(ResultSet rs) throws SQLException {
        practiceModeGameId = rs.getInt("GameId");
        userId = rs.getInt("userId");
        startTime = rs.getString("StartTime");
    }

    public int getPracticeModeGameId() {
        return practiceModeGameId;
    }

    public void setPracticeModeGameId(int practiceModeGameId) {
        this.practiceModeGameId = practiceModeGameId;
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
        PracticeModeGame smg = null;
        long currentDateTime = System.currentTimeMillis();
        Date currentDate = new Date(currentDateTime);

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timestamp = dateFormat.format(currentDate);
        Timestamp time = null;
        int id = 0;
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " INSERT INTO `Practice_Game`(`UserId`, `StartTime`)"
                    + " VALUES ('"+UserId+"','"+timestamp+"')";
            System.out.println("Insert Time: "+timestamp);

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
//            preparedStmt.setInt(1, userId);
//            preparedStmt.setString(2, timestamp);

            // execute the preparedstatement
            preparedStmt.execute();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Practice_Game` WHERE `UserId` = '" + UserId + "' AND `StartTime` = '"+timestamp+"';");
            ResultSet rs = pstm.executeQuery();
            
            System.out.println("Select Time: "+timestamp);
            while (rs.next()) {
                smg = new PracticeModeGame(rs);
            }
            id = smg.getPracticeModeGameId();
            rs.close();
            pstm.close();

            conn.close();
        } catch (Exception e) {
        }
        return id;
    }
    
    public PracticeModeGame showGameDetail(int gameId){
        PracticeModeGame smg = null;
         try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Practice_Game` WHERE GameId = '" + gameId + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                smg = new PracticeModeGame(rs);
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
        return "PracticeModeGame{" + "practiceModeGameId=" + practiceModeGameId + ", userId=" + userId + ", startTime=" + startTime + '}';
    }
}
