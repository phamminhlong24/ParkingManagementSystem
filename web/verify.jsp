<%-- 
    Document   : verify
    Created on : Jun 16, 2022, 10:41:27 AM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <span>We already send a verification  code to your email.</span>
        <font color="green">${REGIS_SUCCESS}</font>
        <font color="red">${Error_Code}</font>
        <form action="mainController" method="post">
            <input type="text" name="authcode" >
            <input type="submit" name="action" value="verify">
        </form>
    </body>
</html>
