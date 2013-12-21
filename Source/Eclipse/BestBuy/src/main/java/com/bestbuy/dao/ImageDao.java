/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Image;

/**
 *
 * @author VanQuoc-CNTT
 */
public interface ImageDao {
	public boolean saveOrUpdateImage(Image img);
	public ArrayList<Image> getImagesByProductId(int id);

    
}
