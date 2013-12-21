/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Image;
import com.bestbuy.pojo.Orderdetail;
import com.bestbuy.pojo.Product;





@Repository
public class ProductDaoImpl extends DaoSupport implements ProductDao{
	@Transactional
	public boolean saveOrUpdateProduct(Product product) {
		boolean kq = true;
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(product);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			kq = false;
		}
		return kq;
	}
	
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
	@Transactional
	public boolean updateProduct(Product product)
	{
        boolean kq = true;
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(product);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
	@Transactional(readOnly = true)
	public Product getProductById(Integer maSp) {
		Product product = null;
		product = (Product) sessionFactory.getCurrentSession().get(Product.class, maSp);
		return product;
	}
	@Transactional(readOnly = true)
	public int searchProductBy(String nameProduct,int idtypemanufacturer,int idtypeproduct, int pricefrom, int pricend, int idtypestate, int page, int numberinpage) 
	{
		int numsize = 0;
		try
		{
			String hql = "from Product  s left outer join fetch s.manufacturer left outer join fetch s.producttype left outer join fetch s.productstate where 1=1 ";
			if(nameProduct.trim().equals("")==false)
	        {
	            hql = hql + " and s.name like '%" + nameProduct.trim() + "%'";
	        }
	        if(idtypemanufacturer!=-1)
	        {
	            hql = hql + " and s.manufacturer.id = " + idtypemanufacturer;
	        }
	        if(idtypeproduct!=-1)
	        {
	            hql = hql + " and s.producttype.id = "+ idtypeproduct ;
	        }
	        if(pricefrom!=-1 && pricend !=-1)
	        {
	        	hql = hql + " and " + pricefrom +" s.price <= " + pricend;
	        }
	        if(idtypestate!=-1)
	        {
	            hql = hql + " and s.productstate.id = " + idtypestate;
	        }
	        int n = (page-1)*numberinpage;
	        int m = numberinpage;
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        
	        if(query.list().size()>0)
	        {
	        	numsize = query.list().size();
	        }
	        query.setFirstResult(n);
	        query.setMaxResults(m);
	        BestBuyHelperDao.listProducts  = (ArrayList<Product>)query.list();
	        for(int i=0;i<BestBuyHelperDao.listProducts.size();i++)
	        {
	        	Hibernate.initialize(BestBuyHelperDao.listProducts.get(i).getImages());
	        }
		}
		catch(Exception ex)
		{
			String s = ex.getMessage();
		}
		return numsize;
	}

	@Transactional
	public boolean deleteProduct(Product product) {
		 boolean kq = true;
	        try {
	            sessionFactory.getCurrentSession().delete(product);
	        } catch (Exception ex) {
	            System.out.println(ex.toString());
	            kq = false;
	        }
	        return kq;
	}
    
}
