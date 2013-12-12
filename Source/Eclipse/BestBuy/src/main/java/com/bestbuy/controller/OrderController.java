/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bestbuy.dao.AccountDao;
import com.bestbuy.dao.OrderDao;
import com.bestbuy.dao.OrderStateDao;
import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Order;

/**
 * 
 * @author VanQuoc-CNTT
 */
@Controller
@RequestMapping("/Order")
public class OrderController {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	OrderDao orderDao = (OrderDao) context.getBean("orderDao");
	OrderStateDao orderStateDao = (OrderStateDao) context
			.getBean("orderStateDao");

	public OrderController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = { "/Checkout.do" }, method = RequestMethod.GET)
	public String checkout() {

		return "Checkout";
	}

	@RequestMapping(value = { "/Index.do" }, method = RequestMethod.GET)
	public String myOrder(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Account/GetLogin.do";
		}

		model.addAttribute("MyOrders",
				orderDao.getOrdersByAccountId(account.getId()));
		return "MyOrder";
	}

	@RequestMapping(value = { "/Cancel.do" }, method = RequestMethod.GET)
	public String cancelByCustomer(@RequestParam("orderId") Integer orderId,
			Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Account/GetLogin.do";
		}

		Order order = orderDao.getOrderById(orderId);
		if (order != null) {
			if (order.getAccount().getId().intValue() == account.getId().intValue()) { // Kiem tra don dat hang co phai cua nguoi nay ko???
				order.setOrderstate(orderStateDao.getById(2)); // id = 2: Huy boi khach hang
				orderDao.updateOrder(order);
			}
		}
		return "redirect:/Order/Index.do";
	}
}