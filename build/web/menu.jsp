<%-- 
    Document   : menu
    Created on : Nov 20, 2020, 6:42:36 PM
    Author     : Rung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        
        <style>
            .button {
                background-color: #ff6a6a; /* Green */
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
             }
        </style>
    </head>
    <body>
        <h1>
            <a href="showcatalog.jsp" class="button">Show all catalog</a>
            <br/>
            <a href="showcart.jsp" class="button">Show all cart</a>
        </h1>
    </body>
</html>
