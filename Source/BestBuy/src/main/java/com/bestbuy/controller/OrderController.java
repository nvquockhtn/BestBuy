/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author VanQuoc-CNTT
 */
@Controller
@RequestMapping("/Order")
public class OrderController {

    public OrderController() {
        // TODO Auto-generated constructor stub
    }

    @RequestMapping(value = {"/Checkout.do"}, method = RequestMethod.GET)
    public String checkout() {

        return "Checkout";
    }
}