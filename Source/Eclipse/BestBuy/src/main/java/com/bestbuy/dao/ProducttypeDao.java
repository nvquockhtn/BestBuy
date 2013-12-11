package com.bestbuy.dao;

import java.util.ArrayList;

import com.bestbuy.pojo.Producttype;


public interface ProducttypeDao {
	public ArrayList<Producttype> getListProducttypes();
	public Producttype getProducttypeById(int id);
}
