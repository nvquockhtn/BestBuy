package com.bestbuy.dao;

import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Orderstate;

public class OrderStateDaoImpl extends DaoSupport implements OrderStateDao{

	public OrderStateDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Transactional(readOnly = true)
	public Orderstate getById(int id) {
		Orderstate orderState = null;
		orderState = (Orderstate) sessionFactory.getCurrentSession().get(Orderstate.class, id);
		return orderState;
	}

}
