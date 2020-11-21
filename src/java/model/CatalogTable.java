/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Vector;
import javax.persistence.EntityManager;

/**
 *
 * @author Rung
 */
public class CatalogTable {
    public static Vector<Catalog> findAllCatalog(EntityManager em) {
        Vector<Catalog> catalogList = null;
        try {
            catalogList = (Vector<Catalog>) em.createNamedQuery("Catalog.findAll").getResultList();
            //em.close();
            
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return catalogList;
    }
    public static Catalog findCatalogById(EntityManager em, int id) {
        Catalog cata = null;
        try {
            cata = em.find(Catalog.class, id);
            //em.close();
            
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return cata;
    }
}
