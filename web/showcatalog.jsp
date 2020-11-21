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
        <title>JSP Page</title>
    </head>
    <jsp:useBean id="catalog" class="model.Catalog" scope="request"/>
    <%
            EntityManager em = (EntityManager) session.getAttribute("entitymanager");
            Vector<Catalog> catalogList = CatalogTable.findAllCatalog(em);
            Iterator<Catalog> itr = catalogList.iterator();
     %>
    <body>
        <center>
            <h1>Catalog List</h1>
             <table border="1">
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
                               out.println("<form name=\"addEmployee\" action=\"AddCatalogToCartController\" method=\"POST\">");
                               out.println("<tr>");
                               out.println("<td hidden><input type=\"number\" name=\"idCatalog\" value="+catalog.getId()+"></input></td>");
                               out.println("<td> "+ catalog.getName() + "</td>");
                               out.println("<td> "+ catalog.getRate() + "</td>");
                               out.println("<td> "+ catalog.getYearDvd() + "</td>");
                               out.println("<td> "+ catalog.getPrice() + "</td>");
                               out.println("<td><input type=\"text\" name=\"quantity\" value=\"0\"></input></td>");
                               out.println("<td><input type=\"submit\" value=\"AddToCart\" name=\"submit\"></input></td>");
                               out.println("<tr>");
                               out.println("</form>");
                           }
                      %>
             </table>
             <a href="index">Back to Menu</a>
        </center>
    </body>
</html>