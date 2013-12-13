/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Account;
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
		return null;
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
	        String hql = "from Receiver a where a.email = '" + email.trim() +"'";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
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
			String hql = "from Receiver a where a.email = '" + email.trim() +"'";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        return (Receiver) query.uniqueResult();
		}catch(Exception e)
		{
			return null;
			
		}
	}
}
