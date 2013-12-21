/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import com.bestbuy.pojo.Account;

/**
 *
 * @author VanQuoc-CNTT
 */
public interface AccountDao {

    public boolean checkExistByUserName(Account acc);

    public boolean addAccount(Account acc);

    public Account login(String username, String pass);

    public Account getAccountByUserName(String username);
    public boolean insertNewAccount(Account account);
    public boolean deleteAccount(Account accout);
    public boolean updateAccout(Account account);
    public Account getAccountById(int idAccount);
    public ArrayList<Account> getAllAccount();
    public int searchAccountBy(String fullname,String address,String email, boolean isBlock, boolean isActive, int typeId, int page, int numberinpage);
}
