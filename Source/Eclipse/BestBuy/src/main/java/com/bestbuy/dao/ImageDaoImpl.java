/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Image;

/**
 * 
 * @author VanQuoc-CNTT
 */
public class ImageDaoImpl extends DaoSupport implements ImageDao {

	@Transactional
	public boolean saveOrUpdateImage(Image img) {
		boolean kq = true;
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(img);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			kq = false;
		}
		return kq;
	}

	@Transactional(readOnly=true)
	public ArrayList<Image> getImagesByProductId(int id) {
		String hql = "from Image a where a.product.id=:id";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger("id", id);
        return (ArrayList<Image>) query.list();
	}

}
