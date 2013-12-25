package com.bestbuy.pojo;
// Generated Dec 23, 2013 9:03:55 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Promotion generated by hbm2java
 */
@Entity
@Table(name="promotion"
    ,catalog="bestbuy"
)
public class Promotion  implements java.io.Serializable {


     private Integer id;
     private String name;
     private String description;
     private Date datestart;
     private Date dateend;
     private Set<Product> products = new HashSet<Product>(0);

    public Promotion() {
    }

    public Promotion(String name, String description, Date datestart, Date dateend, Set<Product> products) {
       this.name = name;
       this.description = description;
       this.datestart = datestart;
       this.dateend = dateend;
       this.products = products;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    @NotNull
	@Size(min = 1, max = 50)
    @Column(name="name", length=100)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    @NotNull
	@Size(min = 1, max = 50)
    @Column(name="description", length=200)
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="datestart", length=19)
    public Date getDatestart() {
        return this.datestart;
    }
    
    public void setDatestart(Date datestart) {
        this.datestart = datestart;
    }
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="dateend", length=19)
    public Date getDateend() {
        return this.dateend;
    }
    
    public void setDateend(Date dateend) {
        this.dateend = dateend;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="promotion")
    public Set<Product> getProducts() {
        return this.products;
    }
    
    public void setProducts(Set<Product> products) {
        this.products = products;
    }




}

