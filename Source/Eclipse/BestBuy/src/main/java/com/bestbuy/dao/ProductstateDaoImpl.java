package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Productstate;
import com.bestbuy.pojo.Producttype;

public class ProductstateDaoImpl extends DaoSupport implements ProductstateDao {
	@Transactional(readOnly = true)
	public ArrayList<Productstate> getListProductstates()
	{
		ArrayList<Productstate> listProductstate = new ArrayList<Productstate>();
		try
		{
			String hql = "from Productstate s";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        listProductstate = (ArrayList<Productstate>) query.list();
		}catch(Exception ex)
		{
			
		}
		return listProductstate;
	}
	@Transactional(readOnly = true)
	public Productstate getProductstateById(int id) {
		Productstate productstate = null;
		try
		{
			productstate = (Productstate) sessionFactory.getCurrentSession().get(Productstate.class, id);
		}catch(Exception e)
		{
		}
		return productstate;
	}

}
