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
	private int error = 1;
	private boolean flagAdd = false;
	@RequestMapping(value = {"/ProductsCompare.do"}, method =  RequestMethod.GET)
	public String ProductCompare( Model model,HttpSession session)
	{
		if(flagAdd==true)
		{
			model.addAttribute("error", error);
		}else
		{
			model.addAttribute("error", 1);
		}
		flagAdd = false;
		GetProductsCompare(session).size();
		return "ProductCompare";
	}
	@RequestMapping(value = {"/ErrorProductsCompare.do"}, method =  RequestMethod.GET)
	public String ErrorProductCompare( Model model,HttpSession session)
	{
		flagAdd = false;
		return "redirect:/ProductCompare/ProductsCompare.do";
	}
	@RequestMapping(value = {"/AddProductToListCompare.do"}, method =  RequestMethod.GET)
	public String AddProductToListCompare(@RequestParam("idProduct") Integer idProduct, Model model,
			HttpSession session)
	{
		ArrayList<Product> listProductsCompare  = GetProductsCompare(session);
		if(listProductsCompare.size()<3)
		{
			error = AddProductToListCompare(idProduct, listProductsCompare);
			// error neu -1 la san pham nay da ton tai
		}else
		{
			error = -2;		// so luong add vuot qua 3 san pham
		}
		flagAdd = true;
		model.addAttribute("error", error);
		return "redirect:/ProductCompare/ProductsCompare.do";
	}
	@RequestMapping(value = {"/DeleteProductFromListCompare.do"}, method =  RequestMethod.GET)
	public String DeleteProductToListCompare(@RequestParam("idProduct") Integer idProduct, Model model,
			HttpSession session)
	{
		ArrayList<Product> listProductsCompare  = GetProductsCompare(session);
		
		DeleteProductFromListCompare(idProduct, listProductsCompare);
		return "redirect:/ProductCompare/ProductsCompare.do";
	}
	public ArrayList<Product> GetProductsCompare(HttpSession session) {
		ArrayList<Product> listProductsCompare = null;
		if (session.getAttribute("listProductsCompare") == null)
		{
			listProductsCompare = new ArrayList<Product>();
			session.setAttribute("listProductsCompare", listProductsCompare);
		} else {
			listProductsCompare = (ArrayList<Product>) session.getAttribute("listProductsCompare");
		}
		return listProductsCompare;
	}
	private int AddProductToListCompare(Integer idProduct, ArrayList<Product> listProductsCompare)
			throws NumberFormatException {
		int i = 0;
		boolean temp  = false;
		int error = 1;	// khong co loi
		for (i = 0; i < listProductsCompare.size(); i++) {
			Product item = listProductsCompare.get(i);
				if (item.getId() == idProduct) {
					temp = true;
					error = -1;		// da ton tai
					break;
				}
		}
		// truong hop chua co san pham trong gio hang
		if(temp==false)
		{
			Product item = productDao.getProductById(idProduct);
			listProductsCompare.add(item);
		}
		return error;
	}
	private void DeleteProductFromListCompare(Integer idProduct, ArrayList<Product> listProductsCompare)
			throws NumberFormatException {
		for (int i = 0; i < listProductsCompare.size(); i++) {
			Product item = listProductsCompare.get(i);
			if (item.getId() == idProduct)
			{
				listProductsCompare.remove(item);
				break;
			}
		}
	}
	
}
