/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import com.bestbuy.pojo.Account;
import java.io.Console;
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
}
