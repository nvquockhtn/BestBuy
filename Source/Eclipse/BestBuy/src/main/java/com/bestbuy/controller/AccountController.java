/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import com.bestbuy.dao.AccountDao;
import com.bestbuy.model.AccountModel;
import com.bestbuy.pojo.Account;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * @author VanQuoc-CNTT
 */
@Controller
@RequestMapping("/Account")
public class AccountController {

	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	AccountDao accountDao = (AccountDao) context.getBean("accountDao");

	public AccountController() {
	}

	@RequestMapping(value = { "/Index.do" }, method = RequestMethod.GET)
	public String index(Model model) {
		return "Account";
	}

	@RequestMapping(value = { "/GetRegistration.do" }, method = RequestMethod.GET)
	public String getRegistrationForm(
			@ModelAttribute("account") AccountModel form, Model model) {
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
		String error = "Vui lòng điền đầy đủ các trường";
		model.addAttribute("Error", error);
		return "Login";
	}

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
}
