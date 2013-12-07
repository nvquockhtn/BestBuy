/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import com.bestbuy.model.AccountModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author VanQuoc-CNTT
 */
@Controller
@RequestMapping("/Home")
public class HomeController {

    @RequestMapping(value = {"/Index.do"}, method = RequestMethod.GET)
    public String Index(@ModelAttribute("account") AccountModel form) {
        return "Index";
    }

    public HomeController() {
    }
}
