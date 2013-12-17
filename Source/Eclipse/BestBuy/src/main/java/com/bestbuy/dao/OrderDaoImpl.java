/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Orderstate;
import com.bestbuy.pojo.Product;

/**
 * 
 * @author VanQuoc-CNTT
 */

@Repository
public class OrderDaoImpl extends DaoSupport implements OrderDao {

	@Transactional
	public boolean insertNewOrder(Order Order) {
		if (Order.getId() != null) {
			if (checkExistOrderById(Order.getId())) {
				return false;
			}
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
	public ArrayList<Order> getAllOrder() {
		String hql = "from Order";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return (ArrayList<Order>) query.list();
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
	public ArrayList<Order> filterOrdersByStateId(int accId, int stateId) {
		String hql = "select distinct ord from Order ord, Account acc where ord.account.id=:accId";
		if (stateId != -1)
			hql += " and ord.orderstate.id=:stateId";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("accId", accId);

		if (stateId != -1)
			query.setInteger("stateId", stateId);

		return (ArrayList<Order>) query.list();
	}

	@Transactional(readOnly = true)
	public ArrayList<Order> filterOrders(Integer accId, int stateId,
			String fromDate, String toDate) {
		String hql = "select ord from Order ord where 1 = 1";
		if (accId != null)
			hql += "  and ord.account.id=:accId";

		if (stateId != -1)
			hql += " and ord.orderstate.id=:stateId";

		if (fromDate != "")
			hql += "  and ord.createDate>=:fromDate";
		
		if (toDate != "")
			hql += "  and ord.createDate<=:toDate";
		
		hql += " order by ord.createDate desc";
		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		if (accId != null)
			query.setInteger("accId", accId);
		if (stateId != -1)
			query.setInteger("stateId", stateId);
		if (fromDate != "")
			query.setString("fromDate", fromDate);
		if (toDate != "")
			query.setString("toDate", toDate);

		return (ArrayList<Order>) query.list();
	}
}
