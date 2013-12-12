package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Orderstate;

public class OrderStateDaoImpl extends DaoSupport implements OrderStateDao {

	public OrderStateDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Transactional(readOnly = true)
	public Orderstate getOrderStateById(int idOrder) {
		Orderstate orderState = null;
		orderState = (Orderstate) sessionFactory.getCurrentSession().get(
				Orderstate.class, idOrder);
		return orderState;
	}

	@Transactional(readOnly = true)
	public ArrayList<Orderstate> getAll() {
		String hql = "from Orderstate";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return (ArrayList<Orderstate>) query.list();
	}

}
