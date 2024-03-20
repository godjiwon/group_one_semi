package com.kh.picachubaedal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.picachubaedal.dao.CartDao;
import com.kh.picachubaedal.dto.CartDto;

@Controller
@RequestMapping("/cart")
public class CartController {

	
	@Autowired
	private CartDao cartDao; 
	
	//장바구니 getmapping 임시 잘되면 바로 post로
	@GetMapping("/insert")
	public String insert() {
		
		return "/WEB-INF/views/cart/insert.jsp";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute CartDto cartDto) {
		cartDao.insert(cartDto);
		
		return "/WEB-INF/views/cart/insertComplete.jsp";
	}
	
	
}
