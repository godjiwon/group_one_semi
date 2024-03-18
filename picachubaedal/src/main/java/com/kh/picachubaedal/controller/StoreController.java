package com.kh.picachubaedal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.StoreDto;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, 
												new StringTrimmerEditor(true));
	}
	

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
	
	//가게 수정 페이지
	@GetMapping("/change")
	public String change(Model model, @RequestParam int storeNo) {
		StoreDto dto = storeDao.selectOne(storeNo);
		if(dto == null) {
			return "redirect:changeFail";
		}
		else {
			model.addAttribute("dto",dto);
			return "/WEB-INF/views/store/change.jsp";
		}
	}
	@PostMapping("/change")
	public String change(@ModelAttribute StoreDto dto) {
	    storeDao.update(dto);
	    return "redirect:/store/detail?storeNo=" + dto.getStoreNo();
	}
	@RequestMapping("/changeSuccess")
	public String changeSuccess() {
		return "/WEB-INF/views/store/changeSuccess.jsp";
	}
	@RequestMapping("/changeFail")
	public String changeFail() {
	    return "/WEB-INF/views/store/changeFail.jsp";
	}
	
	//상세


	



	
	//삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int storeNo) {
		storeDao.delete(storeNo);
		return "redirect:list";
	}
	
//	@RequestMapping("/list")
//	public String list(@ModelAttribute PageVO pageVO, Model model) {
//	    int count = storeDao.count(pageVO);
//	    pageVO.setCount(count);
//	    model.addAttribute("pageVO", pageVO);
//
//	    List<StoreDto> list = storeDao.selectListByPaging(pageVO);
//	    //System.out.print(list);
//	    model.addAttribute("list", list);
//
//	    return "/WEB-INF/views/store/list2.jsp";
//	}
	
	@RequestMapping("/list")
	public String list(Model model, HttpSession session) {
	    // 세션에서 현재 로그인한 회원의 회원번호를 가져옵니다.
		 Integer memberNo = (Integer) session.getAttribute("memberNo");

		 // 현재 로그인한 회원의 회원번호가 세션에 없으면 로그인 페이지로 리다이렉트합니다.
		    if (memberNo == null) {
		        return "redirect:/login"; // 로그인 페이지 URL로 변경하세요.
		    }
		    
	    // 현재 로그인한 회원의 회원번호를 사용하여 해당 회원이 소유한 가게 리스트를 조회합니다.
	    List<StoreDto> list = storeDao.selectListByMemberNo(memberNo);

	    // 조회된 가게 리스트를 모델에 추가합니다.
	    model.addAttribute("list", list);

	    // list2.jsp로 이동합니다.
	    return "/WEB-INF/views/store/list2.jsp";
	}

	// 사진 반환
	
	@RequestMapping("/storePhoto")
	public String image(HttpSession session, Model model) {
	    try {
	        int memberNo = (int) session.getAttribute("memberNo"); // 세션에서 로그인된 회원번호 가져오기
	        int storeNo = storeDao.findStoreNoByMemberNo(memberNo); // 회원번호로 가게번호 찾기
	        if (storeNo <= 0) {
	            throw new IllegalStateException("해당 회원의 가게를 찾을 수 없습니다.");
	        }
	        
	        int attachNo = storeDao.findAttachNo(storeNo); // 가게번호로 첨부 파일 번호 찾기
	        if (attachNo <= 0) {
	            throw new IllegalStateException("가게에 대한 첨부 파일을 찾을 수 없습니다.");
	        }

	        // Model에 이미지 경로 추가
	        model.addAttribute("imagePath", "/download?attachNo=" + attachNo);
	    } catch (Exception e) {
	        // 예외 처리
	        // 기본 이미지로 설정
	        model.addAttribute("imagePath", "/image/user.png");
	    }
	    return "storeList"; // storeList는 가게 리스트를 표시하는 뷰 페이지의 이름
	}

	
	

	
	
	
	
}
