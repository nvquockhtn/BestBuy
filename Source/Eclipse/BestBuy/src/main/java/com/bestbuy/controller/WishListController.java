/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bestbuy.dao.ProductDao;
import com.bestbuy.model.ProductInCart;
import com.bestbuy.pojo.Account;

/**
 *
 * @author VanQuoc-CNTT
 */

@Controller
@RequestMapping("/WishList")
public class WishListController {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	ProductDao productDao = (ProductDao) context.getBean("productDao");

    public WishListController() {
    }

    @RequestMapping(value = {"/Index.do"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
    	GetWishList(session);
        return "WishList";
    }
    
    @RequestMapping(value = { "/Add.do" }, method = RequestMethod.GET)
	public String AddProduct(@RequestParam("maSP") Integer maSP, Model model,
			HttpSession session) {

		ArrayList<ProductInCart> wishList = GetWishList(session);

		AddToWishListAction(maSP, wishList);
		return "WishList";
	}
    
    private ArrayList<ProductInCart> GetWishList(HttpSession session) {
		ArrayList<ProductInCart> wishList;
		if (session.getAttribute("WishList") == null) {
			wishList = new ArrayList<ProductInCart>();
			session.setAttribute("WishList", wishList);
		} else {
			wishList = (ArrayList<ProductInCart>) session
					.getAttribute("WishList");
		}
		return wishList;
	}
    
    private void AddToWishListAction(Integer maSp, ArrayList<ProductInCart> wishList)
			throws NumberFormatException {
		int i = 0;
		for (i = 0; i < wishList.size(); i++) {
			ProductInCart item = wishList.get(i);
			if (item.getProduct().getId() == maSp) {
				item.setQuantity(item.getQuantity() + 1);
				break;
			}
		}
		// truong hop chua co san pham trong gio hang
		if (i == wishList.size()) {
			ProductInCart item = new ProductInCart(
					productDao.getProductById(maSp), 1);
			wishList.add(item);
		}
	}
    
    @RequestMapping(value = { "/Delete.do" }, method = RequestMethod.GET)
	public String DeleteProduct(@RequestParam("maSP") Integer maSP,
			Model model, HttpSession session) {
		
		ArrayList<ProductInCart> shopCart = GetWishList(session);
		DeleteItemWishListAction(maSP, shopCart);

		return "WishList";
	}
    
    private void DeleteItemWishListAction(Integer maSp,
			ArrayList<ProductInCart> wishList) throws NumberFormatException {
		int i = 0;
		for (i = 0; i < wishList.size(); i++) {
			ProductInCart item = wishList.get(i);
			if (item.getProduct().getId() == maSp) {
				wishList.remove(item);
				break;
			}
		}
	}
}
