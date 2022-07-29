<%-- 
    Document   : addDevice
    Created on : 15/05/2022, 12:08:28 PM
    Author     : erenc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Device</title>
    </head>
    <body>
        <h1>Add Device</h1>
        
    <form action="addDevice" method="post">
      <label for="prodID">ID:</label> <br>
      <input type="text" id="prodID" name="prodID" value=""><br><br>
      
      <label for="prodName">Name:</label> <br>
      <input type="text" id="prodName" name="prodName" value=""><br><br>
      
      <label for="prodDesc">Description:</label> <br>
      <textarea name="prodDesc" id="prodDesc" rows="4" cols="20"></textarea> <br><br>
      
      <label for="prodCost">Cost:</label> <br>
      <input type="text" id="prodCost" name="prodCost" value=""><br><br>
      
      <label for="prodStock">Stock:</label> <br>
      <input type="text" id="prodStock" name="prodStock" value=""><br><br>
      
      <input type="submit" value="addDevice">
    </form>
    </body>
</html>
