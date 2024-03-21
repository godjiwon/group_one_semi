package com.kh.picachubaedal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	
	@GetMapping("/buy")
	public String buy() {
		
		
		return "/WEB-INF/views/orders/buy.jsp";
	}
}
