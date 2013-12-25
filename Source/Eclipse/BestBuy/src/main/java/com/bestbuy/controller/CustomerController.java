package com.bestbuy.controller;

import java.util.ArrayList;

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

import com.bestbuy.dao.AccountDao;
import com.bestbuy.dao.AccounttypeDao;
import com.bestbuy.dao.BestBuyHelperDao;
import com.bestbuy.dao.CommentDao;
import com.bestbuy.dao.OrderDao;
import com.bestbuy.dao.OrderDetailDao;
import com.bestbuy.dao.ProductDao;
import com.bestbuy.dao.ReceiverDao;
import com.bestbuy.model.AccountFilterModel;
import com.bestbuy.model.UpdateAccountModel;
import com.bestbuy.pojo.Account;
import com.bestbuy.pojo.Accounttype;
import com.bestbuy.pojo.Comment;
import com.bestbuy.pojo.Order;
import com.bestbuy.pojo.Orderdetail;
import com.bestbuy.pojo.Product;
import com.bestbuy.pojo.Receiver;



@Controller
@RequestMapping("/Customer")
public class CustomerController {
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"beans-hibernate.xml");
	AccountDao accountDao = (AccountDao) context.getBean("accountDao");
	ProductDao productDao = (ProductDao) context.getBean("productDao");
	AccounttypeDao accounttypeDao = (AccounttypeDao) context.getBean("accounttypeDao");
	CommentDao commentDao = (CommentDao) context.getBean("commentDao");
	OrderDao orderDao = (OrderDao) context.getBean("orderDao");
	OrderDetailDao orderdetailDao = (OrderDetailDao)context.getBean("orderDetailDao");
	private int pageCount = 0;
	private int numberOnPage = 2;
	ArrayList<Account> listCustomers = new ArrayList<Account>();
	ArrayList<Accounttype> listAccounttypes = accounttypeDao.getListAccounttypes();
	
	ArrayList<Product> listProductDiscountDescs = productDao.getProductDiscountDesc();
	ArrayList<Product> listProductNews = productDao.getProductNew();
	private String error = "";
	private String notify = "";
	private boolean flagPostUpdateCustomer = false;
	public CustomerController() {
	}
	
	@RequestMapping(value = { "/Administrator/GetCustomer.do" }, method = RequestMethod.GET)
	public String index(@ModelAttribute("CustomerFilterModel") AccountFilterModel customerfilterModel,@RequestParam("page") Integer page,Model model)
	{
		//listCustomers = customerDao.getAllReceiver();
		pageCount = 0;
		int pageCountTemp = accountDao.searchAccountBy(customerfilterModel.getFullName(), customerfilterModel.getAddress(), customerfilterModel.getEmail()
				, customerfilterModel.getIsBlock(), customerfilterModel.getIsActive(), customerfilterModel.getTypeid(), page, numberOnPage);
		model.addAttribute("listCustomers", BestBuyHelperDao.listAccounts);
		String s = BestBuyHelperDao.listAccounts.size() + "";
		if (pageCountTemp > 0) {
			if (pageCountTemp % numberOnPage == 0) {
				pageCount = (int) pageCountTemp / numberOnPage;
			} else {
				pageCount = ((int) pageCountTemp / numberOnPage) + 1;
			}
		}
		model.addAttribute("listAccounttypes", listAccounttypes);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("page", page);
		return "CustomerManager";
	}
	@RequestMapping(value = { "/Administrator/DeleteCustomer.do" }, method = RequestMethod.GET)
	public String deleteCustomer(@ModelAttribute("CustomerFilterModel") AccountFilterModel customerfilterModel,@RequestParam("idCustomer") Integer idCustomer,Model model)
	{
		deleteCommentFromAccount(idCustomer);
		deleteOrderFromAccount(idCustomer);
		Account acc = accountDao.getAccountById(idCustomer);
		if(acc!=null)
		{
			accountDao.deleteAccount(acc);
		}
		pageCount = 0;
		int pageCountTemp = accountDao.searchAccountBy("", "", "", false, true, -1, 1, numberOnPage);
		model.addAttribute("listCustomers", BestBuyHelperDao.listAccounts);
		String s = BestBuyHelperDao.listAccounts.size() + "";
		if (pageCountTemp > 0) {
			if (pageCountTemp % numberOnPage == 0) {
				pageCount = (int) pageCountTemp / numberOnPage;
			} else {
				pageCount = ((int) pageCountTemp / numberOnPage) + 1;
			}
		}
		model.addAttribute("listAccounttypes", listAccounttypes);
		customerfilterModel.setIsBlock(false);
		customerfilterModel.setIsActive(true);
		customerfilterModel.setTypeid(-1);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("page", 1);
		model.addAttribute("notify", "Account had been delete successfully");
		notify = "";
		return "CustomerManager";
	}
	private void deleteCommentFromAccount(Integer idCustomer)
	{
		ArrayList<Comment> listCommentOfAccount = commentDao.getListCommentByIdAccount(idCustomer);
		if(listCommentOfAccount!=null)
		{
			for(int i=0;i<listCommentOfAccount.size();i++)
			{
				commentDao.deleteCommentByIdComment(listCommentOfAccount.get(i).getId());
			}
		}
	}
	public void deleteOrderFromAccount(Integer idCustomer)
	{
		ArrayList<Order> listOrderOfAccount = orderDao.getOrdersByAccountId(idCustomer);
		if(listOrderOfAccount!=null)
		{
			for(int i=0;i<listOrderOfAccount.size();i++)
			{
				ArrayList<Orderdetail> listOrderdetailOfOrder = orderdetailDao.getListOrderdetailByIdOrder(listOrderOfAccount.get(i).getId());
				if(listOrderdetailOfOrder!=null)
				{
					for(int j=0;j<listOrderdetailOfOrder.size();j++)
					{
						orderdetailDao.deleteOrderdetailById(listOrderdetailOfOrder.get(j).getId());
					}
				}
			}
		}
	}

	@RequestMapping(value = { "/Administrator/GetUpdateCustomer.do" }, method = RequestMethod.GET)
	public String getUpdateCustomer(@ModelAttribute("CustomerSeleted") UpdateAccountModel acc,@RequestParam("idCustomer") Integer idCustomer,Model model)
	{
		model.addAttribute("error", error);
		error = "";
		model.addAttribute("notify",notify);
		notify = "";
		Account account  = accountDao.getAccountById(idCustomer);
		acc.setU_email(account.getEmail());
		acc.setU_address(account.getAddress());
		acc.setU_fullName(account.getFullName());
		acc.setU_company(account.getCompany());
		acc.setU_phoneNumber(account.getPhoneNumber());
		acc.setU_username(account.getUsername());
		acc.setU_password(account.getPassword());
		acc.setU_isActive(account.getIsActive());
		acc.setU_isBlock(account.getIsBlock());
		acc.setU_accounttype(account.getAccounttype().getId());
		acc.setU_idAccount(idCustomer);
		model.addAttribute("listAccounttypes", listAccounttypes);
		model.addAttribute("listProductDiscountDescs", listProductDiscountDescs);
		model.addAttribute("listProductNews", listProductNews);
		return "CustomerManagerUpdate";
	}
	
	@RequestMapping(value = { "/Administrator/PostUpdateCustomer.do" }, method = RequestMethod.POST)
	public String postUpdateCustomer(@ModelAttribute("CustomerFilterModel") AccountFilterModel customerfilterModel,@ModelAttribute("CustomerSeleted")@Valid UpdateAccountModel acc,BindingResult result,Model model)
	{
		if(result.hasErrors())
			return "CustomerManagerUpdate";
		if(acc.getU_isBlock()==true||acc.getU_isActive()==false)
		{
			if(acc.getU_accounttype()==1)
			{
				error = "A admin cannot blocked account or don't active";
				String s = "redirect:/Customer/Administrator/GetUpdateCustomer.do?idCustomer=" + acc.getU_idAccount();
				return s;
			}
		}
		
		int idtypeaccount = acc.getU_accounttype();
		Accounttype accounttype = accounttypeDao.getAccounttypeById(idtypeaccount);
		Account account  = accountDao.getAccountById(acc.getU_idAccount());
		
		account.setEmail(acc.getU_email());
		account.setAddress(acc.getU_address());
		account.setFullName(acc.getU_fullName());
		account.setCompany(acc.getU_company());
		account.setPhoneNumber(acc.getU_phoneNumber());
		account.setIsActive(acc.getU_isActive());
		account.setIsBlock(acc.getU_isBlock());
		account.setUsername(acc.getU_username());
		account.setPassword(acc.getU_password());
		account.setAccounttype(accounttype);
		if(acc.getU_isReset()==true)
		{
			account.setPassword(acc.getU_email());
		}
		accountDao.updateAccout(account);
		notify = "You had been update susscesfully \n";
		if(acc.getU_isReset()==true)
		{
			notify = notify +  "Password has been change";
		}
		pageCount = 0;
		int pageCountTemp = accountDao.searchAccountBy("", "", "", acc.getU_isBlock(), acc.getU_isActive(), acc.getU_accounttype(), 1, numberOnPage);
		model.addAttribute("listCustomers", BestBuyHelperDao.listAccounts);
		String s = BestBuyHelperDao.listAccounts.size() + "";
		if (pageCountTemp > 0) {
			if (pageCountTemp % numberOnPage == 0) {
				pageCount = (int) pageCountTemp / numberOnPage;
			} else {
				pageCount = ((int) pageCountTemp / numberOnPage) + 1;
			}
		}
		model.addAttribute("listAccounttypes", listAccounttypes);
		customerfilterModel.setIsBlock(acc.getU_isBlock());
		customerfilterModel.setIsActive(acc.getU_isActive());
		customerfilterModel.setTypeid(acc.getU_accounttype());
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("notify", notify);
		notify = "";
		model.addAttribute("page", 1);
		return "CustomerManager";
	}
	
}
