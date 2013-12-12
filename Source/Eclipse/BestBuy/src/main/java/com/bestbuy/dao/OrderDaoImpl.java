/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Order;

/**
 *
 * @author VanQuoc-CNTT
 */
public class OrderDaoImpl extends DaoSupport implements OrderDao{

	@Transactional(readOnly = true)
	public ArrayList<Order> getOrdersByAccountId(int id) {
		String hql = "select distinct ord from Order ord, Account acc where ord.account.id=:accId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("accId", id);
		
		return (ArrayList<Order>)query.list();
	}
    
}
