package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Product;
import com.bestbuy.pojo.Producttype;



@Repository
public class ProducttypeDaoImpl extends DaoSupport implements ProducttypeDao  {

	/**
	 * Lay danh sach tat ca producttype
	 */
	@Transactional(readOnly = true)
	public ArrayList<Producttype> getListProducttypes() {
		ArrayList<Producttype> listProducttype = new ArrayList<Producttype>();
		try
		{
			String hql = "from Producttype s";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        listProducttype = (ArrayList<Producttype>) query.list();
		}catch(Exception ex)
		{
			
		}
		return listProducttype;
	}
	/**
	 * Lay Producttype by id
	 */
	@Transactional(readOnly = true)
	public Producttype getProducttypeById(int id) {
		Producttype productype = null;
		try
		{
			productype = (Producttype) sessionFactory.getCurrentSession().get(Producttype.class, id);
		}catch(Exception e)
		{
		}
		return productype;
	}

}
