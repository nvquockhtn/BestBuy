/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import com.bestbuy.dao.AccountDao;
import com.bestbuy.dao.ProductDao;
import com.bestbuy.model.AccountModel;
import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Product;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.log4j.Logger;

/**
 * 
 * @author VanQuoc-CNTT
 */
@Controller
@RequestMapping("/Account")
public class AccountController {

	private static final Logger logger = Logger.getLogger(AccountController.class);
	
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	AccountDao accountDao = (AccountDao) context.getBean("accountDao");
	ProductDao productDao = (ProductDao) context.getBean("productDao");
	
	ArrayList<Product> listProductDiscountDescs = productDao.getProductDiscountDesc();
	ArrayList<Product> listProductNews = productDao.getProductNew();
	
	public AccountController() {
	}

	@RequestMapping(value = { "/Index.do" }, method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("listProductDiscountDescs", listProductDiscountDescs);
		model.addAttribute("listProductNews", listProductNews);
		return "Account";
	}

	@RequestMapping(value = { "/GetRegistration.do" }, method = RequestMethod.GET)
	public String getRegistrationForm(
			@ModelAttribute("account") AccountModel form, Model model) {
		
		logger.warn("Nguoi dung dang ky tai khoan");
		
		model.addAttribute("listProductDiscountDescs", listProductDiscountDescs);
		
		model.addAttribute("listProductNews", listProductNews);
		return "Register";
	}

	@RequestMapping(value = "/PostRegistration.do", method = RequestMethod.POST)
	public String postRegistrationForm(
			@ModelAttribute("account") @Valid AccountModel form,
			BindingResult result, Model model) {

		//form.setFullName("vanquang");
		convertPasswordError(result);
		if(result.hasErrors())
			return "Register";
		
		// pass validation
		int rs = 4;
		String error = "";

		rs = RegisterAction(form);
		switch (rs) {
		case 0:
			error = "";
			break;
		case 1:
			error = "Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác";
			break;
		case 5:
			error = "Tạo tài khoản thất bại. Vui lòng thực hiện lại!";
			break;
		}

		model.addAttribute("Error", error);

		if (rs == 4) {
			return "RegistrationOK";
		} else {
			return "Register";
		}
	}

	private static void convertPasswordError(BindingResult result) {
		for (ObjectError error : result.getGlobalErrors()) {
			String msg = error.getDefaultMessage();
			if ("account.password.mismatch.message".equals(msg)) {
				if (!result.hasFieldErrors("password")) {
					result.rejectValue("password", "error.mismatch"); 
				}
			}
		}
	}

	private int RegisterAction(AccountModel model) {
		// --------- Kiem tra dieu kien ton tai
		Account acc = new Account(null, model.getFullName(), model.getEmail(),
				model.getAddress(), model.getPhoneNumber(), model.getCompany(),
				model.getUsername(), model.getPassword(), false, true, null,
				null);

		if (accountDao.checkExistByUserName(acc) == true) {
			return 1;
		}
		// --------- End Kiem tra dieu kien dang ky

		return accountDao.addAccount(acc) == true ? 4 : 5;
	}

	@RequestMapping(value = { "/GetLogin.do" }, method = RequestMethod.GET)
	public String getLogin(@ModelAttribute("account") AccountModel form,
			Model model) {		
		
		String error = "Failed!! Check again. Please!!";
		model.addAttribute("Error", error);
		return "Login";
	}

	/*
	@RequestMapping(value = { "/PostLogin.do" }, method = RequestMethod.POST)
	public String postLogin(@ModelAttribute("account") AccountModel form,
			Model model, HttpSession session) {
		String error = "";
		int rs = 3;

		rs = LoginAction(form, session);
		switch (rs) {
		case 0:
			error = "";
			break;
		case 1:
			error = "Tên đăng nhập hoặc mật khẩu không đúng";
			break;
		case 2:
			error = "Vui lòng điền đầy đủ các trường";
			break;
		}
		if (rs == 0) {
			return "redirect:/Home/Index.do";
		}
		model.addAttribute("Error", error);
		model.addAttribute("Result", rs);
		return "Login";
	}

	private int LoginAction(AccountModel model, HttpSession session) {
		if ("".equals(model.getUsername()) || "".equals(model.getPassword())) {
			return 2;
		}

		Account acc = accountDao
				.login(model.getUsername(), model.getPassword());
		if (acc != null) {
			session.setAttribute("Account", acc);
			return 0;
		}
		return 1;
	}

	@RequestMapping(value = { "/Logout.do" }, method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/Home/Index.do";
	}
	*/
}
