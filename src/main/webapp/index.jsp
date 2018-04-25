<%-- 
    Document   : index
    Created on : Apr 8, 2018, 2:28:45 AM
    Author     : Teerasint
--%>
<%-- 
    Document   : index
    Created on : Apr 8, 2018, 2:28:45 AM
    Author     : Teerasint
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Connectionbuilder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="myFunction()">
        <H1>Hello Shiritori Game!</H1>
     <!--   <script>
                function myFunction() {
                    setTimeout(function(){
                        window.location.href = "StartPage.jsp";
                    },2000);
                }
        </script> -->
        <% Connection con = Connectionbuilder.connect();
            String vocab;
        //Create Connection Variable from connectionBuilder Method In try for check that can be access to DB
                    //Use Connection Variable to insert DB into statement.
            System.out.println(con);
            Statement statement = con.createStatement();

            //Test processing position after con.createStatement
            System.out.println("test after con.createStatement()");

            // Result set get the result of the SQL query from DB in the statement.
            ResultSet resultSet = statement.executeQuery("select * from Test.Test1;");

            //Test processing position after statement.executeQuery
            System.out.println("test after statement.executeQuery");

            //Declare vocab variable to keep the greeting vocabulary in a String data form.
            vocab = new String();

            //Use While Loop to get result 1st Greeting Vocabulary from result set of the statement 
            while (resultSet.next()) {
                //get result 1st Greeting Vocabulary by greeting column and keep it in vocab variable.
                vocab = resultSet.getString("name");
                //Test Processing: test get vocab variable value
                out.println(vocab);
            }
            
           
        %>
    </body>
</html>
