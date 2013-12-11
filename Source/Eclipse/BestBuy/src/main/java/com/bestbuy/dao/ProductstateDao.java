package com.bestbuy.dao;

import java.util.ArrayList;
import com.bestbuy.pojo.Productstate;

public interface ProductstateDao
{
	public ArrayList<Productstate> getListProductstates();
	public Productstate getProductstateById(int id);
}
