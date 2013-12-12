/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Product;

/**
 * 
 * @author VanQuoc-CNTT
 */
public class OrderDaoImpl extends DaoSupport implements OrderDao {

	@Transactional(readOnly = true)
	public ArrayList<Order> getOrdersByAccountId(int id) {
		String hql = "select distinct ord from Order ord, Account acc where ord.account.id=:accId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("accId", id);

		return (ArrayList<Order>) query.list();
	}

	@Transactional
	public boolean updateOrder(Order order) {
		boolean kq = true;
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(order);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			kq = false;
		}
		return kq;
	}

	@Transactional(readOnly = true)
	public Order getOrderById(int id) {
		Order order = null;
		order = (Order) sessionFactory.getCurrentSession().get(Order.class, id);
		return order;
	}

}
