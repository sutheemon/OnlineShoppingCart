/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Rung
 */
@Entity
@Table(name = "CATALOG")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Catalog.findAll", query = "SELECT c FROM Catalog c"),
    @NamedQuery(name = "Catalog.findById", query = "SELECT c FROM Catalog c WHERE c.id = :id"),
    @NamedQuery(name = "Catalog.findByName", query = "SELECT c FROM Catalog c WHERE c.name = :name"),
    @NamedQuery(name = "Catalog.findByRate", query = "SELECT c FROM Catalog c WHERE c.rate = :rate"),
    @NamedQuery(name = "Catalog.findByYearDvd", query = "SELECT c FROM Catalog c WHERE c.yearDvd = :yearDvd"),
    @NamedQuery(name = "Catalog.findByPrice", query = "SELECT c FROM Catalog c WHERE c.price = :price")})
public class Catalog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Size(max = 80)
    @Column(name = "NAME")
    private String name;
    @Size(max = 20)
    @Column(name = "RATE")
    private String rate;
    @Size(max = 20)
    @Column(name = "YEAR_DVD")
    private String yearDvd;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRICE")
    private Double price;
    @OneToMany(mappedBy = "idCatalog")
    private Collection<Cart> cartCollection;

    public Catalog() {
    }

    public Catalog(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getYearDvd() {
        return yearDvd;
    }

    public void setYearDvd(String yearDvd) {
        this.yearDvd = yearDvd;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @XmlTransient
    public Collection<Cart> getCartCollection() {
        return cartCollection;
    }

    public void setCartCollection(Collection<Cart> cartCollection) {
        this.cartCollection = cartCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Catalog)) {
            return false;
        }
        Catalog other = (Catalog) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Catalog[ id=" + id + " ]";
    }
    
}
