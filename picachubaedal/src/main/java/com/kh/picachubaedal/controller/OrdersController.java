package com.kh.picachubaedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.picachubaedal.dao.CartDao;
import com.kh.picachubaedal.dao.OrdersDao;
import com.kh.picachubaedal.dto.CartDto;
import com.kh.picachubaedal.dto.OrdersDto;
import com.kh.picachubaedal.service.CartService;
import com.kh.picachubaedal.service.OrdersService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private CartService cartService;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private OrdersService ordersService;

	// 구매등록
	@GetMapping("/buy")
	public String buy(HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("loginId");

		OrdersDto dto = new OrdersDto();
		int memberNo = (int) session.getAttribute("memberNo");
		List<CartDto> list = cartService.setStoreNames(cartDao.userCart(memberNo));
		dto = ordersService.setOrdersDto(list);

		model.addAttribute("dto", dto);
		return "/WEB-INF/views/orders/buy.jsp";
	}

	@PostMapping("/buy")
	public String buy(@ModelAttribute OrdersDto ordersDto) {
		ordersDao.insert(ordersDto);
		return "redirect:buyComplete";
	}

	// 결제 완료
	@RequestMapping("/buyComplete")
	public String buyComplete() {
		return "/WEB-INF/views/orders/buyComplete.jsp";
	}

	// 회원 구매내역 출력
	@RequestMapping("/buyList")
	public String buyList(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		List<OrdersDto> ordersList = ordersDao.userOrderList(loginId);
		List<OrdersDto> orderHistoryList = ordersService.orderHistorySet(ordersList);

		model.addAttribute("buyList", orderHistoryList);

		return "/WEB-INF/views/orders/buyList.jsp";
	}

}
