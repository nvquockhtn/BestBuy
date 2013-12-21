/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
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
	@Transactional(readOnly =true)
	public ArrayList<Comment> getListCommentByIdAccount(int IdAccount) {
		ArrayList<Comment> listAccount = new ArrayList<Comment>();
		try
		{
			String hql = "from Comment s left join fetch s.account where s.account.id="+ IdAccount;
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        listAccount = (ArrayList<Comment>) query.list();
		}catch(Exception ex)
		{
			
		}
		return listAccount;
	}
	@Transactional
	public boolean deleteCommentByIdComment(int IdComment) {
		Comment cmt = getCommentById(IdComment);
		boolean kq = true;
        try {
            sessionFactory.getCurrentSession().delete(cmt);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
	@Transactional
	public Comment getCommentById(int IdComment) {
		String hql = "from Comment a where a.id= " + IdComment;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return (Comment) query.uniqueResult();
	}
    
}
