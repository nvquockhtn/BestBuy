package com.bestbuy.dao;

import java.util.ArrayList;
import java.util.Date;

import com.bestbuy.pojo.Promotion;


public interface PromotionDao {
	public ArrayList<Promotion> getListPromotions();
	public Promotion getPromotionById(int id);
	public int searchPromotionBy(String namePromotion,Date datestart,Date dateend, int page, int numberinpage);
	public boolean addPromotion(Promotion promotion);
	public boolean deletePromotionById(int IdPromotion);
	public boolean checkPromotionExistByName(String name);
	public boolean updatePromotion(Promotion promotion);
}
