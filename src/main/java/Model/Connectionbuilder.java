/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author int105
 */
public class Connectionbuilder {
    public static int count=0;

    public static Connection connect() throws ClassNotFoundException, SQLException {

//        final String host = "jdbc:mysql://ec2-13-229-202-236.ap-southeast-1.compute.amazonaws.com:3306/Test";
//        final String host = "jdbc:mysql://13.229.197.174:3306/Shiritori";
        final String host = "jdbc:mysql://db-jnns.phornlert.me:3306/Shiritori";
        final String uName = "root";
        final String uPass = "jamemez007@";
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Driver loaded");

//        Connection con = DriverManager.getConnection(host+"?user="+uName+"&password="+uPass+"&useUnicode=true&characterEncoding=UTF-8");
        Connection con = DriverManager.getConnection(host, uName, uPass);
        System.out.println("Connection created");
        count++;
        System.out.println(count);
        return con;
    }

    public static void main(String[] args) {
        Connection con;
        try {
            con= Connectionbuilder.connect();
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
