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
import com.bestbuy.dao.ProducttypeDao;
import com.bestbuy.model.ProductModel;
import com.bestbuy.pojo.Manufacturer;
import com.bestbuy.pojo.Product;
import com.bestbuy.pojo.Producttype;


@Controller
@RequestMapping("/Product")
public class ProductController {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
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
	public ProductController() {
	}
	
	@RequestMapping(value = { "/Detail.do" }, method = RequestMethod.GET)
	public String Detail(@RequestParam("maSP") Integer maSP, Model model) {

		Product product = productDao.getProductById(maSP);
		model.addAttribute("Product",product);
		return "ProductDetail";
	}
	@RequestMapping(value = { "/GetProducts.do" }, method = RequestMethod.GET)
	public String getlistProduct(
			@ModelAttribute("product") ProductModel form,
			Model model) {
		
		model.addAttribute("listManufacturers", listManufacturers);
		model.addAttribute("listProducttypes", lisProducttypes);
		model.addAttribute("listFromPrices", listFromPrices);
		model.addAttribute("listEndPrices", listEndPrices);
		pageCount = 0;
		int pageCountTemp = productDao.searchProductBy(form.getSearch(), form.getIdmanufacturer(),
				form.getIdproducttype(), form.getFromprice(), form.getEndprice(), form.getIdproductstate(), form.getPage(), numberOnPage);
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
		return "Product";
	}
	
}
