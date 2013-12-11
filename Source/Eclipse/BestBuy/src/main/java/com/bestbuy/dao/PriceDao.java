package com.bestbuy.dao;

import java.util.ArrayList;

public class PriceDao {
	public ArrayList<Price> getListFromPrices()
	{
		ArrayList<Price> listPrices = new ArrayList<Price>();
		listPrices.add(new Price(1,"1000000",1000000 ));
		listPrices.add(new Price(2,"2000000",2000000 ));
		listPrices.add(new Price(3,"3000000",3000000 ));
		listPrices.add(new Price(4,"4000000",4000000 ));
		return listPrices;
	}
	public ArrayList<Price> getListEndPrices()
	{
		ArrayList<Price> listPrices = new ArrayList<Price>();
		listPrices.add(new Price(5,"6000000",6000000 ));
		listPrices.add(new Price(6,"7000000",7000000 ));
		listPrices.add(new Price(7,"8000000",8000000 ));
		listPrices.add(new Price(8,"9000000",9000000 ));
		return listPrices;
	}
}
