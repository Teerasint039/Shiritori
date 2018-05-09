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

    public void newGame(int UserId, String startTime) {
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into Action (UserId, StartTime)"
                    + " values (?,?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setInt(1, userId);
            preparedStmt.setString(2, startTime);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
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
