/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import com.bestbuy.pojo.Order;

/**
 * 
 * @author VanQuoc-CNTT
 */
public interface OrderDao {
	ArrayList<Order> getOrdersByAccountId(int id);

	Order getOrderById(int id);

	public boolean updateOrder(Order order);
}
