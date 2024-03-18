package com.kh.picachubaedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.picachubaedal.dao.CartDao;
import com.kh.picachubaedal.dao.MenuDao;
import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.CartDto;
import com.kh.picachubaedal.dto.MenuDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private MenuDao menuDao;
	

//	@RequestMapping("/list")
//	public String list(@ModelAttribute CartDto cartDto, Model model,
//							HttpSession session) {
//		String loginId = (String)session.getAttribute("loginId"); //아이디 추출
//		//메뉴디비에 있는 정보를 불러옴 (selectOne(cartNo))
//		List<MenuDto> list =  menuDao.selectList(); // 
//		model.addAttribute("list",list);
//		
//		//cart 디비에 저장
//		MenuDto menuDto = new MenuDto();
//		cartDto.setMemberId(loginId); //아이디 설정
//		cartDto.setMenuName(menuDto.getMenuName()); //메뉴명 복사
//		cartDto.setCartPrice(menuDto.getMenuPrice() * cartDto.getCartCount()); //메뉴 가격 * 장바구니 수량
//		
//		//cart 디비에 있는 정보를 jsp로 넘겨줌. ?
//		cartDao.add(cartDto);
//		
//		
//		return "/WEB-INF/views/cart/list.jsp";
//	}
	
	//장바구니 담기
//	@RequestMapping("/add")
//	public String add(@ModelAttribute CartDto cartDto, HttpSession session) {
//		String loginId = (String)session.getAttribute("loginId");
//		if(loginId == null) {
//			return "redirect:/member/signin";
//		}
//		
//		cartDto.setMemberId(loginId);
//		cartDto.setStoreName(cartDto.getStoreName());
//		cartDto.setMenuName(cartDto.getMenuName());
//		return "/WEB-INF/views/cart/list.jsp";
//	}
	
	//목록 
	@RequestMapping("/list")
	public String list(Model model) {
		List<CartDto> list = cartDao.selectList();
		model.addAttribute("list", list);
		return "/WEB-INF/views/cart/list.jsp";
	}
}
