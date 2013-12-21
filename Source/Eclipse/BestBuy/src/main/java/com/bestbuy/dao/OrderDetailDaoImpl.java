package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Orderdetail;
@Repository
public class OrderDetailDaoImpl extends DaoSupport implements OrderDetailDao {
	@Transactional
	public boolean insertNewOrderdetail(Orderdetail orderdetail) {
		if(orderdetail.getId()!=null)
		{
			if (checkExistOrderdetailById(orderdetail.getId())) {
	            return false;
	        }
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
	@Transactional(readOnly = true)
	public boolean checkExistOrderdetailById(int idOrderdetail) {
		String hql = "from Orderdetail a where a.id= " + idOrderdetail;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.uniqueResult() != null;
	}
	@Transactional
	public boolean deleteOrderdetailById(int IdOrderdetail) {
		Orderdetail orderdetail = getOrderDetailById(IdOrderdetail);
		boolean kq = true;
        try {
            sessionFactory.getCurrentSession().delete(orderdetail);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
	@Transactional
	public ArrayList<Orderdetail> getListOrderdetailByIdOrder(int IdOrder) {
		ArrayList<Orderdetail> listOrderdetails = new ArrayList<Orderdetail>();
		try
		{
			String hql = "from Orderdetail s left join fetch s.order where s.order.id="+ IdOrder;
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        listOrderdetails = (ArrayList<Orderdetail>) query.list();
	        for(int i=0;i<listOrderdetails.size();i++)
	        {
	        	Hibernate.initialize(listOrderdetails.get(i).getProduct());
	        }
		}catch(Exception ex)
		{
			
		}
		return listOrderdetails;
	}

}
