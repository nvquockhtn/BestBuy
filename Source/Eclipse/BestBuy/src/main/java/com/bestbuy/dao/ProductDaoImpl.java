/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Product;





@Repository
public class ProductDaoImpl extends DaoSupport implements ProductDao{
	@Transactional(readOnly = true)
	public ArrayList<Product> getListDiscountProducts()
	{
		return null;
	}

	@Transactional(readOnly = true)
	public ArrayList<Product> getListNewProducts(int type) {
		// if productstate =3 then return "Moi"
		String hql = "from Product a where a.productstate.id=3";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return (ArrayList<Product>)query.list();
	}
    
}
