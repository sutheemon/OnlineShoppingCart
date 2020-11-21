/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartTable;
import model.Catalog;
import model.CatalogTable;


/**
 *
 * @author Rung
 */
public class AddCatalogToCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        EntityManager em = (EntityManager) session.getAttribute("entitymanager");
        Cart crt = new Cart();
        Catalog cata = new Catalog();
        Catalog ctlog = CatalogTable.findCatalogById(em,Integer.parseInt(request.getParameter("idCatalog")));
        
        List<Cart> old = CartTable.findCartByIdCatalog(em,ctlog);
        
        if(old == null){
            crt.setIdCatalog(ctlog);
            crt.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            int rowInserted = CartTable.insertCart(em,crt);
            request.setAttribute("rowInserted", rowInserted);
            request.getRequestDispatcher("showcart.jsp").forward(request, response);
        }
        else {
            crt.setIdCart(old.get(0).getIdCart());
            crt.setIdCatalog(ctlog);
            crt.setQuantity(old.get(0).getQuantity()+Integer.parseInt(request.getParameter("quantity")));
            int rowUpdated = CartTable.updateCart(em,crt);
            request.setAttribute("rowUpdated", rowUpdated);
            request.getRequestDispatcher("showcart.jsp").forward(request, response);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
