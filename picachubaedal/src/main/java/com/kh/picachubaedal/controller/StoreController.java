package com.kh.picachubaedal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.StoreDto;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreDao storeDao;
	
	@GetMapping("/insert") //가게 등록
	public String insert() {
		return "/WEB-INF/views/store/insert.jsp";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute StoreDto storeDto) {
		storeDao.insert(storeDto);
		return "redirect:insertFinish";
	}
	@RequestMapping("/insertFinish") //등록 완료페이지
	public String insertFinish() {
		return "/WEB-INF/views/store/insertFinish.jsp";
	}
}
