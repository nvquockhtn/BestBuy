/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Comment;

/**
 *
 * @author VanQuoc-CNTT
 */
@Repository
public class CommentDaoImpl extends DaoSupport implements CommentDao{

	@Transactional
	public boolean add(Comment comment) {
		boolean kq = true;
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(comment);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
    
}
