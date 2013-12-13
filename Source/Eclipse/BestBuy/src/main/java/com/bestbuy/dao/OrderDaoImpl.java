/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;

import com.bestbuy.pojo.Order;

/**
 *
 * @author VanQuoc-CNTT
 */
public class OrderDaoImpl extends DaoSupport implements OrderDao{
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

	public Order getOrderById(int idOrder) {
		String hql = "from Order a where a.id= " + idOrder;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        return (Order) query.uniqueResult();
	}

	public ArrayList<Order> getAllOrder()
	{
		return null;
	}

	public boolean checkExistOrderById(int idOrder) {
		String hql = "from Order a where a.id= " + idOrder;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.uniqueResult() != null;
	}
}
