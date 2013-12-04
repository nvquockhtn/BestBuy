/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author VanQuoc-CNTT
 */
public abstract class DaoSupport {

    protected SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Transactional
    public void add(Object obj) {
        sessionFactory.getCurrentSession().saveOrUpdate(obj);
    }
    

    /**
     *
     */
    public DaoSupport() {
        // TODO Auto-generated constructor stub
    }
}
