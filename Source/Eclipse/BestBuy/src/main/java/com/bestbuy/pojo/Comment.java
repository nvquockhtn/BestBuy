package com.bestbuy.pojo;
// Generated Dec 9, 2013 11:17:38 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Comment generated by hbm2java
 */
@Entity
@Table(name="comment"
    ,catalog="bestbuy"
)
public class Comment  implements java.io.Serializable {

     private Integer id;
     private Product product;
     private Account account;
     private String text;
     private Date createDate;
     private Float rating;

    public Comment() {
    }

    public Comment(Product product, Account account, String text, Date createDate, Float rating) {
       this.product = product;
       this.account = account;
       this.text = text;
       this.createDate = createDate;
       this.rating = rating;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="Id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="ProductId")
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }
@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="AccountId")
    public Account getAccount() {
        return this.account;
    }
    
    public void setAccount(Account account) {
        this.account = account;
    }
    
    @Column(name="Text", length=65535)
    public String getText() {
        return this.text;
    }
    
    public void setText(String text) {
        this.text = text;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="CreateDate", length=10)
    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    @Column(name="Rating", precision=12, scale=0)
    public Float getRating() {
        return this.rating;
    }
    
    public void setRating(Float rating) {
        this.rating = rating;
    }




}


