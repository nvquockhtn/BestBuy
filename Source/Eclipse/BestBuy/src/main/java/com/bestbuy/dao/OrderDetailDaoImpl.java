package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Orderdetail;
@Repository
public class OrderDetailDaoImpl extends DaoSupport implements OrderDetailDao {
	@Transactional
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
	@Transactional(readOnly = true)
	public Orderdetail getOrderDetailById(int idOrderdetail) {
		String hql = "from Orderdetail a where a.id= " + idOrderdetail;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        return (Orderdetail) query.uniqueResult();
	}
	@Transactional(readOnly = true)
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
