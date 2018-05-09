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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Teerasint
 */
public class ReceivedItem {
    private int receivedItemId;
    private int gameId;
    private int itemId;
    private int amount;
    private String time;

    public ReceivedItem() {
    }

    public ReceivedItem(int gameId, int itemId, int amount, String time) {
        this.gameId = gameId;
        this.itemId = itemId;
        this.amount = amount;
        this.time = time;
    }

    public ReceivedItem(ResultSet rs) throws SQLException {
        receivedItemId = rs.getInt("ReceivedItemId");
        gameId = rs.getInt("GameId");
        itemId = rs.getInt("ItemId");
        amount = rs.getInt("Amount");
        time = rs.getString("Time");
    }
    
    

    public int getReceivedItemId() {
        return receivedItemId;
    }

    public void setReceivedItemId(int receivedItemId) {
        this.receivedItemId = receivedItemId;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
    public void addReceivedItem(int gameId, int itemId){
         Answer answer = null;
         DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
         Date date = new Date();
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into User (GameId, ItemId, Amount, Time)"
                    + " values (?, ?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setInt(1, gameId);
            preparedStmt.setInt(2, itemId);
            preparedStmt.setInt(3, 1);
            preparedStmt.setString(4, dateFormat.format(date));

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }
    
    public List<ReceivedItem> showReceivedLog(int gameId){
        List<ReceivedItem> receivedItems = null;
        ReceivedItem ri = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `ReceivedItem` WHERE GameId = '"+gameId+"';");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    ri = new ReceivedItem(rs);
                    if (receivedItems == null) {
                        receivedItems = new ArrayList();
                    }
                    receivedItems.add(ri);
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
        return receivedItems;
    }
    
    public List<ReceivedItem> showAllReceivedLog(int gameId){
        List<ReceivedItem> receivedItems = null;
        ReceivedItem ri = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `ReceivedItem`");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    ri = new ReceivedItem(rs);
                    if (receivedItems == null) {
                        receivedItems = new ArrayList();
                    }
                    receivedItems.add(ri);
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
        return receivedItems;
    }

    @Override
    public String toString() {
        return "ReceivedItem{" + "receivedItemId=" + receivedItemId + ", gameId=" + gameId + ", itemId=" + itemId + ", amount=" + amount + ", time=" + time + '}';
    }
    
    
}
