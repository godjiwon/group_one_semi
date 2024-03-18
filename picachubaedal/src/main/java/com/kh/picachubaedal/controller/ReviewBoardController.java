package com.kh.picachubaedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.picachubaedal.dao.ReviewBoardDao;
import com.kh.picachubaedal.dto.ReviewBoardDto;
import com.kh.picachubaedal.service.ListWithUserInfo;

@Controller
@RequestMapping("/review-board")
public class ReviewBoardController {

	@Autowired
	ReviewBoardDao reviewBoardDao;
	
	@Autowired
	ListWithUserInfo listWithUserInfo;
	
	//테스트용임시
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<ReviewBoardDto> list = listWithUserInfo.listWithUserInfo();
		
		model.addAttribute("listAll", list);
		return "/WEB-INF/views/reviewBoard/listAll.jsp";
	}
	
	//리뷰작성
	@GetMapping("/write")
	public String write() {
		
		return "/WEB-INF/views/reviewBoard/write.jsp";
	}
	
	/*
	 * @PostMapping("/write") public String write() {
	 * 
	 * return "redirect:list"; }
	 */
}
