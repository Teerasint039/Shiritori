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
public class Action {

    private int actionId;
    private String actionName;

    public Action() {
    }

    public Action(int actionId, String actionName) {
        this.actionId = actionId;
        this.actionName = actionName;
    }

    public Action(ResultSet rs) throws SQLException {
        actionId = rs.getInt("ActionId");
        actionName = rs.getString("ActionName");
    }

    public int getActionId() {
        return actionId;
    }

    public void setActionId(int actionId) {
        this.actionId = actionId;
    }

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    public void addAction(String actionName) {
        try {
            Connection conn = Connectionbuilder.connect();
            String query = " insert into Action (ActionName)"
                    + " values (?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, actionName);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (Exception e) {
        }
    }

    public Action ShowAction(int actionId) {
        Action action = null;

        try {
            Connection conn = Connectionbuilder.connect();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM `Action` WHERE ActionId = '" + actionId + "'");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                action = new Action(rs);
            }
            rs.close();
            pstm.close();
            conn.close();
        } catch (Exception ex) {

        }
        return action;
    }

    @Override
    public String toString() {
        return "Action{" + "actionId=" + actionId + ", actionName=" + actionName + '}';
    }

}
