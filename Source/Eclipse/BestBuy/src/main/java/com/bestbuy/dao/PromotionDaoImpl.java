package com.bestbuy.dao;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Product;
import com.bestbuy.pojo.Promotion;

public class PromotionDaoImpl extends DaoSupport implements PromotionDao {
	@Transactional(readOnly=true)
	public ArrayList<Promotion> getListPromotions() {
		ArrayList<Promotion> listPromotion = new ArrayList<Promotion>();
		try
		{
			String hql = "from Promotion s";
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        listPromotion = (ArrayList<Promotion>) query.list();
		}catch(Exception ex)
		{
			
		}
		return listPromotion;
	}
	@Transactional(readOnly=true)
	public Promotion getPromotionById(int id) {
		Promotion promotion = null;
		try
		{
			promotion = (Promotion) sessionFactory.getCurrentSession().get(Promotion.class, id);
		}catch(Exception e)
		{
		}
		return promotion;
	}
	@Transactional(readOnly=true)
	public int searchPromotionBy(String namePromotion, Date datestart,
			Date dateend, int page, int numberinpage) {
		int numsize = 0;
		try
		{
			String hql = "from Promotion s where 1=1 ";
			if(namePromotion.trim().equals("")==false)
	        {
	            hql = hql + " and s.name like '%" + namePromotion.trim() + "%'";
	        }
	        /*if(idtypemanufacturer!=-1)
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
	        }*/
	        int n = (page-1)*numberinpage;
	        int m = numberinpage;
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        
	        if(query.list().size()>0)
	        {
	        	numsize = query.list().size();
	        }
	        query.setFirstResult(n);
	        query.setMaxResults(m);
	        BestBuyHelperDao.listPromotions  = (ArrayList<Promotion>)query.list();
		}
		catch(Exception ex)
		{
			String s = ex.getMessage();
		}
		return numsize;
	}
	@Transactional
	public boolean addPromotion(Promotion promotion) {
		boolean kq = true;
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(promotion);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			kq = false;
		}
		return kq;
	}
	@Transactional
	public boolean deletePromotionById(int IdPromotion) {
		Promotion promotion = getPromotionById(IdPromotion);
		boolean kq = true;
        try {
            sessionFactory.getCurrentSession().delete(promotion);
        } catch (Exception ex) {
            System.out.println(ex.toString());
            kq = false;
        }
        return kq;
	}
	@Transactional(readOnly=true)
	public boolean checkPromotionExistByName(String name) {
		String hql = "from Promotion a where a.name=:pName";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("pName", name);
        return query.uniqueResult() != null;
	}
	@Transactional
	public boolean updatePromotion(Promotion promotion) {
		boolean kq = true;
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(promotion);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			kq = false;
		}
		return kq;
	}

}
