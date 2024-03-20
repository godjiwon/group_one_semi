package com.kh.picachubaedal.controller;

import java.io.IOException;
import java.util.Arrays;
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

import com.kh.picachubaedal.dao.MemberDao;
import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.MemberDto;
import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.service.AttachService;
import com.kh.picachubaedal.service.ImageService;
import com.kh.picachubaedal.vo.PageVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private StoreDao storeDao;
//	@Autowired
//    private StoreService storeService;
	
	
	@Autowired
	private ImageService imageService;
	
	@GetMapping("/insert1") //가게 등록
	public String insert() {
		return "/WEB-INF/views/store/insert1.jsp";
	}
	
	   @PostMapping("/insert1")
	   public String insert(@ModelAttribute StoreDto storeDto, @RequestParam MultipartFile attach)
	            throws IllegalStateException, IOException {
	      //가게 정보 등록
	      storeDao.insert(storeDto, attach);
	      int recentStoreNo = storeDao.selectRecentStore();
	      //첨부파일 등록
	      if(!attach.isEmpty()) {
	         int attachNo = attachService.save(attach);
	         storeDao.connect(recentStoreNo, attachNo);
	      }

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
	
	
//	@RequestMapping("/detail")
//	public String storeMypage(HttpSession session, Model model) {
//	    // 세션에서 로그인된 회원의 정보를 가져옵니다.
//		String loginId = (String) session.getAttribute("loginId");
//		
//		MemberDto memberDto = memberDao.selectOne(loginId);
//	    
//	    if (memberDto == null) {
//	        // 로그인되지 않은 경우 처리할 내용
//	        return "redirect:/login"; // 로그인 페이지로 이동하도록 리다이렉트합니다.
//	    }
//	    
//	    // 로그인된 회원의 회원번호를 가져옵니다.
//	    int memberNo = memberDto.getMemberNo();
//	    
//	    // 회원 번호를 기준으로 해당 가게의 정보를 조회합니다.
//	    MemberDto storeDto = storeDao.selectByMemberNo(memberNo);
//	    
//	    if (storeDto == null) {
//	        // 가게 정보가 없는 경우 처리할 내용
//	        return "redirect:/insert1"; // 가게 등록 페이지로 이동하도록 리다이렉트합니다.
//	    }
//	    
//	    // 조회된 가게 정보를 모델에 추가하여 가게의 마이페이지 화면으로 전달합니다.
//	    model.addAttribute("storeDto", storeDto);
//		return "/WEB-INF/views/store/detail";
//	}


	// 가게 상세
		@RequestMapping("/detail")
		public String myStore(@RequestParam int storeNo, Model model) {
			StoreDto storeDto = storeDao.selectOne(storeNo);
			String storeImageLink = imageService.getStoreImgLink(storeNo);
			
			storeDto.setStoreImgLink(storeImageLink);
			model.addAttribute("storeDto", storeDto);

			return "/WEB-INF/views/store/detail.jsp";
		}
		
		
		
		//가게 삭제
		@GetMapping("/storeDelete")
		public String deleteAccount() {
		    return "/WEB-INF/views/store/storeDelete.jsp";
		}

		@PostMapping("/storeDelete")
		public String deleteStore(HttpSession session, @RequestParam String storeBusinessNumber) {
		    // 데이터베이스에서 해당 사업자 등록번호에 해당하는 가게 정보 조회
		    StoreDto storeDto = storeDao.selectByBusinessNumber(storeBusinessNumber);

		    // 콘솔에 입력된 사업자 등록번호와 해당하는 가게 정보 출력
		    System.out.println("입력된 사업자 등록번호: " + storeBusinessNumber);
		    if (storeDto != null) {
		        System.out.println("DB에서 조회된 가게 정보: " + storeDto.toString());
		    } else {
		        System.out.println("DB에서 해당 사업자 등록번호에 해당하는 가게 정보가 없습니다.");
		    }

		    // 조회된 가게가 있고, 입력한 사업자 등록번호와 일치하는 경우에만 삭제
		    if (storeDto != null && storeBusinessNumber.equals(storeDto.getStoreBusinessNumber())) {
		        // 가게 삭제 처리
		        int storeNo = storeDto.getStoreNo();
		        storeDao.delete(storeNo);

		        return "redirect:storeDeleteFinish";
		    } else {
		        // 가게가 없거나 사업자 등록번호가 일치하지 않는 경우
		        return "redirect:storeDeleteFail";
		    }
		}


		@RequestMapping("/storeDeleteFinish")
		public String deleteStoreFinish() {
		    return "/WEB-INF/views/store/storeDeleteFinish.jsp";
		}

		@RequestMapping("/storeDeleteFail")
		public String deleteStoreFail() {
		    return "/WEB-INF/views/store/storeDeleteFail.jsp";
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
	
//		목록
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

//	//전체 목록
//	 @GetMapping("/categoryList")
//	    public String yourHandlerMethod(Model model,@RequestParam String storeCategory, @ModelAttribute PageVO pageVO) {
//	        // DAO에서 전체 목록을 조회하여 모델에 추가
//	        List<StoreDto> categoryList = storeDao.selectListAll();
//	        model.addAttribute("categoryList", categoryList);
//	        
//	        int count = storeDao.count(pageVO);
//	        pageVO.setCount(count);
//	        model.addAttribute("pageVO", pageVO);
//	        
//	        List<StoreDto> list = storeDao.selectListByPaging(pageVO);
//	        
//	        // 다른 처리 작업...
//
//	        // JSP 파일 이름 반환
//	        return "/WEB-INF/views/store/categoryList.jsp";
//	    }
	 
	//카테고리 전체 목록
	@GetMapping("/categoryList")
	public String yourHandlerMethod(Model model, @RequestParam String storeCategory, @ModelAttribute PageVO pageVO) {
	    // DAO에서 특정 카테고리의 가게 목록을 조회하여 모델에 추가
	    List<StoreDto> categoryList = storeDao.selectListCategory(storeCategory);
	    model.addAttribute("categoryList", categoryList);
	    
	    // 페이지 처리를 위한 작업
	    int count = storeDao.count(pageVO);
	    pageVO.setCount(count);
	    model.addAttribute("pageVO", pageVO);
	    
	    List<StoreDto> list = storeDao.selectListByPaging(pageVO);
	    
	    // 다른 처리 작업...
	    
	    // JSP 파일 이름 반환
	    return "/WEB-INF/views/store/categoryList.jsp";
	}

	
	
	
	// 사진 반환
	@RequestMapping("/storePhoto")
	public String image(HttpSession session) {
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

	        return "redirect:/download?attachNo=" + attachNo; // 첨부 파일 다운로드 링크로 리다이렉트
	    } catch (Exception e) {
	        // 예외 처리

	        return "redirect:/image/user.png"; // 기본 이미지로 리다이렉트
	    }
	}
	
	//홈에서 카테고리별 목록 표시
	@GetMapping("/")
	public String home() {
	    // 홈 페이지로 이동하는 코드 추가
	    return "home"; // 홈 페이지로 이동하는 뷰의 이름을 반환
	}


	
	
	

	
}
