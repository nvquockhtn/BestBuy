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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name="product"
    ,catalog="bestbuy"
)
public class Product  implements java.io.Serializable {


     private Integer id;
     private Producttype producttype;
     private Productstate productstate;
     private String name;
     private String overview;
     private String specification;
     private Integer price;
     private Float discount;
     private Integer productId;
     private Set comments = new HashSet(0);
     private Set images = new HashSet(0);
     private Set orderdetails = new HashSet(0);

    public Product() {
    }

	
    public Product(Producttype producttype, Productstate productstate) {
        this.producttype = producttype;
        this.productstate = productstate;
    }
    public Product(Producttype producttype, Productstate productstate, String name, String overview, String specification, Integer price, Float discount, Integer productId, Set comments, Set images, Set orderdetails) {
       this.producttype = producttype;
       this.productstate = productstate;
       this.name = name;
       this.overview = overview;
       this.specification = specification;
       this.price = price;
       this.discount = discount;
       this.productId = productId;
       this.comments = comments;
       this.images = images;
       this.orderdetails = orderdetails;
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
    @JoinColumn(name="TypeId", nullable=false)
    public Producttype getProducttype() {
        return this.producttype;
    }
    
    public void setProducttype(Producttype producttype) {
        this.producttype = producttype;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="StateId", nullable=false)
    public Productstate getProductstate() {
        return this.productstate;
    }
    
    public void setProductstate(Productstate productstate) {
        this.productstate = productstate;
    }
    
    @Column(name="Name", length=200)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name="Overview", length=65535)
    public String getOverview() {
        return this.overview;
    }
    
    public void setOverview(String overview) {
        this.overview = overview;
    }
    
    @Column(name="Specification")
    public String getSpecification() {
        return this.specification;
    }
    
    public void setSpecification(String specification) {
        this.specification = specification;
    }
    
    @Column(name="Price")
    public Integer getPrice() {
        return this.price;
    }
    
    public void setPrice(Integer price) {
        this.price = price;
    }
    
    @Column(name="Discount", precision=12, scale=0)
    public Float getDiscount() {
        return this.discount;
    }
    
    public void setDiscount(Float discount) {
        this.discount = discount;
    }
    
    @Column(name="ProductId")
    public Integer getProductId() {
        return this.productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="product")
    public Set getComments() {
        return this.comments;
    }
    
    public void setComments(Set comments) {
        this.comments = comments;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="product")
    public Set getImages() {
        return this.images;
    }
    
    public void setImages(Set images) {
        this.images = images;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="product")
    public Set getOrderdetails() {
        return this.orderdetails;
    }
    
    public void setOrderdetails(Set orderdetails) {
        this.orderdetails = orderdetails;
    }




}

