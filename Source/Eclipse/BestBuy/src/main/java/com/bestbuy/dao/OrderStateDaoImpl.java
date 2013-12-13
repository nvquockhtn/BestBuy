package com.bestbuy.dao;

import org.hibernate.Query;

import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Orderstate;

public class OrderStateDaoImpl extends DaoSupport implements OrderStateDao {

	public Orderstate getOrderStateById(int idOrder) {
		String hql = "from Orderstate a where a.id= " + idOrder;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        return (Orderstate) query.uniqueResult();
	}

}
