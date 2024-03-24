package com.kh.picachubaedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.picachubaedal.dao.MemberDao;
import com.kh.picachubaedal.dao.MenuDao;
import com.kh.picachubaedal.dto.MemberDto;
import com.kh.picachubaedal.dto.StoreDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@Autowired
    private MenuDao menuDao;
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/")
	public String home(Model model,HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		MemberDto memberDto = memberDao.selectOne(loginId);
		model.addAttribute("memberDto", memberDto);
		
		List<StoreDto> bannerList = menuDao.selectHomeBannerPickData();
		model.addAttribute("bannerList", bannerList);
		
		return "/WEB-INF/views/home.jsp";
	}
}
