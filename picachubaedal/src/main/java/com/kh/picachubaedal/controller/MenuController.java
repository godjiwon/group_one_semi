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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.picachubaedal.dao.AttachDao;
import com.kh.picachubaedal.dao.MenuDao;
import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.MenuDto;
import com.kh.picachubaedal.dto.StoreDto;
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
   private StoreDao storeDao;
   
   @Autowired
   private AttachDao attachDao;
   
   @Autowired
   private AttachService attachService;
   
   /**
    *  메뉴 등록 페이지
    *  @mappig get
    *  @return /menu/insert.jsp
    */
   //GET 요청을 처리하는 핸들러 메서드로, 메뉴 등록 폼을 보여줌
   @GetMapping("/insert")
   public String insert(Model model, @RequestParam int storeNo) {//Model 객체를 사용하여 뷰로 데이터를 전달
	  //가게번호 test
	  model.addAttribute("storeNo", storeNo);// 가게 번호를 모델에 추가
      return "/WEB-INF/views/menu/insert.jsp";
   }

   /**
    *  메뉴 등록
    *  @mappig post
    *  @param menuDto
    *  @param attach
    *  @return redirect:list
    */
   //POST 요청을 처리하는 핸들러 메서드로, 실제로 메뉴를 등록
   @PostMapping("/insert")
   @ResponseBody//ajax로 데이터 받을 때 사용
   public int insert(@ModelAttribute MenuDto menuDto,
		   			//파일 업로드를 처리. menuImage 파라미터는 업로드된 이미지 파일을 받음
		   			 @RequestParam(value = "menuImage", required = false) MultipartFile menuImage) throws Exception {
	    //메뉴 정보 등록
	    menuDao.insert(menuDto);
	    int menuNo = menuDao.selectRecentMenu();//가장 최근에 등록된 메뉴의 번호를 조회: 이미지 파일과 메뉴 정보를 연결하기 위해
	    if(menuImage != null) {
	    	int attachNo = attachService.save(menuImage);
	    	menuDao.connect(menuNo, attachNo);
	    }
	    return menuNo;
   }

   /**
    *  메뉴 등록 성공 페이지
    *  @mappig post
    *  @return redirect:list
    */    
   @RequestMapping("/insertComplete")
   public String insertComplete() {
      return "/WEB-INF/views/menu/insertComplete.jsp";
   }
   
   /**
    *  사장님 메뉴 리스트 페이지
    *  @param pageVO
    *  @param model
    *  @param session
    *  @return /menu/ceoMenuList.jsp
    */
   @RequestMapping("/ceoMenuList")
   public String ceoMenuList(@ModelAttribute PageVO pageVO, Model model, HttpSession session, @RequestParam int storeNo) {
			  
		//가게이름 가져오기
		StoreDto storeDto = storeDao.selectOne(storeNo);
		model.addAttribute("storeDto", storeDto);
		
	    //	세부 계산은 클래서에서 수행/ count(설정해주지 않으면 페이지가 끝나지 않음), list만 처리 
		int count = menuDao.count(pageVO, storeNo);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<MenuDto> list = menuDao.selectListByPaging(pageVO, storeNo);
		model.addAttribute("list", list);
		        
		// storeNo를 모델에 추가
		model.addAttribute("storeNo", storeNo);
		return "/WEB-INF/views/menu/ceoMenuList.jsp";
   }
   
   /**
    *  고객 메뉴 리스트 페이지
    *  @param pageVO
    *  @param model
    *  @param session
    *  @return /menu/customerMenuList.jsp
    */     
   @RequestMapping("/customerMenuList")
   public String customerMenuList(@ModelAttribute PageVO pageVO, Model model, HttpSession session, @RequestParam int storeNo) {
	   
		//가게이름 가져오기
		StoreDto storeDto = storeDao.selectOne(storeNo);
		model.addAttribute("storeDto", storeDto);
		
	    //	세부 계산은 클래서에서 수행/ count(설정해주지 않으면 페이지가 끝나지 않음), list만 처리 
		int count = menuDao.count(pageVO, storeNo);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		List<MenuDto> list = menuDao.selectListByPaging(pageVO, storeNo);
		model.addAttribute("list", list);
		        
		// storeNo를 모델에 추가
		model.addAttribute("storeNo", storeNo);
	      	
		return "/WEB-INF/views/menu/customerMenuList.jsp";
   }

   /**
    *  메뉴 사진 찾기
    *  @param menuNo
    *  @return redirect:/download?attachNo="+attachNo
    *  @return redirect:/image/default.png
    */    
   @RequestMapping("/menuPhoto")
   public String menuPhoto(@RequestParam int menuNo) {
	   try {
		   int attachNo = menuDao.findAttachNo(menuNo);
		   return "redirect:/download?attachNo="+attachNo;
	   } catch(Exception e) {
		   return "redirect:/image/default.png";
	   }
   }
 
   /**
    *  메뉴 삭제
    *  @mappig post
    *  @param menuNo
    *  @return redirect:/menu/list
    */
   @GetMapping("/delete")
   public String delete(@RequestParam int menuNo) {
      menuDao.delete(menuNo);
      return "redirect:/menu/ceoMenuList";
   }
    
   /**
    *  메뉴 수정 페이지
    *  @mappig post
    *  @param menuNo
    *  @param model
    *  @return /menu/edit.jsp
    */
   @GetMapping("/edit")
   public String edit(@RequestParam int menuNo, Model model) {
      MenuDto menuDto = menuDao.selectOne(menuNo);
      model.addAttribute("menuDto",menuDto);
	  return "/WEB-INF/views/menu/edit.jsp";
   }
    
   /**
    *  메뉴 수정
    *  @mappig post
    *  @param menuDto
    *  @return redirect:/menu/list
    */   
   @PostMapping("/edit")
   @ResponseBody
   public int edit(@ModelAttribute MenuDto menuDto,
		   		   @RequestParam(value = "menuImage", required = false) MultipartFile menuImage) throws Exception {
	   menuDao.update(menuDto);
	   if (menuImage != null) {
		   int beforeAttachNo = menuDao.selectAttcahNo(menuDto.getMenuNo());
	       if (beforeAttachNo != 0) {
	           attachDao.delete(beforeAttachNo);
	       }
	       int attachNo = attachService.save(menuImage);
	       menuDao.connect(menuDto.getMenuNo(), attachNo);
       }
       
	   return menuDto.getMenuNo();
   }
   
   /**
    *  메뉴 수정 완료 페이지
    *  @mappig post
    *  @return /menu/editFail.jsp
    */   
   @RequestMapping("/editFail")
   public String editFail() {
	   return "/WEB-INF/views/menu/editFail.jsp";
   }
   
}