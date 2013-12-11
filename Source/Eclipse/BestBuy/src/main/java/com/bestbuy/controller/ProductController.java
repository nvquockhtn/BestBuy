package com.bestbuy.controller;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bestbuy.dao.AccountDao;
import com.bestbuy.dao.BestBuyHelperDao;
import com.bestbuy.dao.ManufacturerDao;
import com.bestbuy.dao.Price;
import com.bestbuy.dao.PriceDao;
import com.bestbuy.dao.ProductDao;
import com.bestbuy.dao.ProductDaoImpl;
import com.bestbuy.dao.ProducttypeDao;
import com.bestbuy.model.AccountModel;
import com.bestbuy.model.ProductModel;
import com.bestbuy.pojo.Manufacturer;
import com.bestbuy.pojo.Product;
import com.bestbuy.pojo.Producttype;
@Controller
@RequestMapping("/Product")
public class ProductController {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	AccountDao accountDao = (AccountDao) context.getBean("accountDao");
	ProductDao productDao = (ProductDao) context.getBean("productDao");
	
	ProducttypeDao producttypeDao = (ProducttypeDao) context.getBean("producttypeDao");
	ManufacturerDao manufacturerDao = (ManufacturerDao) context.getBean("manufacturerDao");
	ArrayList<Manufacturer> listManufacturers = manufacturerDao.getListManufacturers();
	ArrayList<Producttype> lisProducttypes = producttypeDao.getListProducttypes();
	PriceDao priceDao = new PriceDao();
	ArrayList<Price> listFromPrices = priceDao.getListFromPrices();
	ArrayList<Price> listEndPrices = priceDao.getListEndPrices();
	private int pageCount = 0;
	private int numberOnPage = 2;
	//ArrayList<Product> list = productDao.getListNewProducts(1);
	public ProductController() {
		
	}
	@RequestMapping(value = { "/GetProducts.do" }, method = RequestMethod.GET)
	
	public String getlistProduct(
			@ModelAttribute("product") ProductModel form,@RequestParam("page") Integer pageNumber,
			@RequestParam("search") String search,@RequestParam("idmanufacturer") int idmanufacturer,@RequestParam("idproducttype") int idproducttype,@RequestParam("fromprice") int fromprice, @RequestParam("endprice") int endprice,
			Model model) {
		
		model.addAttribute("listManufacturers", listManufacturers);
		model.addAttribute("listProducttypes", lisProducttypes);
		model.addAttribute("listFromPrices", listFromPrices);
		model.addAttribute("listEndPrices", listEndPrices);
		model.addAttribute("idmanufacturer", idmanufacturer);
		model.addAttribute("idproducttype", idproducttype);
		model.addAttribute("fromprice", fromprice);
		model.addAttribute("endprice", endprice);
		model.addAttribute("search", search);
		form.setManufacturer(idmanufacturer);
		form.setProducttype(idproducttype);
		form.setFromprice(fromprice);
		form.setEndprice(endprice);
		form.setName(search);
		pageCount = 0;
		int pageCountTemp = productDao.searchProductBy(form.getName(), form.getManufacturer(),
				form.getProducttype(), form.getFromprice(), form.getEndprice(), form.getProductstate(), pageNumber, numberOnPage);
		model.addAttribute("listProducts", BestBuyHelperDao.listProducts);
		if(pageCountTemp>0)
        {
            if(pageCountTemp%numberOnPage==0)
            {
                pageCount =  (int)pageCountTemp/numberOnPage;
            }
            else
            {
                pageCount =  ((int)pageCountTemp/numberOnPage) +1;
            }
        }
		model.addAttribute("pageCount",pageCount );
		model.addAttribute("pageNumber", pageNumber);
		
		return "Product";
	}
	@RequestMapping(value = { "/PostProducts.do" }, method = RequestMethod.POST)
	public String postlistProduct(
			@ModelAttribute("product") ProductModel form,@RequestParam("page") Integer pageNumber,
			@RequestParam("search") String search,@RequestParam("idmanufacturer") int idmanufacturer,@RequestParam("idproducttype") int idproducttype,@RequestParam("fromprice") int fromprice, @RequestParam("endprice") int endprice,
			Model model) {
		model.addAttribute("listManufacturers", listManufacturers);
		model.addAttribute("listProducttypes", lisProducttypes);
		model.addAttribute("listFromPrices", listFromPrices);
		model.addAttribute("listEndPrices", listEndPrices);
		if(form.getName()==null)
		{
			form.setName("");
		}
		model.addAttribute("idmanufacturer", form.getManufacturer());
		model.addAttribute("idproducttype", form.getProducttype());
		model.addAttribute("fromprice", form.getFromprice());
		model.addAttribute("endprice", form.getEndprice());
		model.addAttribute("search", form.getName());
		int pageCountTemp = productDao.searchProductBy(form.getName(), form.getManufacturer(),
				form.getProducttype(), form.getFromprice(), form.getEndprice(), form.getProductstate(), pageNumber, numberOnPage);
		model.addAttribute("listProducts", BestBuyHelperDao.listProducts);
		pageCount = 0;
		if(pageCountTemp>0)
        {
            if(pageCountTemp%numberOnPage==0)
            {
                pageCount =  (int)pageCountTemp/numberOnPage;
            }
            else
            {
                pageCount =  ((int)pageCountTemp/numberOnPage) +1;
            }
        }
		model.addAttribute("pageCount",pageCount );
		model.addAttribute("pageNumber", pageNumber);
		
		return "Product";
	}

	
}
