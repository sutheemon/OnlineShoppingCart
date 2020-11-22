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
        <title>Cart</title>
        
        <style>
            .row {
              display: flex;
              flex-direction: row;
              margin: 10px;
              justify-content: center;
            }
            #CartList {
              font-family: Arial, Helvetica, sans-serif;
              border-collapse: collapse;
              width: 50%;
              box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            }
            
            #CartList td, #CartList th {
              border: none;
              padding: 10px;
            }
            
            #CartList tr:hover {background-color: #edecff;}
            

            #CartList th {
              padding-top: 12px;
              padding-bottom: 12px;
              text-align: left;
              background-color: #362f4b;
              color: white;
            }
            
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
             
             .back {
                background-color: #3b3b3b;
             }
             .checkOut {
                background-color: #53d85e;
             }
             .catalog {
                background-color: #77a2ff;
             }
        </style>
        
    </head>
    <jsp:useBean id="cart" class="model.Cart" scope="request"/>
    <%
            Vector<Cart> cartList = CartTable.findAllCart();
            Iterator<Cart> itr = cartList.iterator();
     %>
    <body>
        <center>
            <h1>Catalog Cart</h1>
            <table id="CartList">
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
                               out.println("<td><input class=\"button\" type=\"submit\" value=\"Remove\" name=\"submit\"></input></td>");
                               out.println("<tr>");
                               out.println("</form>");
                           }
                      %>
             </table>
             <br/>
             <div class="row">
             <a href="index" class="button back">Back to Menu</a>
             <a href="showcatalog.jsp" class="button catalog">Back to Catalog</a>
             <form name="ComfirmOrder" action="ComfirmOrder">
                <input type="submit" value="CheckOut" class="button checkOut" name="submit" />
             </form>
             </div>
    </body>
</html>
