package com.kh.picachubaedal.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.picachubaedal.dao.AttachDao;
import com.kh.picachubaedal.dao.MemberDao;
import com.kh.picachubaedal.dao.PointDao;
import com.kh.picachubaedal.dto.AttachDto;
import com.kh.picachubaedal.dto.PointDto;
import com.kh.picachubaedal.service.AttachService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/point")
public class PointController {
	@Autowired
	private PointDao pointDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AttachDao attachDao;
	@Autowired
	private AttachService attachService;

	// 포인트 등록 페이지 -> 있어야 하나? (관리자 전용)
	@GetMapping("/regist")
	public String regist() {
		return "/WEB-INF/views/point/regist.jsp";
	}
	@PostMapping("/regist")
	public String regist(@ModelAttribute PointDto pointDto,
								@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		int pointNo = pointDao.getPointSequence();
		pointDto.setPointNo(pointNo);
		pointDao.insert(pointDto);
		
		if(!attach.isEmpty()) {//파일이 있으면
			int attachNo = attachService.save(attach);
			pointDao.connect(pointNo, attachNo);
		}		
		return "redirect:list";
	}

	
	//포인트 상품 목록
	@RequestMapping("/list")
	public String list(Model model) {
		List<PointDto> list = pointDao.selectList();
		model.addAttribute("list",list);
		return "/WEB-INF/views/point/list.jsp";
	}
	
	//상품번호를 전달하면 파일번호를 찾아서 리다이렉트하는 페이지
	@RequestMapping("/image")
	public String image(@RequestParam int pointNo) {
		try {
			int attachNo = pointDao.findAttcahNo(pointNo);
			return "redirect:/download?attachNo=" + attachNo;
		} catch (Exception e) {
			// return "기본 이미지 주소";
			return "redirect:http://via.placeholder.com/200x100/f3d23d/e84e1f.png&text=BAEdalpicaCHU";
		}
	}
	
	@RequestMapping("/registComplete")
	public String registComplete() {
		return "/WEB-INF/views/point/registComplete.jsp";
	}
	//여기까지 관리자

	
	
	// 충전 페이지
	@GetMapping("/charge")
	public String charge(Model model) {
		model.addAttribute("list", pointDao.selectList());
		return "/WEB-INF/views/point/charge.jsp";
	}
	@PostMapping("/charge")
	public String charge(@RequestParam int pointCharge, HttpSession session) {
	    String loginId = (String)session.getAttribute("loginId");// 아이디 추출
	    PointDto pointDto = new PointDto();
	    pointDto.setPointCharge(pointCharge);
	    memberDao.plusMemberPoint(loginId, pointCharge);
	    return "redirect:chargeComplete";
	}

	// 포인트 충전 완료페이지
	@RequestMapping("/chargeComplete")
	public String chargeComplete() {
		return "/WEB-INF/views/point/chargeComplete.jsp";
	}

	//충전상품 삭제 
	@GetMapping("/delete")
	public String delete(@RequestParam int pointNo) {
		try {
			int attachNo = pointDao.findAttcahNo(pointNo); //아이템 번호로 파일 번호 찾고
			File dir = new File(System.getProperty("user.home"), "kh13A");
			File target = new File (dir, String.valueOf(attachNo));
			target.delete();
			attachDao.delete(attachNo); //파일 정보 지우고
		}
		catch(Exception e) {}
		finally {//예외 여부와 관계 없이 무조건 실행되는 구문
			pointDao.delete(pointNo); //아이템 정보 삭제
		}
		return "redirect:list";
	}
	
	//충전상품 수정
	@GetMapping("/edit")
	public String edit(@RequestParam int pointNo, Model model) {
		PointDto pointDto = pointDao.selectOne(pointNo);
		model.addAttribute("pointDto", pointDto);
		return "/WEB-INF/views/point/edit.jsp";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute PointDto pointDto,
						@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		pointDao.update(pointDto);
		
		//첨부파일이 있다면 기존의 첨부파일을 지우고 신규 첨부파일을 등록(연결해주기)
		if(!attach.isEmpty()) {
			//기존 파일 삭제
			try {
				int attachNo = pointDao.findAttcahNo(pointDto.getPointNo()); //파일번호 찾고
				File dir = new File(System.getProperty("user.home"), "kh13A"); //폴더 안에
				File target = new File(dir, String.valueOf(attachNo)); //해당하는 번호를 선택해라.
				target.delete(); //실제 파일 삭제
				attachDao.delete(attachNo); //DB에서 삭제
			}
		catch (Exception e) {}
			int attachNo = attachDao.getSequence(); //시퀀스 생성
			File dir = new File(System.getProperty("user.home"),"kh13A");
			File target = new File(dir, String.valueOf(attachNo));
			attach.transferTo(target); //실물 파일 저장
			
			AttachDto attachDto = new AttachDto(); //새로 만들어서 정보를 다 채우기
			attachDto.setAttachNo(attachNo);
			attachDto.setAttachName(attach.getOriginalFilename());
			attachDto.setAttachType(attach.getContentType());
			attachDto.setAttachSize(attach.getSize());
			attachDao.insert(attachDto); //DB 저장
			
			pointDao.connect(pointDto.getPointNo(), attachNo); //연결 처리
			
			}
			
			return "redirect:list";
		}
}
