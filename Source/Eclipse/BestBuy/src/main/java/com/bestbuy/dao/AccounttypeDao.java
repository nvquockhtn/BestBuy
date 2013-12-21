package com.bestbuy.dao;

import java.util.ArrayList;

import com.bestbuy.pojo.Accounttype;


public interface AccounttypeDao {
	public ArrayList<Accounttype> getListAccounttypes();
	public Accounttype getAccounttypeById(int id);
}
