<%-- 
    Document   : confirmOrder
    Created on : Nov 21, 2020, 1:16:06 PM
    Author     : Rung
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Order</title>
        
         <style>
           
            .button {
                background-color: #ff6d6d;
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
             }
             
             .success {
                background-color: #53d85e;
             }
        </style>
    </head>
    <body>
        <%
            double total = (Double) request.getAttribute("total");
            
        %>
        <h1>Your Order is confiemed!</h1>
        <h1>The total amount is $<%= total %></h1>
        <a href="index" class="button success">Success</a>

    </body>
</html>
