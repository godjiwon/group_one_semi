package com.kh.picachubaedal.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.picachubaedal.dao.MenuDao;
import com.kh.picachubaedal.dto.MenuDto;
import com.kh.picachubaedal.service.AttachService;
import com.kh.picachubaedal.vo.PageVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/menu")
public class MenuController {

   @Autowired
   private MenuDao menuDao;
   
   @Autowired
   private AttachService attachService;
   
   //입력
   @GetMapping("/insert")
   public String insert() {
      return "/WEB-INF/views/menu/insert.jsp";
   }

    //등록
    @PostMapping("/insert")
    public String insert(@ModelAttribute MenuDto menuDto, @RequestParam MultipartFile attach)
    		throws IllegalStateException, IOException {
    	//메뉴 정보 등록
     menuDao.insert(menuDto);
     
     //첨부파일 등록
     if (!attach.isEmpty()) {
			int attachNo = attachService.save(attach);
			menuDao.connect(menuDto.getMenuNo(), attachNo);
		}

		return "redirect:list";
	}
   
   @RequestMapping("/insertComplete")
   public String insertComplete() {
      return "/WEB-INF/views/menu/insertComplete.jsp";
   }
   
   //paging 처리 별도의 VO 클래스로 구현
   @RequestMapping("/list")
   public String list(@ModelAttribute PageVO pageVO, Model model, HttpSession session) {
      System.out.println(pageVO.getColumn());
      System.out.println(pageVO.getKeyword());
	  String loginId = (String) session.getAttribute("loginId");
//	  System.out.println(loginId);
	  // 로그인 아이디를 사용하여 해당 사용자의 storeNo를 가져옴
	  int storeNo = menuDao.selectStoreNo(loginId);
//	  System.out.println("Store No: " + storeNo);
	 //세부 계산은 클래서에서 수행/ count(설정해주지 않으면 페이지가 끝나지 않음), list만 처리 
//      int count = menuDao.count(pageVO);
//      	pageVO.setCount(count);
      	model.addAttribute("pageVO", pageVO);
         
      	List<MenuDto> list = menuDao.selectListByPaging(pageVO);
      	model.addAttribute("list", list);
        
     // storeNo를 모델에 추가
        model.addAttribute("storeNo", storeNo);
      	
       return "/WEB-INF/views/menu/list.jsp";
   }
   
   //메뉴이미지
   @RequestMapping("/menuFileUpload")
   public String menuFileUpload(MultipartFile file, HttpServletRequest request, @RequestParam("menuNo") int menuNo) throws Exception {
	   if(!file.isEmpty()) {
		   int attachNo = attachService.save(file);
		   menuDao.connect(menuNo, attachNo);
	   }
	   return "redirect:list";
   }
   
   @RequestMapping("/menuPhoto")
   public String menuPhoto(@RequestParam int menuNo) {
	   try {
		   int attachNo = menuDao.findAttachNo(menuNo);
		   return "redirect:/download?attachNo="+attachNo;
	   } catch(Exception e) {
		   return "redirect:/image/default.png";
	   }
   }
 
    //삭제
    @GetMapping("/delete")
    public String delete(@RequestParam int menuNo) {
       menuDao.delete(menuNo);
       return "redirect:/menu/list";
    }
    
    //수정
    @GetMapping("/edit")
    public String edit(@RequestParam int menuNo, Model model) {
       MenuDto menuDto = menuDao.selectOne(menuNo);
       model.addAttribute("menuDto",menuDto);
	   return "/WEB-INF/views/menu/edit.jsp";
    }
    
    @PostMapping("/edit")
    public String edit(@ModelAttribute MenuDto menuDto) {
    	menuDao.update(menuDto);
    	return "redirect:/menu/list";
    }
    @RequestMapping("/editFail")
	public String editFail() {
		return "/WEB-INF/views/menu/editFail.jsp";
	}
   
}