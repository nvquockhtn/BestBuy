package com.bestbuy.dao;

import java.util.ArrayList;

import com.bestbuy.pojo.Orderdetail;


public interface OrderDetailDao {
	public boolean insertNewOrderdetail(Orderdetail orderdetail);
    public Orderdetail getOrderDetailById(int idOrderdetail);
    public ArrayList<Orderdetail> getAllOrderDetail();
    public boolean checkExistOrderdetailById(int idOrderdetail);
}
