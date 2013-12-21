/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import com.bestbuy.pojo.Account;

import java.io.Console;
import java.util.ArrayList;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author VanQuoc-CNTT
 */

@Repository
public class AccountDaoImpl extends DaoSupport implements AccountDao {

    @Transactional(readOnly = true)
    public boolean checkExistByUserName(Account acc) throws HibernateException {
        String hql = "from Account a where a.username=:userName";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("userName", acc.getUsername());
        return query.uniqueResult() != null;
    }

    @Transactional
    public boolean addAccount(Account acc) {
        if (checkExistByUserName(acc)) {
            return false;
        }
        boolean kq = true;
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(acc);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
    }

    @Transactional(readOnly = true)
    public Account login(String username, String pass) {
        String hql = "from Account a where a.username=:userName and a.password=:pass";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("userName", username);
        query.setString("pass", pass);

        return (Account) query.uniqueResult();
    }

    @Transactional(readOnly = true)
    public Account getAccountByUserName(String username) {
        String hql = "from Account a where a.username=:userName";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("userName", username);

        return (Account) query.uniqueResult();
    }
    @Transactional
	public boolean insertNewAccount(Account account)
	{
        boolean kq = true;
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(account);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
	@Transactional(readOnly=true)
	public Account getAccountById(int idAccount) {
		String hql = "from Account a where a.id= " + idAccount;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return (Account) query.uniqueResult();
	}
	@Transactional(readOnly=true)
	public ArrayList<Account> getAllAccount() {
		ArrayList<Account> listAccount = new ArrayList<Account>();
		try
		{
			String hql = "from Account s";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        listAccount = (ArrayList<Account>) query.list();
		}catch(Exception ex)
		{
			
		}
		return listAccount;
	}
	@Transactional(readOnly=true)
	public int searchAccountBy(String fullname, String address, String email,
			boolean isBlock, boolean isActive, int typeId, int page, int numberinpage){
		int numsize = 0;
		try
		{
			String hql = "from Account  s left join fetch s.accounttype where 1=1 ";
			if(fullname.trim().equals("")==false)
	        {
	            hql = hql + " and s.fullName like '%" + fullname.trim() + "%'";
	        }
			if(address.trim().equals("")==false)
	        {
	            hql = hql + " and s.address like '%" + address.trim() + "%'";
	        }
			if(email.trim().equals("")==false)
	        {
	            hql = hql + " and s.email like '%" + email.trim() + "%'";
	        }
	        if(typeId!=-1)
	        {
	            hql = hql + " and s.accounttype.id = " + typeId;
	        }
	        hql = hql + " and s.isBlock = " + Boolean.toString(isBlock);
	        hql = hql + " and s.isActive = " + Boolean.toString(isActive);
	       
	        int n = (page-1)*numberinpage;
	        int m = numberinpage;
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        
	        if(query.list().size()>0)
	        {
	        	numsize = query.list().size();
	        }
	        query.setFirstResult(n);
	        query.setMaxResults(m);
	        BestBuyHelperDao.listAccounts  = (ArrayList<Account>)query.list();
	        for(int i=0;i<BestBuyHelperDao.listAccounts.size();i++)
	        {
	        	Hibernate.initialize(BestBuyHelperDao.listAccounts.get(i).getAccounttype());
	        }
		}
		catch(Exception ex)
		{
			String s = ex.getMessage();
		}
		return numsize;
	}
	@Transactional
	public boolean updateAccout(Account account) {
		boolean kq = true;
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(account);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
	@Transactional
	public boolean deleteAccount(Account accout) {
		boolean kq = true;
        try {
            sessionFactory.getCurrentSession().delete(accout);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
}
