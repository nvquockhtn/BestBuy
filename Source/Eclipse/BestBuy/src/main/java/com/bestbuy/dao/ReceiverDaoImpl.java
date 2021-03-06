/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Receiver;

/**
 *
 * @author VanQuoc-CNTT
 */
@Repository
public class ReceiverDaoImpl extends DaoSupport implements ReceiverDao{
	@Transactional
	public boolean insertNewReceiver(Receiver receiver)
	{
		if (checkExistByEmail(receiver.getEmail())) {
            return false;
        }
        boolean kq = true;
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(receiver);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
	@Transactional(readOnly = true)
	public Receiver getReceiverById(int idReceiver) {
		String hql = "from Receiver a where a.id= " + idReceiver;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return (Receiver) query.uniqueResult();
	}
	@Transactional(readOnly = true)
	public ArrayList<Receiver> getAllReceiver()
	{

		ArrayList<Receiver> listReceiver = new ArrayList<Receiver>();
		try
		{
			String hql = "from Receiver s";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        listReceiver = (ArrayList<Receiver>) query.list();
		}catch(Exception ex)
		{
			
		}
		return listReceiver;
	}
	@Transactional(readOnly = true)
	public boolean checkExistReceiverById(int idReceiver) {
		String hql = "from Receiver a where a.id= " + idReceiver;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.uniqueResult() != null;
	}
	@Transactional(readOnly = true)
    public boolean checkExistByEmail(String email) throws HibernateException {
		/* String hql = "from Account a where a.username=:userName";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        query.setString("userName", acc.getUsername());*/
		try
		{
	        String hql = "from Receiver a where a.email =:eMail";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        query.setString("eMail", email);
	        return query.uniqueResult() != null;
		}catch(Exception ex)
		{
			String s = ex.getMessage();
			return false;
		}
    }
	@Transactional(readOnly = true)
	public Receiver getReceiverByEmail(String email) {
		try
		{
			String hql = "from Receiver a where a.email =:eMail";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        query.setString("eMail", email);
	        return (Receiver) query.uniqueResult();
		}catch(Exception e)
		{
			return null;
			
		}
	}
	@Transactional(readOnly = true)
	public int searchCustomerBy(String name, String email, int page,int numberinpage) {
		int numsize = 0;
		try
		{
			String hql = "from Receiver  s where 1=1 ";
			if(name.trim().equals("")==false)
	        {
	            hql = hql + " and s.fullName like '%" + name.trim() + "%'";
	        }
	        if(email.trim().equals("")==false)
	        {
	            hql = hql + " and s.email = ";
	        }
	        int n = (page-1)*numberinpage;
	        int m = numberinpage;
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        
	        if(query.list().size()>0)
	        {
	        	numsize = query.list().size();
	        }
	        query.setFirstResult(n);
	        query.setMaxResults(m);
	        BestBuyHelperDao.listReceivers  = (ArrayList<Receiver>)query.list();
		}
		catch(Exception ex)
		{
			String s = ex.getMessage();
		}
		return numsize;
	}
}
