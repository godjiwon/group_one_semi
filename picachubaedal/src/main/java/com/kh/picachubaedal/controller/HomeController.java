package com.kh.picachubaedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import com.kh.picachubaedal.dao.MenuDao;
import com.kh.picachubaedal.dto.StoreDto;

@Controller
public class HomeController {

	@Autowired
    private MenuDao menuDao;
	
	@RequestMapping("/")
	public String home(Model model) {
		
		List<StoreDto> bannerList = menuDao.selectHomeBannerPickData();
		model.addAttribute("bannerList", bannerList);
		
		return "/WEB-INF/views/home.jsp";
	}
}
