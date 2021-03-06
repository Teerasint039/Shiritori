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
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Teerasint
 */
public class Room {
    private String roomCode;
    private String comment;
    private  int level;

    public Room() {
    }

    public Room(String roomCode, String comment, int level) {//auto create new room
        this.roomCode = roomCode;
        this.comment = comment;
        this.level = level;
        
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into Room (RoomCode, Comment, Level)"
                    + " values (?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, roomCode);
            preparedStmt.setString(2, comment);
            preparedStmt.setInt(3,level);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }
    
    public Room(ResultSet rs) throws SQLException {
        roomCode = rs.getString("RoomCode");
        comment = rs.getString("Comment");
        level = rs.getInt("Level");
    }


    public String getRoomCode() {
        return roomCode;
    }

    public void setRoomCode(String roomCode) {
        this.roomCode = roomCode;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
    
    public String createRoom(String roomCode, String comment){
        String status = "";
        
        return status;
    }
    
    public static List<Room> showAllRoom() {
        List<Room> rooms = null;
        Room room = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Room` order by RoomCode DESC");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    room = new Room(rs);
                    if (rooms == null) {
                        rooms = new ArrayList();
                    }
                    rooms.add(room);
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
        return rooms;
    }
    
    public static List<String> showAllRoomCode() {
        List<String> codes = null;
        Room room = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Room`");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    room = new Room(rs);
                    if (codes == null) {
                        codes = new ArrayList();
                    }
                    codes.add(room.getRoomCode());
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
        return codes;
    }
    
     public static List<String> showAllUsedRoomCode() {
        List<String> codes = null;
        String code = null;

        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT DISTINCT `RoomCode` FROM `SinglePlayer_Game`");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    code = rs.getString("RoomCode");
                    if (codes == null) {
                        codes = new ArrayList();
                    }
                    codes.add(code);
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
        return codes;
    }
     
     public boolean checkCanShowResult(String roomcode){
         boolean canShow = false;
         System.out.println("1.1");
         List<String> codes = showAllUsedRoomCode();
         System.out.println("1.2");
         System.out.println("codes: "+codes);
         if (codes != null) {
             if (codes.indexOf(roomcode)!=-1) {
             canShow = true;
         }
         }
         
         return canShow;
     }
    
    public Room showRoom(String roomCode){
        Room rm = null;
        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Room` WHERE RoomCode = '" + roomCode + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                rm = new Room(rs);
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }
        return rm;
    }
    
    public String checkCodeAvailable(String roomCode){
        String status = "";
        String code = showRoom(roomCode).getRoomCode();
        if (code == null) {
            status = "Invalid";
        }else{
            status = "Valid";
        }
        
        return status;
    }
    
    public boolean checkRoomCodeinDB(String roomcode){
        boolean isValid = false;
        List<String> roomcodes = showAllRoomCode();
        if (roomcodes.indexOf(roomcode) != -1) {
            isValid = true;
        }
        return isValid;
    }
    
    public boolean checkGameisinRoom(int gameId){
        boolean inRoom = false;
        
        return inRoom;
    }
    
    public String genRoomCode(){
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 6) { 
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }

    @Override
    public String toString() {
        return "Room{" + "roomCode=" + roomCode + ", comment=" + comment + ", level=" + level + '}';
    }

    public boolean checkRoomCodeisinDB(String roomCode) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
