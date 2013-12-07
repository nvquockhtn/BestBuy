/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author VanQuoc-CNTT
 */

@Controller
@RequestMapping("/WishList")
public class WishListController {

    public WishListController() {
    }

    @RequestMapping(value = {"/Index.do"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {

        return "WishList";
    }
}
