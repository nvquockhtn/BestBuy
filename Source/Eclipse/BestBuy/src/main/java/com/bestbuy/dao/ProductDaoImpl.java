/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Image;
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
		String hql = "from Product a left join fetch a.productstate left join fetch a.producttype where a.productstate.id=3 and a.producttype.id = " + type;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        //query.setInteger("idtype", type);
        ArrayList<Product> ds = (ArrayList<Product>)query.list();
        for(int i=0;i<ds.size();i++)
        {
        	Hibernate.initialize(ds.get(i).getImages());
        }
        /*String hql = "from Account a where a.username=:userName";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("userName", acc.getUsername());*/
        return ds;
	}

	@Transactional(readOnly = true)
	public Product getProductById(Integer maSp) {
		Product product = null;
		product = (Product) sessionFactory.getCurrentSession().get(Product.class, maSp);
		return product;
	}
    
}
