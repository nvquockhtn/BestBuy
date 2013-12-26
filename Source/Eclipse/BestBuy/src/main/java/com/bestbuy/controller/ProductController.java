package com.bestbuy.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bestbuy.dao.BestBuyHelperDao;
import com.bestbuy.dao.ImageDao;
import com.bestbuy.dao.ManufacturerDao;
import com.bestbuy.dao.Price;
import com.bestbuy.dao.PriceDao;
import com.bestbuy.dao.ProductDao;
import com.bestbuy.dao.ProductstateDao;
import com.bestbuy.dao.ProducttypeDao;
import com.bestbuy.dao.PromotionDao;
import com.bestbuy.model.ProductChangeModel;
import com.bestbuy.model.ProductModel;
import com.bestbuy.model.PromotionModel;
import com.bestbuy.pojo.Comment;
import com.bestbuy.pojo.Image;
import com.bestbuy.pojo.Manufacturer;
import com.bestbuy.pojo.Product;
import com.bestbuy.pojo.Productstate;
import com.bestbuy.pojo.Producttype;
import com.bestbuy.pojo.Promotion;

@Controller
@RequestMapping("/Product")
public class ProductController {
	private static final Logger logger = Logger.getLogger(ProductController.class);	
	
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	ProductDao productDao = (ProductDao) context.getBean("productDao");
	ProductstateDao productstateDao = (ProductstateDao) context
			.getBean("productstateDao");
	ProducttypeDao producttypeDao = (ProducttypeDao) context
			.getBean("producttypeDao");
	ManufacturerDao manufacturerDao = (ManufacturerDao) context
			.getBean("manufacturerDao");
	ImageDao imageDao = (ImageDao) context.getBean("imageDao");
	PromotionDao promotionDao = (PromotionDao) context.getBean("promotionDao");
	
	
	PriceDao priceDao = new PriceDao();

	ArrayList<Manufacturer> listManufacturers = manufacturerDao
			.getListManufacturers();
	ArrayList<Producttype> lisProducttypes = producttypeDao
			.getListProducttypes();
	ArrayList<Price> listFromPrices = priceDao.getListFromPrices();
	ArrayList<Price> listEndPrices = priceDao.getListEndPrices();
	ArrayList<Productstate> listProductstates = productstateDao
			.getListProductstates();
	ArrayList<Promotion> listPromotions  = promotionDao.getListPromotions();
	
	
	ArrayList<Product> listProductDiscountDescs = productDao.getProductDiscountDesc();
	ArrayList<Product> listProductNews = productDao.getProductNew();
	
	private String searchNameSelected = "";
	private int manufacturerSelected = -1;
	private int producttypeSelected = -1;
	private int productstateSelected = -1;
	private int frompriceSelected = -1;
	private int endpriceSelected = -1;
	private int pageSelected = 1;
	private int promotionSelected = -1;

	private int pageCount = 0;
	private int numberOnPage = 2;
	private boolean flagProductChange = false;
	private String notify = "";
	public ProductController() {
	}

	@RequestMapping(value = { "/Admin/IndexPromotion.do" }, method = RequestMethod.GET)
	public String indexPromotionManager(Model model, @RequestParam("page") Integer page)
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		int pageCountTemp = promotionDao.searchPromotionBy("",date,date, page, numberOnPage);
		
