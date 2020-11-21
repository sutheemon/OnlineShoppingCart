<%-- 
    Document   : confirmDelete
    Created on : Nov 20, 2020, 11:02:28 PM
    Author     : Rung
--%>

<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete DVD</title>
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
             
             .delete {
                background-color: #ff6a6a;
             }
             .cancel {
                background-color: #362f4b;
             }
        </style>
    </head>
    <body>
        <%
            Cart crt = (Cart) session.getAttribute("cart");
            
        %>
        <form name="confirmDelete" action="ConfirmDeleteController">
            <h1>Delete : DVD Name: <%= crt.getIdCatalog().getName() %></h1>
            <h1>Quantity: <%= crt.getQuantity() %> </h1>
            <input type="submit" value="delete" name="delete" class="button delete"/>
            <input type="submit" value="Cancel" name="cancel" class="button cancel"/>
            
        </form>
    </body>
</html>
