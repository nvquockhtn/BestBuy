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
		// if productstate =3 then return "Moi"
		//String hql = "from Product a where a.productstate.id=3";
		String hql = "from Product a left join fetch a.productstate where a.productstate.id=3";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        //List<Product> ds = query.list();
        ArrayList<Product> ds = (ArrayList<Product>)query.list();
        for(int i=0;i<ds.size();i++)
        {
        	Hibernate.initialize(ds.get(i).getImages());
        }
        
        //return ds.toArray(new ArrayList<Product>);
        return ds;
	}

	@Transactional(readOnly = true)
	public Product getProductById(Integer maSp) {
		Product product = null;
		product = (Product) sessionFactory.getCurrentSession().get(Product.class, maSp);
		return product;
	}
    
}
