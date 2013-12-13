/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;

import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Receiver;

/**
 *
 * @author VanQuoc-CNTT
 */
public class ReceiverDaoImpl extends DaoSupport implements ReceiverDao{
	public boolean insertNewReceiver(Receiver receiver)
	{
		if (checkExistReceiverById(receiver.getId())) {
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

	public Receiver getReceiverById(int idReceiver) {
		String hql = "from Receiver a where a.id= " + idReceiver;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        return (Receiver) query.uniqueResult();
	}

	public ArrayList<Receiver> getAllReceiver()
	{
		return null;
	}

	public boolean checkExistReceiverById(int idReceiver) {
		String hql = "from Receiver a where a.id= " + idReceiver;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.uniqueResult() != null;
	}
    
}
