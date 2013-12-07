package com.bestbuy.pojo;
// Generated Dec 7, 2013 10:06:55 AM by Hibernate Tools 3.2.1.GA


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
 * Orderdetail generated by hbm2java
 */
@Entity
@Table(name="orderdetail"
    ,catalog="bestbuy"
)
public class Orderdetail  implements java.io.Serializable {


     private Integer id;
     private Order order;
     private Product product;
     private Integer quantity;
     private Integer unitPrice;

    public Orderdetail() {
    }

	
    public Orderdetail(Order order, Product product) {
        this.order = order;
        this.product = product;
    }
    public Orderdetail(Order order, Product product, Integer quantity, Integer unitPrice) {
       this.order = order;
       this.product = product;
       this.quantity = quantity;
       this.unitPrice = unitPrice;
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
    @JoinColumn(name="OrderId", nullable=false)
    public Order getOrder() {
        return this.order;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ProductId", nullable=false)
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }
    
    @Column(name="Quantity")
    public Integer getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    
    @Column(name="UnitPrice")
    public Integer getUnitPrice() {
        return this.unitPrice;
    }
    
    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }




}


