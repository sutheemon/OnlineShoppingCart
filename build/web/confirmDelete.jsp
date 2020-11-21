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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Cart crt = (Cart) session.getAttribute("cart");
            
        %>
        <form name="confirmDelete" action="ConfirmDeleteController">
            ID cart: <%= crt.getIdCart() %> </br>
            ID catalog <%= crt.getIdCatalog() %> </br>
            Quantity <%= crt.getQuantity() %> </br>
            <input type="submit" value="delete" name="delete" />
            <input type="submit" value="Cancel" name="cancel" />
            
        </form>
    </body>
</html>
