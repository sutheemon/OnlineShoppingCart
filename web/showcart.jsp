<%-- 
    Document   : showcart
    Created on : Nov 20, 2020, 10:21:40 PM
    Author     : Rung
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.CartTable"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Cart"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:useBean id="cart" class="model.Cart" scope="request"/>
    <%
            EntityManager em = (EntityManager) session.getAttribute("entitymanager");
            Vector<Cart> cartList = CartTable.findAllCart(em);
            Iterator<Cart> itr = cartList.iterator();
     %>
    <body>
        <center>
            <h1>Catalog Cart</h1>
             <table border="1">
                      <tr>
                        <th hidden>ID</th>
                        <th>Name</th>
                        <th>Rate</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Remove</th>
                      </tr>
                      <%
                           while(itr.hasNext()) {
                               cart = itr.next();
                               out.println("<form name=\"remove\" action=\"RemoveCartController\" method=\"POST\">");
                               out.println("<tr>");
                               out.println("<td hidden><input type=\"number\" name=\"idCart\" value="+cart.getIdCart()+"></input></td>");
                               out.println("<td> "+ cart.getIdCatalog().getName() + "</td>");
                               out.println("<td> "+ cart.getIdCatalog().getRate() + "</td>");
                               out.println("<td> "+ cart.getIdCatalog().getYearDvd() + "</td>");
                               out.println("<td> "+ cart.getIdCatalog().getPrice() + "</td>");
                               out.println("<td> "+ cart.getQuantity() + "</td>");
                               out.println("<td><input type=\"submit\" value=\"Remove\" name=\"submit\"></input></td>");
                               out.println("<tr>");
                               out.println("</form>");
                           }
                      %>
             </table>
             <a href="index">Back to Menu</a>
             <form name="ComfirmOrder" action="ComfirmOrder">
                <input type="submit" value="CheckOut" name="submit" />
             </form>
        </center>
    </body>
</html>
