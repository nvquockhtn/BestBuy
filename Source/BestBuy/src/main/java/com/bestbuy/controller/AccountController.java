/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author VanQuoc-CNTT
 */

@Controller
@RequestMapping("/Account")
public class AccountController {

    public AccountController() {
    }

    @RequestMapping(value = {"/GetRegistration.do"}, method = RequestMethod.GET)
    public String getRegistrationForm(Model model) {
        return "Register";
    }
}
