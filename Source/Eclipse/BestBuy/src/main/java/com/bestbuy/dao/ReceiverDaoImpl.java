/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

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
    
}
