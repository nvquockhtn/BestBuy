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
import com.bestbuy.pojo.Product;


@Controller
@RequestMapping("/Product")
public class ProductController {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	ProductDao productDao = (ProductDao) context.getBean("productDao");
	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = { "/Detail.do" }, method = RequestMethod.GET)
	public String Detail(@RequestParam("maSP") Integer maSP, Model model) {

		Product product = productDao.getProductById(maSP);
		model.addAttribute("Product",product);
		return "ProductDetail";
	}

}
