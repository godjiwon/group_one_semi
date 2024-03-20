package com.kh.picachubaedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.picachubaedal.dao.CartDao;
import com.kh.picachubaedal.dao.MemberDao;
import com.kh.picachubaedal.dao.MenuDao;
import com.kh.picachubaedal.dto.CartDto;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private CartDao cartDao;

	// 장바구니 등록
	@PostMapping("/insert")
	public String insert(@ModelAttribute CartDto cartDto) {
		cartDao.insert(cartDto);

		return "/WEB-INF/views/cart/insertComplete.jsp";
	}

	@RequestMapping("/list")
	public String list(Model model) {

		List<CartDto> lllist;
		lllist = cartDao.selectList();
		model.addAttribute("qwer", lllist);
		return "/WEB-INF/views/cart/list.jsp";
	}
}
