package com.bestbuy.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bestbuy.pojo.Manufacturer;



@Repository
public class ManufacturerDaoImpl extends DaoSupport implements ManufacturerDao {

	/**
	 * Lay danh sach tat ca Manufacturer
	 */
	@Transactional(readOnly = true)
	public ArrayList<Manufacturer> getListManufacturers()
	{
		ArrayList<Manufacturer> listmanufacturers = new ArrayList<Manufacturer>();
		try
		{
			//String hql = "select s from Manufacturer s";
			String hql = "from Manufacturer s";
			//from Producttype s
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);
	        listmanufacturers = (ArrayList<Manufacturer>) query.list();
		}catch(Exception ex)
		{
			
		}
		return listmanufacturers;
	}
	/**
	 * Lay Manufacturer by id
	 */
	@Transactional(readOnly = true)
	public Manufacturer getManufacturerById(int id) {
		Manufacturer manufacturer = null;
		try
		{
			manufacturer = (Manufacturer) sessionFactory.getCurrentSession().get(Manufacturer.class, id);
		}catch(Exception e)
		{
		}
		return manufacturer;
	}

}
