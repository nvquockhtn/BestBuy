/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.interceptor;

import java.util.ArrayList;

import com.bestbuy.dao.AccountDao;
import com.bestbuy.dao.ManufacturerDao;
import com.bestbuy.dao.OrderStateDao;
import com.bestbuy.dao.ProductstateDao;
import com.bestbuy.dao.ProducttypeDao;
import com.bestbuy.model.AccountModel;
import com.bestbuy.model.CommentModel;
import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Manufacturer;
import com.bestbuy.pojo.Orderstate;
import com.bestbuy.pojo.Productstate;
import com.bestbuy.pojo.Producttype;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.classic.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author VanQuoc-CNTT
 */
public class BestbuyInterceptor implements HandlerInterceptor {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	OrderStateDao orderStateDao = (OrderStateDao) context
			.getBean("orderStateDao");
	AccountDao accountDao = (AccountDao) context.getBean("accountDao");
	ProductstateDao productstateDao = (ProductstateDao) context
			.getBean("productstateDao");
	ProducttypeDao producttypeDao = (ProducttypeDao) context
			.getBean("producttypeDao");
	ManufacturerDao manufacturerDao = (ManufacturerDao) context
			.getBean("manufacturerDao");

	ArrayList<Orderstate> orderstates = new ArrayList<Orderstate>();
	ArrayList<Manufacturer> listManufacturers = manufacturerDao
			.getListManufacturers();
	ArrayList<Producttype> lisProducttypes = producttypeDao
			.getListProducttypes();
	ArrayList<Productstate> listProductstates = productstateDao
			.getListProductstates();

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		orderstates = orderStateDao.getAll();

		return true;
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		request.setAttribute("listManufacturers", listManufacturers);
		request.setAttribute("listProducttypes", lisProducttypes);
		request.setAttribute("listProductstates", listProductstates);		
		request.setAttribute("OrderStates", orderstates);
		
		if (request.getAttribute("account") == null) {
			request.setAttribute("account", new AccountModel());
		}

		if (request.getAttribute("comment") == null) {
			request.setAttribute("comment", new CommentModel());
		}

		if (request.getAttribute("orderState") == null) {
			request.setAttribute("orderState", new Orderstate());
		}

		HttpSession session = request.getSession();
		if (isAuthenticated() == true) {
			if (session.getAttribute("Account") == null) {
				String username = SecurityContextHolder.getContext()
						.getAuthentication().getName();
				Account account = accountDao.getAccountByUserName(username);
				session.setAttribute("Account", account);
			}
		}
	}

	private boolean isAuthenticated() {
		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		return authentication != null
				&& !(authentication instanceof AnonymousAuthenticationToken)
				&& authentication.isAuthenticated();
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// throw new UnsupportedOperationException("Not supported yet."); //To
		// change body of generated methods, choose Tools | Templates.
	}
}
