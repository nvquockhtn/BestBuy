/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bestbuy.dao.OrderDao;
import com.bestbuy.dao.OrderDetailDao;
import com.bestbuy.dao.OrderStateDao;
import com.bestbuy.dao.ProductDao;
import com.bestbuy.dao.ReceiverDao;
import com.bestbuy.model.ProductInCart;
import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Accounttype;
import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Orderdetail;
import com.bestbuy.pojo.Orderstate;
import com.bestbuy.pojo.Product;
import com.bestbuy.pojo.Receiver;


/**
 * 
 * @author VanQuoc-CNTT
 */
@Controller
@RequestMapping("/Cart")
public class CartController {
	private static final Logger logger = Logger.getLogger(CartController.class);
	
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
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			return "redirect:/Account/GetLogin.do";
		}

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
			HttpSession session,final RedirectAttributes redirectAttributes) {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			redirectAttributes.addAttribute("maSP", maSP);
			return "redirect:/Cart/Add.do";
		}

		/*Begin Log*/
		logger.warn(account.getUsername() + " "+ "them san pham vao gio hang, id san pham:" + maSP);
		/*End Log*/
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
			Model model, HttpSession session,final RedirectAttributes redirectAttributes) {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			redirectAttributes.addAttribute("maSP", maSP);
			return "redirect:/Cart/Delete.do";
		}

		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);
		DeleteItemCartAction(maSP, shopCart);

		/*Begin Log*/
		logger.warn(account.getUsername() + " "+ "xoa san pham khoi gio hang, id san pham:" + maSP);
		/*End Log*/
		
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
			Model model, HttpSession session,final RedirectAttributes redirectAttributes) throws IOException {
		Account account = (Account) session.getAttribute("Account");
		if (account == null) {
			redirectAttributes.addAttribute("soLuong", soLuong);
			return "redirect:/Cart/Update.do";
		}

		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);

		UpdateCartAction(soLuong, shopCart);

		/*Begin Log*/
		logger.warn(account.getUsername() + " "+ "update gio hang");
		/*End Log*/
		
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
		if(result.hasErrors())
			return "Checkout";
		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);
		Account acc = (Account) session.getAttribute("Account");
		if(acc!=null)
		{
			/*Begin Log*/
			logger.warn(acc.getUsername() + " "+ "checkout");
			/*End Log*/
			
			if(shopCart.size()>0)
			{
				Receiver receiver = new Receiver();
				if(receiverDao.checkExistByEmail(receiverModel.getEmail())==true)
				{
					
				}else
				{
					//receiverModel.setOrders(null);
					receiverDao.insertNewReceiver(receiverModel);
				}
				if(shopCart.size()>0)
				{
					receiver = receiverDao.getReceiverByEmail(receiverModel.getEmail().trim());
					Order order = createOrderInfor(acc, receiver, shopCart);
					createOrderDetail(order,shopCart);
					session.removeAttribute("ShoppingCart");
					int a = order.getId();
					String s = "redirect:/Cart/HistoryCheckout.do?idOrder=" +order.getId(); 
					return s;
				}else
				{
					return "Checkout";
				}
			}
		}else
		{
			return "redirect:/Account/GetLogin.do";
		}
		return "Checkout";
	}
	private Order createOrderInfor(Account acc,Receiver receiver, ArrayList<ProductInCart> shopCart) {
		int total = 0;
		for (int i = 0; i < shopCart.size(); i++) {
			ProductInCart item = shopCart.get(i);
			total += item.getQuantity() * item.getProduct().getPrice();
		}
		Order order = new Order();
		Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT 7:00"));
		order.setCreateDate(calendar.getTime());
		order.setAccount(acc);
		order.setTotal(total);
		Orderstate orderstate = new Orderstate();
		orderstate = orderStateDao.getOrderStateById(5);
		order.setOrderstate(orderstate);
		
		order.setReceiver(receiver);
		order.setTotal(total);
		order.setOrderdetails(null);
		orderDao.insertNewOrder(order);
		return order;
	}
	private boolean createOrderDetail(Order order,
			ArrayList<ProductInCart> shopCart) {
		ArrayList<Orderdetail> orderDetails = new ArrayList<Orderdetail>();
		for (int i = 0; i < shopCart.size(); i++) {
			Product product = new Product();
			product = productDao.getProductById(shopCart.get(i).getProduct().getId());
			Orderdetail orderDetail = new Orderdetail();
			orderDetail.setOrder(order);
			orderDetail.setProduct(product);
			orderDetail.setQuantity(shopCart.get(i).getQuantity());
			orderDetail.setUnitPrice(shopCart.get(i).getQuantity()*shopCart.get(i).getProduct().getPrice());
			orderDetailDao.insertNewOrderdetail(orderDetail);
		}
		return true;
	}

	@RequestMapping(value = { "/DeleteFromCheckout.do" }, method = RequestMethod.GET)
	private String DeleteFromCheckout(@RequestParam("idProduct") Integer idProduct,HttpSession session)
	{
		ArrayList<ProductInCart> shopCart = GetShoppingCart(session);
		DeleteItemCartAction(1,shopCart);
		return "redirect:/Cart/Checkout.do";
	}
	@RequestMapping(value = { "/HistoryCheckout.do" }, method = RequestMethod.GET)
	public String ShoppingHistory(Model model,@RequestParam("idOrder") Integer idOrder, HttpSession session)
	{
		ArrayList<Orderdetail> listorderdetails = orderDetailDao.getListOrderdetailByIdOrder(idOrder);
		String name = listorderdetails.get(0).getProduct().getName();
		model.addAttribute("listorderdetails", listorderdetails);
		return "HistoryCheckout";
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
