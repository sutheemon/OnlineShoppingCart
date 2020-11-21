<%-- 
    Document   : showcatalog
    Created on : Nov 20, 2020, 6:46:45 PM
    Author     : Rung
--%>

<%@page import="java.util.Vector"%>
<%@page import="model.CatalogTable"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Catalog"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalog List</title>
        
        <style>
            #catalogList {
              font-family: Arial, Helvetica, sans-serif;
              border-collapse: collapse;
              width: 50%;
              box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            }
            
            #catalogList td, #catalogList th {
              border: none;
              padding: 10px;
            }
            
            #catalogList tr:hover {background-color: #edecff;}
            

            #catalogList th {
              padding-top: 12px;
              padding-bottom: 12px;
              text-align: left;
              background-color: #6c79e0;
              color: white;
            }
            
            .button {
                background-color: #4e6aeb;
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
        </style>
    </head>
    <jsp:useBean id="catalog" class="model.Catalog" scope="request"/>
    <%
            EntityManager em = (EntityManager) session.getAttribute("entitymanager");
            Vector<Catalog> catalogList = CatalogTable.findAllCatalog(em);
            Iterator<Catalog> itr = catalogList.iterator();
     %>
    <body>
        <center>
            
            <h1>DVD Catalog</h1>
             <table id="catalogList">
                      <tr>
                        <th hidden>ID</th>
                        <th>Name</th>
                        <th>Rate</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>AddCart</th>
                      </tr>
                      <%
                           while(itr.hasNext()) {
                               catalog = itr.next();
                               out.println("<form name=\"AddCatalog\" action=\"AddCatalogToCartController\" method=\"POST\">");
                               out.println("<tr>");
                               out.println("<td hidden><input type=\"number\" name=\"idCatalog\" value="+catalog.getId()+"></input></td>");
                               out.println("<td> "+ catalog.getName() + "</td>");
                               out.println("<td> "+ catalog.getRate() + "</td>");
                               out.println("<td> "+ catalog.getYearDvd() + "</td>");
                               out.println("<td> "+ catalog.getPrice() + "</td>");
                               out.println("<td><input type=\"text\" name=\"quantity\" value=\"1\"></input></td>");
                               out.println("<td><input class=\"button\" type=\"submit\" value=\"AddToCart\" name=\"submit\"></input></td>");
                               out.println("<tr>");
                               out.println("</form>");
                           }
                      %>
             </table>
             <br/>
             <a href="index" type="button" class="button back">Back to Menu</a>
        </center>
    </body>
</html>