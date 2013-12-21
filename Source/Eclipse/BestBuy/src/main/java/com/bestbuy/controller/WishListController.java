/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bestbuy.dao.ProductDao;
import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Product;

/**
 * 
 * @author VanQuoc-CNTT
 */

@Controller
@RequestMapping("/WishList")
public class WishListController {
	private static final Logger logger = Logger.getLogger(WishListController.class);	
	
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	ProductDao productDao = (ProductDao) context.getBean("productDao");

	public WishListController() {
	}

	@RequestMapping(value = { "/Index.do" }, method = RequestMethod.GET)
	public String index(Model model, HttpSession session) {
		GetWishList(session);
		
		/*Begin Log*/
		logger.warn("nguoi dung xem danh sach wishlish");
		/*End Log*/
		
		return "WishList";
	}

	@RequestMapping(value = { "/Add.do" }, method = RequestMethod.GET)
	public String AddProduct(@RequestParam("maSP") Integer maSP, Model model,
			HttpSession session) {

		ArrayList<Product> wishList = GetWishList(session);

		AddToWishListAction(maSP, wishList);
		
		/*Begin Log*/
		logger.warn("nguoi dung them san pham vao wishlish, id san pham:" + maSP);
		/*End Log*/
		
		return "WishList";
	}

	private ArrayList<Product> GetWishList(HttpSession session) {
		ArrayList<Product> wishList;
		if (session.getAttribute("WishList") == null) {
			wishList = new ArrayList<Product>();
			session.setAttribute("WishList", wishList);
		} else {
			wishList = (ArrayList<Product>) session.getAttribute("WishList");
		}
		return wishList;
	}

	private void AddToWishListAction(Integer maSp, ArrayList<Product> wishList)
			throws NumberFormatException {
		
		for (Product product : wishList) {
			if (product.getId() == maSp)
				return;
		}
		
		Product item = productDao.getProductById(maSp);
		if (!wishList.contains(item))
			wishList.add(item);
	}

	@RequestMapping(value = { "/Delete.do" }, method = RequestMethod.GET)
	public String DeleteProduct(@RequestParam("maSP") Integer maSP,
			Model model, HttpSession session) {

		ArrayList<Product> shopCart = GetWishList(session);
		DeleteItemWishListAction(maSP, shopCart);

		/*Begin Log*/
		logger.warn("nguoi dung xoa san pham khoi wishlish, id san pham:" + maSP);
		/*End Log*/
		
		return "WishList";
	}

	private void DeleteItemWishListAction(Integer maSp,
			ArrayList<Product> wishList) throws NumberFormatException {
		int i = 0;
		for (i = 0; i < wishList.size(); i++) {
			Product item = wishList.get(i);
			if (item.getId() == maSp) {
				wishList.remove(item);
				break;
			}
		}
	}
}
