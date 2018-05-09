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
public class UserItem {

    private int userItemId;
    private int userId;
    private int itemId;
    private int amount;

    public UserItem() {
    }

    public UserItem(int userId, int itemId, int amount) {
        this.userId = userId;
        this.itemId = itemId;
        this.amount = amount;
    }

    public UserItem(ResultSet rs) throws SQLException {
        userItemId = rs.getInt("UserItemId");
        userId = rs.getInt("UserId");
        itemId = rs.getInt("ItemId");
        amount = rs.getInt("Amount");
    }

    public int getUserItemId() {
        return userItemId;
    }

    public void setUserItemId(int userItemId) {
        this.userItemId = userItemId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
//    *******************************
//Method AddUserItem & AddItemAmount ควรเอามารวมกัน เป็น addItem เช็คก่อนว่ามีItemหรือยัง ถ้ามีก็เพิ่ม ถ้าไม่มีก็สร้าง
//    ********************************

    public void addItem(int userId, int itemId) {
        try {
            Connection conn = Connectionbuilder.connect();

            PreparedStatement pstm = conn.prepareStatement("SELECT Amount FROM UserItem WHERE UserId = '" + userId + "' AND ItemId = '" + itemId + "';");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                amount = rs.getInt("Amount");
            }
            if (amount != 0) {

                int total = amount + 1;
                PreparedStatement pstmu = conn.prepareStatement("UPDATE UserItemId SET Amount= '" + total + "' WHERE UserId='" + userId + "' AND ItemId = '" + itemId + "';");
                pstmu.executeUpdate();

                pstmu.close();
            } else {
                try {
                    PreparedStatement pstmi = conn.prepareStatement(" insert into UserItem (Amount, UserId, ItemId)"+ " values (?, ?, ?)");
                    pstmi.setInt(1, 1);
                    pstmi.setInt(2, userId);
                    pstmi.setInt(3, itemId);
                    pstmi.execute();
                    pstmi.close();
                } catch (Exception e) {
                }
            }

            rs.close();
            pstm.close();
            conn.close();

        } catch (Exception ex) {

        }

    }

    public List<UserItem> showUserItem(int userId) {
        List<UserItem> userItem = null;
        UserItem item = null;
        try {
            Connection conn = Connectionbuilder.connect();

            try {
                PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `UserItem` WHERE UserId = '" + userId + "';");
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    item = new UserItem(rs);
                    if (userItem == null) {
                        userItem = new ArrayList();
                    }
                    userItem.add(item);
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

        return userItem;
    }
//    *********************************

    @Override
    public String toString() {
        return "UserItem{" + "userItemId=" + userItemId + ", userId=" + userId + ", itemId=" + itemId + ", amount=" + amount + '}';
    }

}
