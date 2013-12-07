package com.bestbuy.pojo;
// Generated Dec 8, 2013 1:03:58 AM by Hibernate Tools 3.2.1.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Image generated by hbm2java
 */
@Entity
@Table(name="image"
    ,catalog="bestbuy"
)
public class Image  implements java.io.Serializable {


     private Integer id;
     private Product product;
     private String text;
     private String alt;
     private String path;
     private Integer typeId;

    public Image() {
    }

    public Image(Product product, String text, String alt, String path, Integer typeId) {
       this.product = product;
       this.text = text;
       this.alt = alt;
       this.path = path;
       this.typeId = typeId;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="Id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ProductId")
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }
    
    @Column(name="Text", length=200)
    public String getText() {
        return this.text;
    }
    
    public void setText(String text) {
        this.text = text;
    }
    
    @Column(name="Alt", length=200)
    public String getAlt() {
        return this.alt;
    }
    
    public void setAlt(String alt) {
        this.alt = alt;
    }
    
    @Column(name="Path", length=300)
    public String getPath() {
        return this.path;
    }
    
    public void setPath(String path) {
        this.path = path;
    }
    
    @Column(name="TypeId")
    public Integer getTypeId() {
        return this.typeId;
    }
    
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }




}