		if (pageCountTemp > 0) {
			if (pageCountTemp % numberOnPage == 0) {
				pageCount = (int) pageCountTemp / numberOnPage;
			} else {
				pageCount = ((int) pageCountTemp / numberOnPage) + 1;
			}
		}
		model.addAttribute("listPromotions", BestBuyHelperDao.listPromotions);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("page", page);
		model.addAttribute("notify", notify);
		notify = "";
		return "IndexPromotionManager";
	}
	@RequestMapping(value = { "/Admin/GetAddPromotion.do" }, method = RequestMethod.GET)
	public String getAddPromotionManger(Model model, @ModelAttribute("Promotion") PromotionModel promotion)
	{
		model.addAttribute("notify", notify);
		notify = "";
		
		model.addAttribute("listProductDiscountDescs", listProductDiscountDescs);
		model.addAttribute("listProductNews", listProductNews);
		return "AddPromotionManager";
	}
	@RequestMapping(value = { "/Admin/PostAddPromotion.do" }, method = RequestMethod.POST)
	public String postAddPromotionManger(Model model, @ModelAttribute("Promotion") @Valid PromotionModel promotion,BindingResult result)
	{
		
		if(result.hasErrors())
			return "AddPromotionManager";
		
		if(promotionDao.checkPromotionExistByName(promotion.getName())==true)
		{
			//da ton tai
			notify = "Name promotion had been exist";
			return "redirect:/Product/Admin/GetAddPromotion.do";
		}else
		{
			try
			{
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				Promotion promotiontemp  = new Promotion();
				if(promotion.getDatestart().equals("")||promotion.getDateend().equals(""))
				{
					notify = "Please choose date";
					return "redirect:/Product/Admin/GetAddPromotion.do";
				}
				Date datestart = formatter.parse(promotion.getDatestart());
				Date dateend = formatter.parse(promotion.getDateend());
				promotiontemp.setDateend(dateend);
				promotiontemp.setDatestart(datestart);
				promotiontemp.setDescription(promotion.getDescription());
				promotiontemp.setName(promotion.getName());
				promotionDao.addPromotion(promotiontemp);
				notify = "Add promotion sussecfully";
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/Product/Admin/IndexPromotion.do?page=1";
	}
	@RequestMapping(value = { "/Admin/DeletePromotion.do" }, method = RequestMethod.GET)
	public String deletePromotionManager(@RequestParam("idPromotion") Integer idPromotion, Model model)
	{
		ArrayList<Product> listProductOfPromotions = productDao.getProductByIdPromotion(idPromotion);
		if(listProductOfPromotions!=null)
		{
			for(int i=0;i<listProductOfPromotions.size();i++)
			{
				Product product = listProductOfPromotions.get(i);
				product.setDiscount((float) 0.0);
				product.setPromotion(null);
				productDao.updateProductInfoPromotion(product);
			}
			promotionDao.deletePromotionById(idPromotion);
			notify = "Product in promotion had been reset sussecfully";
		}else
		{
			notify = "No product had been reset";
		}
		return "redirect:/Product/Admin/IndexPromotion.do?page=1";
	}
	
	@RequestMapping(value = { "/Admin/GetUpdatePromotion.do" }, method = RequestMethod.GET)
	public String getUpdatePromotionManager(@RequestParam("idPromotion") Integer idPromotion,Model model, @ModelAttribute("Promotion") PromotionModel promotion)
	{
		model.addAttribute("notify", notify);
		notify = "";
		Promotion promo  = promotionDao.getPromotionById(idPromotion);
		promotion.setId(idPromotion);
		promotion.setDescription(promo.getDescription());
		SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
		String date1 = sdf.format(promo.getDatestart());
		String date2 = sdf.format(promo.getDateend());
		promotion.setDatestart(date1);
		promotion.setDateend(date2);
		promotion.setName(promo.getName());
		promotion.setId(promo.getId());
		model.addAttribute("listProductDiscountDescs", listProductDiscountDescs);
		model.addAttribute("listProductNews", listProductNews);
		return "UpdatePromotionManager";
	}
	@RequestMapping(value = { "/Admin/PostUpdatePromotion.do" }, method = RequestMethod.POST)
	public String postUpdatePromotionManger(Model model, @ModelAttribute("Promotion") @Valid PromotionModel promotion,BindingResult result)
	{
		if(result.hasErrors())
			return "UpdatePromotionManager";
		
		if(promotionDao.checkPromotionExistByName(promotion.getName())==true)
		{
			//da ton tai
			notify = "Name promotion had been exist";
			String s = "redirect:/Product/Admin/GetUpdatePromotion.do?idPromotion="+ promotion.getId();
			return s;
		}else
		{
			try
			{
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				Promotion promotiontemp  = new Promotion();
				Date datestart = formatter.parse(promotion.getDatestart());
				Date dateend = formatter.parse(promotion.getDateend());
				promotiontemp.setId(promotion.getId());
				promotiontemp.setDateend(dateend);
				promotiontemp.setDatestart(datestart);
				promotiontemp.setDescription(promotion.getDescription());
				promotiontemp.setName(promotion.getName());
				promotionDao.updatePromotion(promotiontemp);
				
				notify = "Update promotion sussecfully";
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/Product/Admin/IndexPromotion.do?page=1";
	}
	@RequestMapping(value = { "/Detail.do" }, method = RequestMethod.GET)
	public String Detail(@RequestParam("maSP") Integer maSP, Model model) {

		Product product = productDao.getProductById(maSP);

		float totalRating = 0;
		float avarageRating = 0;
		for (Comment item : product.getComments()) {
			totalRating += item.getRating();
		}
		avarageRating = totalRating
				/ ((product.getComments().size() == 0) ? 1 : product
						.getComments().size());

		model.addAttribute("Product", product);
		model.addAttribute("AvarageRating", avarageRating);
		
		/*Begin Log*/
		logger.warn("nguoi dung xem chi tiet san pham, id san pham =" + maSP);
		/*End Log*/
		
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
		
		
		model.addAttribute("listProductDiscountDescs", listProductDiscountDescs);
		model.addAttribute("listProductNews", listProductNews);
		
		/*Begin Log*/
		logger.warn("nguoi dung xem danh sach san pham");
		/*End Log*/
		
		return "Product";
	}

	@RequestMapping(value = { "/Admin/ProductManager.do" }, method = RequestMethod.GET)
	public String getListProductAdmin(
			@ModelAttribute("product") ProductModel form,
			@ModelAttribute("productStateChange") ProductChangeModel formChange,
			Model model) {

		
		model.addAttribute("listManufacturers", listManufacturers);
		model.addAttribute("listProducttypes", lisProducttypes);
		model.addAttribute("listFromPrices", listFromPrices);
		model.addAttribute("listEndPrices", listEndPrices);
		model.addAttribute("listProductstates", listProductstates);
		listPromotions = promotionDao.getListPromotions();
		model.addAttribute("listPromotions", listPromotions);

		if (flagProductChange == true) {
			form.setEndprice(endpriceSelected);
			form.setFromprice(frompriceSelected);
			form.setIdmanufacturer(manufacturerSelected);
			form.setIdproductstate(productstateSelected);
			form.setIdproducttype(producttypeSelected);
			form.setIdpromotion(promotionSelected);
			form.setPage(pageSelected);
			form.setSearch(searchNameSelected);
			form.setProductId(promotionSelected);
			flagProductChange = false;
		} else {
			searchNameSelected = "";
			manufacturerSelected = -1;
			producttypeSelected = -1;
			productstateSelected = -1;
			frompriceSelected = -1;
			endpriceSelected = -1;
			pageSelected = 1;
			promotionSelected=-1;
		}
		manufacturerSelected = form.getIdmanufacturer();
		productstateSelected = form.getIdproductstate();
		producttypeSelected = form.getIdproducttype();
		frompriceSelected = form.getFromprice();
		endpriceSelected = form.getEndprice();
		searchNameSelected = form.getSearch();
		promotionSelected = form.getIdpromotion();
		pageSelected = form.getPage();

		model.addAttribute("manufacturerSelected", manufacturerSelected);
		model.addAttribute("productstateSelected", productstateSelected);
		model.addAttribute("producttypeSelected", producttypeSelected);
		model.addAttribute("frompriceSelected", frompriceSelected);
		model.addAttribute("endpriceSelected", endpriceSelected);
		model.addAttribute("searchNameSelected", searchNameSelected);
		model.addAttribute("pageSelected", pageSelected);
		model.addAttribute("promotionSelected", promotionSelected);
		
		pageCount = 0;
		int pageCountTemp = productDao.searchAdminProductBy(form.getSearch(),
				form.getIdmanufacturer(), form.getIdproducttype(),
				form.getFromprice(), form.getEndprice(),
				form.getIdproductstate(),form.getIdpromotion(), form.getPage(), numberOnPage);
		model.addAttribute("listProducts", BestBuyHelperDao.listProducts);
		if (pageCountTemp > 0) {
			if (pageCountTemp % numberOnPage == 0) {
				pageCount = (int) pageCountTemp / numberOnPage;
			} else {
				pageCount = ((int) pageCountTemp / numberOnPage) + 1;
			}
		}
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listProductDiscountDescs", listProductDiscountDescs);
		model.addAttribute("listProductNews", listProductNews);
		return "ProductManager";
	}

	@RequestMapping(value = { "/Admin/ProductChangeState.do" }, method = RequestMethod.POST)
	public String productChangeState(
			@ModelAttribute("productStateChange") ProductChangeModel form,
			Model model) {

		manufacturerSelected = form.getIdmanufacturerChange();
		productstateSelected = form.getIdproductstateChange();
		producttypeSelected = form.getIdproducttypeChange();
		frompriceSelected = form.getFrompriceChange();
		endpriceSelected = form.getEndpriceChange();
		searchNameSelected = form.getSearchChange();
		promotionSelected = form.getIdpromotionChange();
		
		
		flagProductChange = true;
		// Do something and redirect to getListProductAdmin.do
		Product productUpdate = new Product();
		productUpdate = productDao.getProductById(form.getIdChange());
		if (productUpdate != null) {
			//Productstate productstate = productstateDao.getProductstateById(form.getIdproductstateChange());
			Promotion promotion1 = promotionDao.getPromotionById(promotionSelected);
			//productUpdate.setProductstate(productstate);
			productUpdate.setPromotion(promotion1);
			productUpdate.setDiscount(form.getDiscountChange());
			productDao.updateProduct(productUpdate);
		}
		return "redirect:/Product/Admin/ProductManager.do";
	}

	@RequestMapping(value = { "/Admin/Add.do" }, method = RequestMethod.GET)
	public String getAddProductAdmin(
			@ModelAttribute("productModel") ProductModel form, Model model) {

		return "AddProduct";
	}
		

	@RequestMapping(value = { "/Admin/Add.do" }, method = RequestMethod.POST)
	public String postAddProductAdmin(
			@ModelAttribute("productModel") @Valid ProductModel form,
			BindingResult result, Model model) {

		if (result.hasErrors())
			return "AddProduct";
		
		
		Product product = new Product();
		product.setName(form.getName());
		product.setOverview(form.getOverview());
		product.setDiscount(form.getDiscount());
		product.setPrice(form.getPrice());
		product.setSpecification(form.getSpecification());
		product.setProducttype(producttypeDao.getProducttypeById(form
				.getIdproducttype()));
		product.setProductstate(productstateDao.getProductstateById(form
				.getIdproductstate()));
		product.setManufacturer(manufacturerDao.getManufacturerById(form
				.getIdmanufacturer()));
		
		productDao.saveOrUpdateProduct(product);
		
		Image largeImg = new Image();
		largeImg.setPath(form.getLargeImgPath());
		largeImg.setTypeId(2);
		largeImg.setProduct(product);
		
		Image smallImg = new Image();
		smallImg.setPath(form.getSmallImgPath());
		smallImg.setTypeId(1);
		smallImg.setProduct(product);
		
		imageDao.saveOrUpdateImage(largeImg);
		imageDao.saveOrUpdateImage(smallImg);
		
		
		return "redirect:/Product/Detail.do?maSP=" + product.getId();
	}
	
	@RequestMapping(value = { "/Admin/Edit.do" }, method = RequestMethod.GET)
	public String getEditProductAdmin(@RequestParam("productId") int productId, Model model) {
		Product product = productDao.getProductById(productId);
		Image[] images = new Image[2];
		for (Image image : product.getImages()) {
			if(image.getTypeId() == 1) 	// small image
				images[1] = image;
			else if(image.getTypeId() == 2)	// large image
				images[0] = image;
		}
		
		ProductModel productModel = new ProductModel();
		productModel.setId(product.getId());
		productModel.setName(product.getName());
		productModel.setIdproducttype(product.getProducttype().getId());
		productModel.setIdmanufacturer(product.getManufacturer().getId());
		productModel.setOverview(product.getOverview());
		productModel.setSpecification(product.getSpecification());
		productModel.setPrice(product.getPrice());
		productModel.setDiscount(product.getDiscount());
		productModel.setIdproductstate(product.getProductstate().getId());
		productModel.setLargeImgPath(images[0].getPath());
		productModel.setSmallImgPath(images[1].getPath());
		
		model.addAttribute("productModel", productModel);
		return "EditProduct";
	}
	
	@RequestMapping(value = { "/Admin/Edit.do" }, method = RequestMethod.POST)
	public String postEditProductAdmin(@RequestParam("productId") int productId,
			@ModelAttribute("productModel") @Valid ProductModel form,
			BindingResult result, Model model) {

		if (result.hasErrors())
			return "EditProduct";
		
		
		Product product = new Product();
		product.setId(productId);
		product.setName(form.getName());
		product.setOverview(form.getOverview());
		product.setDiscount(form.getDiscount());
		product.setPrice(form.getPrice());
		product.setSpecification(form.getSpecification());
		product.setProducttype(producttypeDao.getProducttypeById(form
				.getIdproducttype()));
		product.setProductstate(productstateDao.getProductstateById(form
				.getIdproductstate()));
		product.setManufacturer(manufacturerDao.getManufacturerById(form
				.getIdmanufacturer()));
		
		productDao.saveOrUpdateProduct(product);
		
		Image largeImg = new Image();
		Image smallImg = new Image();
		for (Image image : imageDao.getImagesByProductId(form.getId())) {
			if(image.getTypeId() == 1) 	// small image
				smallImg = image;
			else if(image.getTypeId() == 2)	// large image
				largeImg = image;
		}
		
		largeImg.setPath(form.getLargeImgPath());
		largeImg.setTypeId(2);
		largeImg.setProduct(product);		
		
		smallImg.setPath(form.getSmallImgPath());
		smallImg.setTypeId(1);
		smallImg.setProduct(product);
		
		imageDao.saveOrUpdateImage(largeImg);
		imageDao.saveOrUpdateImage(smallImg);
		
		
		return "redirect:/Product/Detail.do?maSP=" + product.getId();
	}
	
	@RequestMapping(value = { "/Admin/Delete.do" }, method = RequestMethod.GET)
	public String getDeleteProductAdmin(@RequestParam("productId") int productId, Model model) {
		Product product = productDao.getProductById(productId);
		Image[] images = new Image[2];
		for (Image image : product.getImages()) {
			if(image.getTypeId() == 1) 	// small image
				images[1] = image;
			else if(image.getTypeId() == 2)	// large image
				images[0] = image;
		}
		
		ProductModel productModel = new ProductModel();
		productModel.setId(product.getId());
		productModel.setName(product.getName());
		productModel.setIdproducttype(product.getProducttype().getId());
		productModel.setIdmanufacturer(product.getManufacturer().getId());
		productModel.setOverview(product.getOverview());
		productModel.setSpecification(product.getSpecification());
		productModel.setPrice(product.getPrice());
		productModel.setDiscount(product.getDiscount());
		productModel.setIdproductstate(product.getProductstate().getId());
		productModel.setLargeImgPath(images[0].getPath());
		productModel.setSmallImgPath(images[1].getPath());
		
		model.addAttribute("productModel", productModel);
		return "ConfirmDeleteProduct";
	}
	
	@RequestMapping(value = { "/Admin/Delete.do" }, method = RequestMethod.POST)
	public String postDeleteProductAdmin(@ModelAttribute("productModel") ProductModel form,
			BindingResult result, Model model) {

		Product product = productDao.getProductById(form.getId());
		productDao.deleteProduct(product);	
		
		
		return "redirect:/Product/GetProducts.do";
	}
}
