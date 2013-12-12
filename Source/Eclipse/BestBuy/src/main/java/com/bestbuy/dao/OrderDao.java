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
	public boolean insertNewOrder(Order order);
    public ArrayList<Order> getOrdersByAccountId(int id);
    public Order getOrderById(int idOrder);
    public ArrayList<Order> getAllOrder();
    public boolean checkExistOrderById(int idOrder);
}
