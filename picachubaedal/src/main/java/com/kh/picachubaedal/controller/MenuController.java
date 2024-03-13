package com.kh.picachubaedal.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.picachubaedal.dao.MenuDao;
import com.kh.picachubaedal.dto.MenuDto;
import com.kh.picachubaedal.vo.PageVO;

import jakarta.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private MenuDao dao;
	
	//입력
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/menu/insert.jsp";
	}
	
	//등록
	@PostMapping("/insert")
	public String insert(@ModelAttribute MenuDto dto) {
		dao.insert(dto);
		System.out.println("test");
		return "redirect:/menu/list";
	}
	
	@RequestMapping("/insertComplete")
	public String insertComplete() {
		return "/WEB-INF/views/menu/insertComplete.jsp";
	}
	
	//paging 처리 별도의 VO 클래스로 구현
	@RequestMapping("/list")
	public String list(@ModelAttribute PageVO pageVO, Model model) {
		//세부 계산은 클래서에서 수행/ count(설정해주지 않으면 페이지가 끝나지 않음), list만 처리
		int count = dao.count(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
			
		List<MenuDto> list = dao.selectListByPaging(pageVO);
		model.addAttribute("list", list);
			
		return "/WEB-INF/views/menu/list.jsp";
	}
	
	 @RequestMapping("/menuFileUpload")
	  public void menuFileUpload(MultipartFile file, HttpServletRequest request) {
	     String filePath = request.getSession().getServletContext().getRealPath("/resources/image/");
	     try {
	        FileOutputStream fos = new FileOutputStream(filePath + file.getOriginalFilename());
	        InputStream is = file.getInputStream();
	         
	        int readCount = 0;
	          byte[] buffer = new byte[1024];
	          while ((readCount = is.read(buffer)) != -1) {
	              fos.write(buffer, 0, readCount);
	          }
	     } catch (Exception e) {
	        System.out.println(e);
	     }
	  }
	  
	 //삭제
	 @GetMapping("/delete")
	 public String delete(@RequestParam int menuNo) {
		 dao.delete(menuNo);
		 return "redirect:/menu/list";
	 }
}















