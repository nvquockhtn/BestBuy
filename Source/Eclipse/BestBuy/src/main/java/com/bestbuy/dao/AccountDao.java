/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

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
}
