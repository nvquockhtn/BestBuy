package com.bestbuy.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.bestbuy.pojo.Product;

public interface ProductCompareDao {
	public ArrayList<Product> GetProductsCompare(HttpSession session);
	public boolean AddProductToListCompare(int idProducts);
	public boolean DeleteProductFromListCompare(HttpSession session);
}
