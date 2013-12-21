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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bestbuy.dao.AccountDao;
import com.bestbuy.dao.OrderDao;
import com.bestbuy.dao.OrderStateDao;
import com.bestbuy.model.OrderFilterModel;
import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Orderstate;

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
	public String getMyOrder(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Order/Index.do";
		}

		model.addAttribute("MyOrders",
				orderDao.getOrdersByAccountId(account.getId()));
		model.addAttribute("OrderFilterModel", new OrderFilterModel());
		return "MyOrder";
	}

	@RequestMapping(value = { "/Cancel.do" }, method = RequestMethod.GET)
	public String cancelByCustomer(@RequestParam("orderId") Integer orderId,
			Model model, HttpSession session,
			final RedirectAttributes redirectAttributes) {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			redirectAttributes.addAttribute("orderId", orderId);
			return "redirect:/Order/Cancel.do";
		}

		updateOrder(orderId, account, 2);

		return "redirect:/Order/Index.do";
	}

	@RequestMapping(value = { "/Reactive.do" }, method = RequestMethod.GET)
	public String reactiveByCustomer(@RequestParam("orderId") Integer orderId,
			Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Account/GetLogin.do";
		}

		updateOrder(orderId, account, 5); // dang cho xac nhan

		return "redirect:/Order/Index.do";
	}

	/**
	 * @param orderId
	 * @param account
	 */
	private void updateOrder(Integer orderId, Account account, int typeId) {
		Order order = orderDao.getOrderById(orderId);
		if (order != null) {
			if (account != null) {
				if (order.getAccount().getId().intValue() == account.getId()
						.intValue()) { // Kiem tra don dat hang co phai cua nguoi nay ko???
					order.setOrderstate(orderStateDao.getOrderStateById(typeId));
					orderDao.updateOrder(order);
				}
			} else {
				order.setOrderstate(orderStateDao.getOrderStateById(typeId));
				orderDao.updateOrder(order);
			}
		}
	}

	@RequestMapping(value = { "/Filter.do" }, method = RequestMethod.POST)
	public String filter(
			@ModelAttribute("OrderFilterModel") OrderFilterModel form,
			Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Account/GetLogin.do";
		}

		model.addAttribute("MyOrders", orderDao.filterOrders(account.getId(),
				form.getOrderStateId(), form.getFromDate(), form.getToDate()));

		return "MyOrder";
	}

	@RequestMapping(value = { "/Administrator/Index.do" }, method = RequestMethod.GET)
	public String getOrders(Model model, HttpSession session) {

		model.addAttribute("Orders", orderDao.getAllOrder());
		model.addAttribute("OrderFilterModel", new OrderFilterModel());
		return "OrderManagement";
	}

	@RequestMapping(value = { "/Administrator/Filter.do" }, method = {RequestMethod.POST})
	public String adminFilter(
			@ModelAttribute("OrderFilterModel") OrderFilterModel form,
			Model model, HttpSession session) {

		model.addAttribute("Orders",orderDao.filterOrders(null, form.getOrderStateId(),form.getFromDate(), form.getToDate()));
		return "OrderManagement";
	}
	
	@RequestMapping(value = { "/Administrator/Cancel.do" }, method = RequestMethod.GET)
	public String cancelByAdmin(@RequestParam("orderId") Integer orderId,
			Model model) {		

		updateOrder(orderId, null, 3);

		return "redirect:/Order/Administrator/Index.do";
	}

	@RequestMapping(value = { "/Administrator/Reactive.do" }, method = RequestMethod.GET)
	public String reactiveByAdmin(@RequestParam("orderId") Integer orderId,
			Model model, HttpSession session) {
		
		updateOrder(orderId, null, 5); // dang cho xac nhan

		return "redirect:/Order/Administrator/Index.do";
	}
	
	@RequestMapping(value = { "/Administrator/Delivered.do" }, method = RequestMethod.GET)
	public String deliveredByAdmin(@RequestParam("orderId") Integer orderId,
			Model model, HttpSession session) {
		
		updateOrder(orderId, null, 4); // da giao hang

		return "redirect:/Order/Administrator/Index.do";
	}
	
	@RequestMapping(value = { "/Administrator/Approve.do" }, method = RequestMethod.GET)
	public String approveByAdmin(@RequestParam("orderId") Integer orderId,
			Model model, HttpSession session) {
		
		updateOrder(orderId, null, 1); // dang giao hang

		return "redirect:/Order/Administrator/Index.do";
	}
}