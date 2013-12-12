/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Product;

/**
 * 
 * @author VanQuoc-CNTT
 */

@Repository
public class OrderDaoImpl extends DaoSupport implements OrderDao{
	@Transactional
	public boolean insertNewOrder(Order Order)
	{
		if (checkExistOrderById(Order.getId())) {
            return false;
        }
        boolean kq = true;
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(Order);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
	@Transactional(readOnly = true)
	public Order getOrderById(int idOrder) {
		String hql = "from Order a where a.id= " + idOrder;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        return (Order) query.uniqueResult();
	}
	@Transactional(readOnly = true)
	public ArrayList<Order> getAllOrder()
	{
		return null;
	}
	@Transactional(readOnly = true)
	public boolean checkExistOrderById(int idOrder) {
		String hql = "from Order a where a.id= " + idOrder;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.uniqueResult() != null;
	}

	@Transactional(readOnly = true)
	public ArrayList<Order> getOrdersByAccountId(int id) {
		String hql = "select distinct ord from Order ord, Account acc where ord.account.id=:accId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("accId", id);
		
		return (ArrayList<Order>)query.list();
	}
    
}
