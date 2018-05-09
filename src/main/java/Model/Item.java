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
public class Item {

    private int itemId;
    private String itemName;
    private String description;
    private String type;

    public Item() {
    }

    public Item(String itemName, String description, String type) {
        this.itemName = itemName;
        this.description = description;
        this.type = type;
    }

    public Item(ResultSet rs) throws SQLException {
        itemId = rs.getInt("ItemId");
        itemName = rs.getString("ItemName");
        description = rs.getString("Description");
        type = rs.getString("Type");
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Item ShowItem(int itemId) {
        Item item = null;
        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Item` WHERE ItemId = '" + itemId + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                item = new Item(rs);
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }
        return item;
    }

    @Override
    public String toString() {
        return "Item{" + "itemId=" + itemId + ", itemName=" + itemName + ", description=" + description + ", type=" + type + '}';
    }

}
