/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;
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

import com.bestbuy.dao.OrderDao;
import com.bestbuy.dao.OrderDetailDao;
import com.bestbuy.dao.OrderStateDao;
import com.bestbuy.dao.ProductDao;
import com.bestbuy.dao.ReceiverDao;
import com.bestbuy.model.ProductInCart;
import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Accounttype;
import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Orderstate;
import com.bestbuy.pojo.Receiver;

/**
 * 
 * @author VanQuoc-CNTT
 */
@Controller
@RequestMapping("/Cart")
public class CartController {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	ProductDao productDao = (ProductDao) context.getBean("productDao");
	ReceiverDao receiverDao = (ReceiverDao) context.getBean("receiverDao");
	OrderDetailDao orderDetailDao = (OrderDetailDao) context.getBean("orderDetailDao");
	OrderDao orderDao = (OrderDao) context.getBean("orderDao");
	OrderStateDao orderStateDao = (OrderStateDao) context.getBean("orderStateDao");
	public CartController() {
	}

	@RequestMapping(value = { "/Index.do" }, method = RequestMethod.GET)
	public String index(Model model, HttpSession session) {
//		Account account = (Account) session.getAttribute("Account");
//		if (account == null) {
//			return "redirect:/Account/GetLogin.do";
//		}

		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);

		return "ShoppingCart";
	}

	private ArrayList<ProductInCart> GetShoppingCart(HttpSession session) {
		ArrayList<ProductInCart> shopCart;
		if (session.getAttribute("ShoppingCart") == null) {
			shopCart = new ArrayList<ProductInCart>();
			session.setAttribute("ShoppingCart", shopCart);
		} else {
			shopCart = (ArrayList<ProductInCart>) session
					.getAttribute("ShoppingCart");
		}
		return shopCart;
	}

	@RequestMapping(value = { "/Add.do" }, method = RequestMethod.GET)
	public String AddProduct(@RequestParam("maSP") Integer maSP, Model model,
			HttpSession session) {
//		Account account = (Account) session.getAttribute("Account");
//		if (account == null) {
//			return "redirect:/Account/GetLogin.do";
//		}

		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);

		AddToCartAction(maSP, shopCart);
		return "ShoppingCart";
	}

	private void AddToCartAction(Integer maSp, ArrayList<ProductInCart> shopCart)
			throws NumberFormatException {
		int i = 0;
		for (i = 0; i < shopCart.size(); i++) {
			ProductInCart item = shopCart.get(i);
			if (item.getProduct().getId() == maSp) {
				item.setQuantity(item.getQuantity() + 1);
				break;
			}
		}
		// truong hop chua co san pham trong gio hang
		if (i == shopCart.size()) {
			ProductInCart item = new ProductInCart(
					productDao.getProductById(maSp), 1);
			shopCart.add(item);
		}
	}

	@RequestMapping(value = { "/Delete.do" }, method = RequestMethod.GET)
	public String DeleteProduct(@RequestParam("maSP") Integer maSP,
			Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Account/GetLogin.do";
		}

		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);
		DeleteItemCartAction(maSP, shopCart);

		return "ShoppingCart";
	}

	private void DeleteItemCartAction(Integer maSp,
			ArrayList<ProductInCart> shopCart) throws NumberFormatException {
		int i = 0;
		for (i = 0; i < shopCart.size(); i++) {
			ProductInCart item = shopCart.get(i);
			if (item.getProduct().getId() == maSp) {
				shopCart.remove(item);
				break;
			}
		}
	}

	@RequestMapping(value = { "/Update.do" }, method = RequestMethod.GET)
	public String UpdateAndLiquidateProduct(
			@RequestParam(value = "soLuong", required = false) String[] soLuong,
			Model model, HttpSession session) throws IOException {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Account/GetLogin.do";
		}

		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);

		UpdateCartAction(soLuong, shopCart);

		return "ShoppingCart";
	}

	private void UpdateCartAction(String[] soLuong,
			ArrayList<ProductInCart> shopCart) throws NumberFormatException {
		for (int i = 0; i < shopCart.size(); i++) {
			shopCart.get(i).setQuantity(Integer.parseInt(soLuong[i]));
		}
	}
	@RequestMapping(value = { "/Checkout.do" }, method = RequestMethod.GET)
	private String Checkout(@ModelAttribute("receiverModel") Receiver receiverModel, Model model, HttpSession session)
	{
		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);
		return "Checkout";
	}
	@RequestMapping(value = { "/SaveCheckout.do" }, method = RequestMethod.POST)
	private String SaveCheckout(@ModelAttribute("receiverModel")@Valid Receiver receiverModel,BindingResult result, Model model, HttpSession session)
	{
		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);
		Account acc = (Account) session.getAttribute("Account");
		if(acc!=null)
		{
			if(shopCart.size()>0)
			{
				Receiver receiver = new Receiver();
				if(receiverDao.checkExistByEmail(receiverModel.getEmail())==true)
				{
					
				}else
				{
					receiverModel.setOrders(null);
					receiverDao.insertNewReceiver(receiverModel);
				}
				receiver = receiverDao.getReceiverByEmail(receiverModel.getEmail());
				Order order = new Order();
				Date date = new Date();
				order.setCreateDate(date);
				order.setAccount(acc);
				Orderstate orderstate = new Orderstate();
				orderstate = orderStateDao.getOrderStateById(1);
				order.setOrderstate(orderstate);
				order.setReceiver(receiver);
				order.setTotal(1000000);
				orderDao.insertNewOrder(order);
			}
		}
		String s = receiverModel.getFullName();
		return "Checkout";
	}
	@RequestMapping(value = { "/DeleteFromCheckout.do" }, method = RequestMethod.GET)
	private String DeleteFromCheckout(@RequestParam("idProduct") Integer idProduct,HttpSession session)
	{
		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);
		DeleteItemCartAction(1,shopCart);
		return "redirect:/Cart/Checkout.do";
	}
	/*
	@RequestMapping(value = { "/Liquidate.do" }, method = RequestMethod.GET)
	public String LiquidateProduct(Model model, HttpSession session)
			throws IOException {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Account/GetLogin.do";
		}

		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);

		if (!shopCart.isEmpty()) {
			String url = LiquidateAction(account, shopCart, session);
			return "redirect:" + url;
		}
		return "ShoppingCart";
	}
	
	private String LiquidateAction(Account acc, ArrayList<ProductInCart> shopCart,
			HttpSession session) throws IOException {
		Order order = createOrderInfor(acc, shopCart);
		ArrayList<OrderDetail> orderDetails = createOrderDetail(order, shopCart);
		orderDetailDao.addOrderDetails(orderDetails);

		session.removeAttribute("ShopCart");
		return "/Order/GetOrderDetail.do?orderId=" + order.getId();

	}*/
}
