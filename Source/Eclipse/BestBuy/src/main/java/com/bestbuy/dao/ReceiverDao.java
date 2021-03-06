/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import com.bestbuy.pojo.Receiver;

/**
 *
 * @author VanQuoc-CNTT
 */
public interface ReceiverDao {
    public boolean insertNewReceiver(Receiver receiver);
    public Receiver getReceiverById(int idReceiver);
    public ArrayList<Receiver> getAllReceiver();
    public boolean checkExistReceiverById(int idReceiver);
    public boolean checkExistByEmail(String email);
    public Receiver getReceiverByEmail(String email);
    public int searchCustomerBy(String name,String email,int page, int numberinpage);
}
