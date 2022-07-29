<%-- 
    Document   : addDevice
    Created on : 15/05/2022, 12:08:28 PM
    Author     : erenc
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Device</title>
    </head>
    <body>
        <%
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Product;");
            Statement statement = con.createStatement() ;
            ResultSet resultset = statement.executeQuery("SELECT * FROM Product WHERE prodID ='" + request.getParameter("id") + "'");
            resultset.next();
        %> 
        <h1>Device: <%=resultset.getString(2)%></h1>
    <form action="updateDevice" method="post">
      <label for="prodID">ID:</label> <br>
      <input type="text" id="prodID" name="prodID" value=<%=resultset.getString(1)%>><br><br>
      
      <label for="prodName">Name:</label> <br>
      <input type="text" id="prodName" name="prodName" value=<%=resultset.getString(2)%>><br><br>
      
      <label for="prodDesc">Description:</label> <br>
      <textarea name="prodDesc" id="prodDesc" rows="4" cols="20" value=<%=resultset.getString(3)%>></textarea> <br><br>
      
      <label for="prodCost">Cost:</label> <br>
      <input type="text" id="prodCost" name="prodCost" value=<%=resultset.getString(4)%>><br><br>
      
      <label for="prodStock">Stock:</label> <br>
      <input type="text" id="prodStock" name="prodStock" value=<%=resultset.getString(5)%>><br><br>
      
      <input type="submit" value="updateDevice">
    </form>
    </body>
</html>
