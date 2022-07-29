<%-- 
    Document   : index
    Created on : 15/05/2022, 11:59:41 AM
    Author     : erenc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Device Management</title>
    </head>
    <body>
        <h1>Device Catalogue</h1>
        <%
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Product;create=true");
            Statement statement = con.createStatement() ;
            ResultSet resultset = statement.executeQuery("SELECT * FROM Product ORDER BY prodID ASC");
        %> 
    <TABLE BORDER="1">
    <TR>
      <TH>ID</TH>
      <TH>Name</TH>
      <TH>Desc</TH>
      <TH>Cost</TH>
      <TH>Stock</TH>
    </TR><% while(resultset.next()){ %> <TR>
      <TD><%= resultset.getString(1) %> </td>
      <TD><%= resultset.getString(2) %> </TD>
      <TD><%= resultset.getString(3) %> </TD>
      <TD><%= resultset.getString(4) %> </TD>
      <TD><%= resultset.getString(5) %> </TD>
      <TD>
          <a href=deleteDevice?id=<%=resultset.getString(1)%>> X </a>
      </TD>
      <TD>
          <a href=updateDevice.jsp?id=<%=resultset.getString(1)%>&name=<%=resultset.getString(2)%>> i </a>
      </TD>
    </TR><% } %>
  </TABLE>
    <a href="addDevice.jsp">Add Device</a>
    <a href="home.jsp">Home</a>
    </body>
</html>