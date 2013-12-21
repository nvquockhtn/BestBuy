package com.bestbuy.controller;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bestbuy.dao.BestBuyHelperDao;
import com.bestbuy.dao.ManufacturerDao;
import com.bestbuy.dao.Price;
import com.bestbuy.dao.PriceDao;
import com.bestbuy.dao.ProductDao;
import com.bestbuy.dao.ProductstateDao;
import com.bestbuy.dao.ProducttypeDao;
import com.bestbuy.model.ProductChangeModel;
import com.bestbuy.model.ProductModel;
import com.bestbuy.pojo.Comment;
import com.bestbuy.pojo.Manufacturer;
import com.bestbuy.pojo.Product;
import com.bestbuy.pojo.Productstate;
import com.bestbuy.pojo.Producttype;

@Controller
@RequestMapping("/Product")
public class ProductController {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	ProductDao productDao = (ProductDao) context.getBean("productDao");
	ProductstateDao productstateDao = (ProductstateDao) context.getBean("productstateDao");
	ProducttypeDao producttypeDao = (ProducttypeDao) context
			.getBean("producttypeDao");
	ManufacturerDao manufacturerDao = (ManufacturerDao) context
			.getBean("manufacturerDao");
	ArrayList<Manufacturer> listManufacturers = manufacturerDao
			.getListManufacturers();
	ArrayList<Producttype> lisProducttypes = producttypeDao
			.getListProducttypes();
	PriceDao priceDao = new PriceDao();
	ArrayList<Price> listFromPrices = priceDao.getListFromPrices();
	ArrayList<Price> listEndPrices = priceDao.getListEndPrices();
	ArrayList<Productstate> listProductstates = productstateDao.getListProductstates();
	
	
	private String searchNameSelected = "";
	private int manufacturerSelected = -1;
	private int producttypeSelected = -1;
	private int productstateSelected = -1;
	private int frompriceSelected = -1;
	private int endpriceSelected = -1;
	private int pageSelected = 1;
	
	private int pageCount = 0;
	private int numberOnPage = 2;
	private boolean flagProductChange = false;
	public ProductController() {
	}

	@RequestMapping(value = { "/Detail.do" }, method = RequestMethod.GET)
	public String Detail(@RequestParam("maSP") Integer maSP, Model model) {

		Product product = productDao.getProductById(maSP);
		
		float totalRating = 0;
		float avarageRating = 0;
		for (Comment item : product.getComments()) {
			totalRating += item.getRating();
		}
		avarageRating = totalRating/ ((product.getComments().size() == 0) ? 1 : product.getComments().size());
		
		
		model.addAttribute("Product", product);
		model.addAttribute("AvarageRating", avarageRating);
		return "ProductDetail";
	}

	@RequestMapping(value = { "/GetProducts.do" }, method = RequestMethod.GET)
	public String getlistProduct(@ModelAttribute("product") ProductModel form,
			Model model) {

		model.addAttribute("listManufacturers", listManufacturers);
		model.addAttribute("listProducttypes", lisProducttypes);
		model.addAttribute("listFromPrices", listFromPrices);
		model.addAttribute("listEndPrices", listEndPrices);
		pageCount = 0;
		int pageCountTemp = productDao.searchProductBy(form.getSearch(),
				form.getIdmanufacturer(), form.getIdproducttype(),
				form.getFromprice(), form.getEndprice(),
				form.getIdproductstate(), form.getPage(), numberOnPage);
		model.addAttribute("listProducts", BestBuyHelperDao.listProducts);
		if (pageCountTemp > 0) {
			if (pageCountTemp % numberOnPage == 0) {
				pageCount = (int) pageCountTemp / numberOnPage;
			} else {
				pageCount = ((int) pageCountTemp / numberOnPage) + 1;
			}
		}
		model.addAttribute("pageCount", pageCount);
		return "Product";
	}
	
	@RequestMapping(value = { "/Admin/ProductManager.do" }, method = RequestMethod.GET)
	public String getListProductAdmin(@ModelAttribute("product") ProductModel form,@ModelAttribute("productStateChange") ProductChangeModel formChange,
			Model model) {

		model.addAttribute("listManufacturers", listManufacturers);
		model.addAttribute("listProducttypes", lisProducttypes);
		model.addAttribute("listFromPrices", listFromPrices);
		model.addAttribute("listEndPrices", listEndPrices);
		model.addAttribute("listProductstates", listProductstates);
		
		if(flagProductChange==true)
		{
			form.setEndprice(endpriceSelected);
			form.setFromprice(frompriceSelected);
			form.setIdmanufacturer(manufacturerSelected);
			form.setIdproductstate(productstateSelected);
			form.setIdproducttype(producttypeSelected);
			form.setPage(pageSelected);
			form.setSearch(searchNameSelected);
			flagProductChange = false;
		}else
		{
			searchNameSelected = "";
			manufacturerSelected = -1;
			producttypeSelected = -1;
			productstateSelected = -1;
			frompriceSelected = -1;
			endpriceSelected = -1;
			pageSelected = 1;
		}
		manufacturerSelected = form.getIdmanufacturer();
		productstateSelected = form.getIdproductstate();
		producttypeSelected = form.getIdproducttype();
		frompriceSelected = form.getFromprice();
		endpriceSelected = form.getEndprice();
		searchNameSelected  = form.getSearch();
		pageSelected = form.getPage();
		
		
		model.addAttribute("manufacturerSelected", manufacturerSelected);
		model.addAttribute("productstateSelected", productstateSelected);
		model.addAttribute("producttypeSelected", producttypeSelected);
		model.addAttribute("frompriceSelected", frompriceSelected);
		model.addAttribute("endpriceSelected", endpriceSelected);
		model.addAttribute("searchNameSelected", searchNameSelected);
		model.addAttribute("pageSelected", pageSelected);
		
		pageCount = 0;
		int pageCountTemp = productDao.searchProductBy(form.getSearch(),
				form.getIdmanufacturer(), form.getIdproducttype(),
				form.getFromprice(), form.getEndprice(),
				form.getIdproductstate(), form.getPage(), numberOnPage);
		model.addAttribute("listProducts", BestBuyHelperDao.listProducts);
		if (pageCountTemp > 0) {
			if (pageCountTemp % numberOnPage == 0) {
				pageCount = (int) pageCountTemp / numberOnPage;
			} else {
				pageCount = ((int) pageCountTemp / numberOnPage) + 1;
			}
		}
		model.addAttribute("pageCount", pageCount);
		return "ProductManager";
	}
	
	@RequestMapping(value = { "/Admin/ProductChangeState.do" }, method = RequestMethod.POST)
	public String productChangeState(@ModelAttribute("productStateChange") ProductChangeModel form,
			Model model) {

		manufacturerSelected = form.getIdmanufacturerChange();
		productstateSelected = form.getIdproductstateChange();
		producttypeSelected = form.getIdproducttypeChange();
		frompriceSelected = form.getFrompriceChange();
		endpriceSelected = form.getEndpriceChange();
		searchNameSelected  = form.getSearchChange();
		flagProductChange = true;
		//Do something and redirect to getListProductAdmin.do
		Product productUpdate = new Product();
		productUpdate = productDao.getProductById(form.getIdChange());
		if(productUpdate!=null)
		{
			Productstate productstate = productstateDao.getProductstateById(form.getIdproductstateChange());
			productUpdate.setProductstate(productstate);
			productUpdate.setDiscount(form.getDiscountChange());
			productDao.updateProduct(productUpdate);
		}
		return "redirect:/Product/Admin/ProductManager.do";
	}
	

}
