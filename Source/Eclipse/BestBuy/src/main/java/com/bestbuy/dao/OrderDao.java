/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;
import java.util.Date;

import com.bestbuy.pojo.Order;

/**
 * 
 * @author VanQuoc-CNTT
 */
public interface OrderDao {
	public boolean insertNewOrder(Order order);

	public ArrayList<Order> getOrdersByAccountId(int id);

	public ArrayList<Order> filterOrdersByStateId(int accId, int stateId);

	public ArrayList<Order> filterOrders(Integer accId, int stateId, String fromDate, String toDate);

	public Order getOrderById(int idOrder);

	public ArrayList<Order> getAllOrder();

	public boolean checkExistOrderById(int idOrder);

	public boolean updateOrder(Order order);
}
