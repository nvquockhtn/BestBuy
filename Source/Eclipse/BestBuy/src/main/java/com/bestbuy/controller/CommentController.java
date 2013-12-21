package com.bestbuy.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.hibernate.classic.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bestbuy.dao.CommentDao;
import com.bestbuy.dao.ProductDao;
import com.bestbuy.model.CommentModel;
import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Comment;

@Controller
@RequestMapping("/Comment")
public class CommentController {
	private static final Logger logger = Logger.getLogger(CommentController.class);	
	
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	CommentDao commentDao = (CommentDao) context.getBean("commentDao");
	ProductDao productDao = (ProductDao) context.getBean("productDao");

	public CommentController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = { "/Rating.do" }, method = RequestMethod.POST)
	public String Rating(@RequestParam("rating") float rating, HttpSession session) {
		session.setAttribute("Rating", rating);
		return "ProductDetail";
	}
	@RequestMapping(value = { "/Add.do" }, method = RequestMethod.POST)
	public String Add(@ModelAttribute("comment") @Valid CommentModel commnentModel,BindingResult result,
			Model model, HttpSession session) {
		
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Account/GetLogin.do";
		}
		
		if(result.hasErrors())
			return "redirect:/Product/Detail.do?maSP=" + commnentModel.getProductId();
		
		
		Float rating = (session.getAttribute("Rating") == null) ? 0 : (Float)session.getAttribute("Rating");
		
		Comment comment = new Comment();
		comment.setCreateDate(new Date());
		comment.setText(commnentModel.getText());
		comment.setProduct(productDao.getProductById(commnentModel.getProductId()));
		comment.setAccount(account);
		comment.setRating(rating);
		
		commentDao.add(comment);
		return "redirect:/Product/Detail.do?maSP=" + commnentModel.getProductId();
	}
}
