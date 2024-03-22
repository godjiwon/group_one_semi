package com.kh.picachubaedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.picachubaedal.dao.CartDao;
import com.kh.picachubaedal.dto.CartDto;
import com.kh.picachubaedal.dto.OrdersDto;
import com.kh.picachubaedal.service.CartService;
import com.kh.picachubaedal.service.OrdersService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/orders")
public class OrdersController {
	
	
	@Autowired
	private CartService cartService;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private OrdersService ordersService;

	
	@GetMapping("/buy")
	public String buy(HttpSession session,Model model) {
		OrdersDto dto = new OrdersDto();
		int memberNo = (int)session.getAttribute("memberNo");
		List<CartDto> list = cartService.setStoreNames(cartDao.userCart(memberNo));
		dto = ordersService.setOrdersDto(list);
		
		
		model.addAttribute("dto", dto);
		return "/WEB-INF/views/orders/buy.jsp";
	}
}