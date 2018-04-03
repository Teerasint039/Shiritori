/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Teerasint
 */
import java.sql.*;

public class Mariadb {
    // JDBC driver name and database URL

    static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
    static final String DB_URL = "jdbc:mariadb://54.169.251.235/TestConnectionSPM";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "jamemez007@";

    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to a selected database...");
            conn = DriverManager.getConnection(
                    "jdbc:mariadb://54.169.251.235/TestConnectionSPM", "root", "jamemez007@");
            System.out.println("Connected database successfully...");

            //STEP 4: Execute a query
            System.out.println("Selecting data in given database...");
            stmt = conn.createStatement();

//            String sql = "CREATE TABLE REGISTRATION "
//                    + "(id INTEGER not NULL, "
//                    + " first VARCHAR(255), "
//                    + " last VARCHAR(255), "
//                    + " age INTEGER, "
//                    + " PRIMARY KEY ( id ))";

            String sql = "SELECT * From Helloworld";
            stmt.executeUpdate(sql);
            System.out.println("Selected data in given database...");
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    conn.close();
                }
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        System.out.println("Goodbye!");
    }//end main
}//end JDBCExample
