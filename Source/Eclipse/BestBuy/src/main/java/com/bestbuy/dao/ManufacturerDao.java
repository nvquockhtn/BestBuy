package com.bestbuy.dao;

import java.util.ArrayList;
import com.bestbuy.pojo.Manufacturer;

public interface ManufacturerDao {
	public ArrayList<Manufacturer> getListManufacturers();
	public Manufacturer getManufacturerById(int id);
}
