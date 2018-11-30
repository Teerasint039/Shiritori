/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author int105
 */
public class Connectionbuilder {

    public static int count = 0;

    public static Connection connect() throws ClassNotFoundException, SQLException {

        final String host = "jdbc:mysql://db-project.jnns.cf:3306/Shiritori";
        final String uName = "new";
        final String uPass = "jnns1234@";
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Driver loaded");

//        Connection con = DriverManager.getConnection(host+"?user="+uName+"&password="+uPass+"&useUnicode=true&characterEncoding=UTF-8");
        try {
            Connection con = DriverManager.getConnection(host, uName, uPass);

            System.out.println("Connection created");
            count++;
            System.out.println(count);
            return con;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
    }

    public static void main(String[] args) {
        Connection con;
        try {
            con = Connectionbuilder.connect();
            System.out.println(con);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Connectionbuilder.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("1");
        } catch (SQLException ex) {
            Logger.getLogger(Connectionbuilder.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("2");
        }

    }

}
