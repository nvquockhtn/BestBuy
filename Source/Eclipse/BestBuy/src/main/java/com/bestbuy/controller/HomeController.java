/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import java.util.ArrayList;

import com.bestbuy.dao.AccountDao;
import com.bestbuy.dao.ProductDao;
import com.bestbuy.model.AccountModel;
import com.bestbuy.pojo.Image;
import com.bestbuy.pojo.Product;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author VanQuoc-CNTT
 */
@Controller
@RequestMapping("/Home")
public class HomeController {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	AccountDao accountDao = (AccountDao) context.getBean("accountDao");
	ProductDao productDao = (ProductDao) context.getBean("productDao");
	ArrayList<Product> listProduct = new ArrayList<Product>();
	ArrayList<Product> listTablet = new ArrayList<Product>();
	
	ArrayList<Product> listProductDiscountDescs = productDao.getProductDiscountDesc();
	ArrayList<Product> listProductNews = productDao.getProductNew();
	
    @RequestMapping(value = {"/Index.do"}, method = RequestMethod.GET)
    public String Index(@ModelAttribute("account") AccountModel form, Model model) {
    	
    	listProduct = productDao.getListNewProducts(1);
    	listTablet  = productDao.getListNewProducts(2);
    	
    	// Image[] img = (Image[])(listProduct.get(0).getImages().toArray());
    	model.addAttribute("NewLaptopProduct", listProduct);
    	model.addAttribute("NewTabletProduct", listTablet);
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();  
		String name = auth.getName(); //get logged in username
		
		model.addAttribute("listProductDiscountDescs", listProductDiscountDescs);
		model.addAttribute("listProductNews", listProductNews);
        return "Index";
    }
    
    public HomeController() {
//    	UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getDetails();
    }
}
