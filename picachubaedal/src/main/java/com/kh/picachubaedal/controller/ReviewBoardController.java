package com.kh.picachubaedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.picachubaedal.dao.ReviewBoardDao;
import com.kh.picachubaedal.dto.ReviewBoardDto;
import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.service.ListWithUserInfo;

@Controller
@RequestMapping("/review-board")
public class ReviewBoardController {

	@Autowired
	ReviewBoardDao reviewBoardDao;

	@Autowired
	ListWithUserInfo listWithUserInfo;

//	// 테스트용임시
//	@RequestMapping("/list")
//	public String list(Model model) {
//
//		List<ReviewBoardDto> list = listWithUserInfo.listWithUserInfo();
//
//		model.addAttribute("listAll", list);
//		return "/WEB-INF/views/reviewBoard/listAll.jsp";
//	}
	
	//가게 리뷰게시판 목록
	@RequestMapping("/list")
	public String list(Model model, @RequestParam int storeNo) {
		
		List<ReviewBoardDto> list = listWithUserInfo.listWithUserInfo(storeNo);
		
		model.addAttribute("list", list);
		return "/WEB-INF/views/reviewBoard/list2.jsp";
	}
	

	// 리뷰작성
	@GetMapping("/write")
	public String write(@RequestParam int storeNo) {

		return "/WEB-INF/views/reviewBoard/write.jsp";
	}

	@PostMapping("/write")
	public String write(@ModelAttribute ReviewBoardDto boardDto) {
		reviewBoardDao.insert(boardDto);

		return "redirect:writeFinish";
	}
	
	@RequestMapping("/writeFinish")
	public String writeFinish() {
		
		return "/WEB-INF/views/reviewBoard/writeFinish.jsp";
	}

}