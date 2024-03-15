package com.kh.picachubaedal.controller;

import java.io.IOException;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.service.AttachService;
import com.kh.picachubaedal.vo.PageVO;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, 
												new StringTrimmerEditor(true));
	}
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private StoreDao storeDao;
	
	@GetMapping("/insert1") //가게 등록
	public String insert() {
		return "/WEB-INF/views/store/insert1.jsp";
	}
	
	@PostMapping("/insert1")
	public String insert(@ModelAttribute StoreDto storeDto, @RequestParam MultipartFile attach, Model model)
	            throws IllegalStateException, IOException {
		// 가게 정보 등록
		storeDao.insert(storeDto, attach);

	    // 가게 정보가 등록되고 나서 가게 번호를 가져옴
	    int storeNo = storeDto.getStoreNo();

	    // 첨부 파일 등록
	    if (!attach.isEmpty()) {
	        int attachNo = attachService.save(attach);
	        // 가게 정보에 첨부 파일 연결
	        storeDao.connect(storeNo, attachNo);
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
	
	//상세
	@RequestMapping("/detail")
	public String detail(@RequestParam int storeNo, Model model) {
		StoreDto dto = storeDao.selectOne(storeNo);
		model.addAttribute("dto",dto);
		return "/WEB-INF/views/store/detail.jsp";
	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int storeNo) {
		storeDao.delete(storeNo);
		return "redirect:list";
	}
	
	@RequestMapping("/list")
	public String list(@ModelAttribute PageVO pageVO, Model model) {
	    int count = storeDao.count(pageVO);
	    pageVO.setCount(count);
	    model.addAttribute("pageVO", pageVO);

	    List<StoreDto> list = storeDao.selectListByPaging(pageVO);
	    model.addAttribute("list", list);

	    return "/WEB-INF/views/store/list2.jsp";
	}

	
	
	
	
	
	
	
}
