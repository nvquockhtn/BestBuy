/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import com.bestbuy.dao.AccountDao;
import com.bestbuy.model.AccountModel;
import com.bestbuy.pojo.Account;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping(value = {"/GetRegistration.do"}, method = RequestMethod.GET)
    public String getRegistrationForm(Model model) {
        return "Register";
    }

    @RequestMapping(value = {"/Login.do"}, method = RequestMethod.POST)
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
            return "Index";
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
}
