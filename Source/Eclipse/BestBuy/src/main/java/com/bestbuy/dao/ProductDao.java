/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import com.bestbuy.pojo.Product;

/**
 *
 * @author VanQuoc-CNTT
 */
public interface ProductDao {
    public ArrayList<Product> getListDiscountProducts();
    /**
     * 
     * @param type Neu type = 1 la Laptop
     * 					type = 2 la Tablet
     * @return  ArrayList<Product>
     */
    public ArrayList<Product> getListNewProducts(int type);
}
