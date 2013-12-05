package com.bestbuy.pojo;
// Generated Dec 4, 2013 4:56:46 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Producttype generated by hbm2java
 */
@Entity
@Table(name="producttype"
    ,catalog="bestbuy"
)
public class Producttype  implements java.io.Serializable {


     private Integer id;
     private String name;
     private Set products = new HashSet(0);

    public Producttype() {
    }

    public Producttype(String name, Set products) {
       this.name = name;
       this.products = products;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="Id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="Name", length=100)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="producttype")
    public Set getProducts() {
        return this.products;
    }
    
    public void setProducts(Set products) {
        this.products = products;
    }




}

