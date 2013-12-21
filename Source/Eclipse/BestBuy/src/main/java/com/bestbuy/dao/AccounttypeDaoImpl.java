package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Accounttype;

public class AccounttypeDaoImpl extends DaoSupport implements AccounttypeDao{
	@Transactional(readOnly = true)
	public ArrayList<Accounttype> getListAccounttypes() {
		ArrayList<Accounttype> listAccounttypes = new ArrayList<Accounttype>();
		try
		{
			String hql = "from Accounttype s";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        listAccounttypes = (ArrayList<Accounttype>) query.list();
		}catch(Exception ex)
		{
		}
		return listAccounttypes;
	}
	@Transactional(readOnly = true)
	public Accounttype getAccounttypeById(int id) {
		Accounttype accounttype = null;
		try
		{
			accounttype = (Accounttype) sessionFactory.getCurrentSession().get(Accounttype.class, id);
		}catch(Exception e)
		{
		}
		return accounttype;
	}

}
