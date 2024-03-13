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

import com.kh.picachubaedal.dao.MenuDao;
import com.kh.picachubaedal.dto.MenuDto;
import com.kh.picachubaedal.service.AttachService;
import com.kh.picachubaedal.vo.PageVO;

import jakarta.servlet.http.HttpServletRequest;


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
    @ResponseBody
    public int insert(@ModelAttribute MenuDto dto) {
     menuDao.insert(dto);
       int test = menuDao.selectRecentMenu();
       return test;
     }
   
   @RequestMapping("/insertComplete")
   public String insertComplete() {
      return "/WEB-INF/views/menu/insertComplete.jsp";
   }
   
   //paging 처리 별도의 VO 클래스로 구현
   @RequestMapping("/list")
   public String list(@ModelAttribute PageVO pageVO, Model model) {
      //세부 계산은 클래서에서 수행/ count(설정해주지 않으면 페이지가 끝나지 않음), list만 처리
      int count = menuDao.count(pageVO);
      pageVO.setCount(count);
      model.addAttribute("pageVO", pageVO);
         
      List<MenuDto> list = menuDao.selectListByPaging(pageVO);
      model.addAttribute("list", list);
         
      return "/WEB-INF/views/menu/list.jsp";
   }
   
      @RequestMapping("/menuFileUpload")
      public String menuFileUpload(MultipartFile file, HttpServletRequest request, @RequestParam("menuNo") int menuNo) throws Exception {
         if(!file.isEmpty()) {
            int attachNo = attachService.save(file);
            menuDao.connect(menuNo, attachNo);
         }
         return "redirect:list";
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
       if(menuDto == null) {
          return "redirect:";
       }
       return "";
    }
}














