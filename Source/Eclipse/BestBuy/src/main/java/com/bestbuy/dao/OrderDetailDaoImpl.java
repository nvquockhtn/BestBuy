package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;

import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Orderdetail;

public class OrderDetailDaoImpl extends DaoSupport implements OrderDetailDao {

	public boolean insertNewOrderdetail(Orderdetail orderdetail) {
		if (checkExistOrderdetailById(orderdetail.getId())) {
            return false;
        }
        boolean kq = true;
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(orderdetail);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}

	public Orderdetail getOrderDetailById(int idOrderdetail) {
		String hql = "from Orderdetail a where a.id= " + idOrderdetail;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        return (Orderdetail) query.uniqueResult();
	}

	public ArrayList<Orderdetail> getAllOrderDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean checkExistOrderdetailById(int idOrderdetail) {
		String hql = "from Orderdetail a where a.id= " + idOrderdetail;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.uniqueResult() != null;
	}

}
