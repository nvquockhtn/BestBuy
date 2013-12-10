package com.bestbuy.pojo;
// Generated Dec 10, 2013 10:12:57 PM by Hibernate Tools 3.2.1.GA


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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Order generated by hbm2java
 */
@Entity
@Table(name="order"
    ,catalog="bestbuy"
)
public class Order  implements java.io.Serializable {


     private Integer id;
     private Account account;
     private Receiver receiver;
     private Orderstate orderstate;
     private Date createDate;
     private Integer total;
     private Set<Orderdetail> orderdetails = new HashSet<Orderdetail>(0);

    public Order() {
    }

    public Order(Account account, Receiver receiver, Orderstate orderstate, Date createDate, Integer total, Set<Orderdetail> orderdetails) {
       this.account = account;
       this.receiver = receiver;
       this.orderstate = orderstate;
       this.createDate = createDate;
       this.total = total;
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
    @JoinColumn(name="CreatorId")
    public Account getAccount() {
        return this.account;
    }
    
    public void setAccount(Account account) {
        this.account = account;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ReceiverId")
    public Receiver getReceiver() {
        return this.receiver;
    }
    
    public void setReceiver(Receiver receiver) {
        this.receiver = receiver;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="StateId")
    public Orderstate getOrderstate() {
        return this.orderstate;
    }
    
    public void setOrderstate(Orderstate orderstate) {
        this.orderstate = orderstate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="CreateDate", length=10)
    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    @Column(name="Total")
    public Integer getTotal() {
        return this.total;
    }
    
    public void setTotal(Integer total) {
        this.total = total;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="order")
    public Set<Orderdetail> getOrderdetails() {
        return this.orderdetails;
    }
    
    public void setOrderdetails(Set<Orderdetail> orderdetails) {
        this.orderdetails = orderdetails;
    }




}


