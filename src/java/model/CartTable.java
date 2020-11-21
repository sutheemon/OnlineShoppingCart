/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import java.util.Vector;
import javax.persistence.EntityManager;
import javax.persistence.Query;
/**
 *
 * @author Rung
 */
public class CartTable {
    
    public static int insertCart(EntityManager em, Cart crt) {
        try {
            em.getTransaction().begin();
            em.persist(crt);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
            
        }
        return 1;
    }
    
    public static Vector<Cart> findAllCart(EntityManager em) {
        Vector<Cart> cartList = null;
        try {
            cartList = (Vector<Cart>) em.createNamedQuery("Cart.findAll").getResultList();
            //em.close();
            
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return cartList;
    }
    
    public static int removeCart(EntityManager em, int id) {
        try {
            em.getTransaction().begin();
            Cart target = em.find(Cart.class, id);
            if (target == null) {
                return 0;
            }
            em.remove(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
            
        }
        return 1;
    }
    
    public static Cart findCartById(EntityManager em, int id) {
        Cart crt = null;
        try {
            crt = em.find(Cart.class, id);
            //em.close();
            
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return crt;
    }
    
    public static int updateCart(EntityManager em, Cart crt) {
        try {
            em.getTransaction().begin();
            Cart target = em.find(Cart.class, crt.getIdCart());
            if (target == null) {
                return 0;
            }
            target.setQuantity(crt.getQuantity());
            em.persist(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
            
        }
        return 1;
        
    }
    
    public static List<Cart> findCartByIdCatalog(EntityManager em, Catalog idCatalog) {
        List<Cart> cartList = null;
        try {
            cartList =  (List<Cart>) em.createNamedQuery("Cart.findByIdCatalog").setParameter("idCatalog", idCatalog).getResultList();
            
            if(cartList.isEmpty()){
                return null;
            }
            //em.close();
            
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return cartList;
    }
}