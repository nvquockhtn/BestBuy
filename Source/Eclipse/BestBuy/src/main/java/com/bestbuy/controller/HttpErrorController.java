package com.bestbuy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HttpErrorController {

	public HttpErrorController() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value="/errors/404.html")
    public String handle404() {
    	return "404Page";
    }

}
