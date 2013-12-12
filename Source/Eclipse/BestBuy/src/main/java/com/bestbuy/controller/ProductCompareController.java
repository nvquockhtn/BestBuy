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
import com.bestbuy.pojo.Product;

@Controller
@RequestMapping("/ProductCompare")
public class ProductCompareController {
	public ProductCompareController()
	{
		
	}
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	ProductDao productDao = (ProductDao) context.getBean("productDao");
	
	@RequestMapping(value = {"/ProductsCompare.do"}, method =  RequestMethod.GET)
	public String ProductCompare( Model model,HttpSession session)
	{
		int numCompares = GetProductsCompare(session).size();
		model.addAttribute("numCompares", numCompares);
		
		return "ProductCompare";
	}
	@RequestMapping(value = {"/AddProductToListCompare.do"}, method =  RequestMethod.GET)
	public String AddProductToListCompare(@RequestParam("idProduct") Integer idProduct, Model model,
			HttpSession session)
	{
		ArrayList<Product> listProductsCompare  = GetProductsCompare(session);
		//listProductsCompare.get(1).getName();
		int numCompares = listProductsCompare.size();
		model.addAttribute("numCompares", numCompares);
		AddProductToListCompare(idProduct, listProductsCompare);
		return "ProductCompare";
	}
	@RequestMapping(value = {"/DeleteProductFromListCompare.do"}, method =  RequestMethod.GET)
	public String DeleteProductToListCompare(@RequestParam("idProduct") Integer idProduct, Model model,
			HttpSession session)
	{
		ArrayList<Product> listProductsCompare  = GetProductsCompare(session);
		int numCompares = listProductsCompare.size();
		model.addAttribute("numCompares", numCompares);
		DeleteProductFromListCompare(idProduct, listProductsCompare);
		return "ProductCompare";
	}
	public ArrayList<Product> GetProductsCompare(HttpSession session) {
		ArrayList<Product> listProductsCompare;
		if (session.getAttribute("listProductsCompare") == null) {
			listProductsCompare = new ArrayList<Product>();
			session.setAttribute("listProductsCompare", listProductsCompare);
		} else {
			listProductsCompare = (ArrayList<Product>) session.getAttribute("listProductsCompare");
		}
		return listProductsCompare;
	}
	private void AddProductToListCompare(Integer idProduct, ArrayList<Product> listProductsCompare)
			throws NumberFormatException {
		int i = 0;
		for (i = 0; i < listProductsCompare.size(); i++) {
			Product item = listProductsCompare.get(i);
			if (item.getId() == idProduct) {
				break;
			}
		}
		// truong hop chua co san pham trong gio hang
		if (i == listProductsCompare.size()) {
			Product item = productDao.getProductById(idProduct);
			listProductsCompare.add(item);
		}
	}
	private void DeleteProductFromListCompare(Integer idProduct, ArrayList<Product> listProductsCompare)
			throws NumberFormatException {
		int i = 0;
		for (i = 0; i < listProductsCompare.size(); i++) {
			Product item = listProductsCompare.get(i);
			if (item.getId() == idProduct)
			{
				listProductsCompare.remove(i);
				break;
			}
		}
	}
	
}
