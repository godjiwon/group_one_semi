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
import org.springframework.web.multipart.MultipartFile;

import com.kh.picachubaedal.dao.MemberDao;
import com.kh.picachubaedal.dao.StoreDao;
import com.kh.picachubaedal.dto.MemberDto;
import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.service.AttachService;
import com.kh.picachubaedal.service.EmailService;
import com.kh.picachubaedal.vo.PageVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private EmailService emailService;

	@Autowired
	private AttachService attachService;
	@Autowired
	private StoreDao storeDao;

	// 회원가입페이지
	@GetMapping("/signup")
	public String signup() {
		return "/WEB-INF/views/member/signup.jsp";
	}

	@PostMapping("/signup")
	public String signup(@ModelAttribute MemberDto memberDto, @RequestParam MultipartFile attach)
			throws IllegalStateException, IOException {

		// 회원정보 등록
		memberDao.insert(memberDto);
		// 첨부파일 등록
		if (!attach.isEmpty()) {
			int attachNo = attachService.save(attach);
			memberDao.connect(memberDto.getMemberId(), attachNo);
		}

		return "redirect:signupFinish";
	}

	@RequestMapping("/signupFinish")

	public String signupFinish() {
		return "/WEB-INF/views/member/signupFinish.jsp";
	}

	// 로그인
	@GetMapping("/signin")
	public String signin() {
		return "/WEB-INF/views/member/signin.jsp";
	}

	@PostMapping("/signin")
	public String signin(@ModelAttribute MemberDto inputDto, HttpSession session) {
		// 사용자가 입력한 아이디로 회원정보를 조회한다
		MemberDto findDto = memberDao.selectOne(inputDto.getMemberId());
		// 로그인 가능 여부를 판정
		boolean isValid = findDto != null && inputDto.getMemberPw().equals(findDto.getMemberPw());
		// 결과에 따라 다른 처리
		if (isValid) {
			// 세션에 데이터 추가
			session.setAttribute("loginId", findDto.getMemberId());
			session.setAttribute("loginGrade", findDto.getMemberGrade());
			session.setAttribute("memberNo", findDto.getMemberNo());
			session.setAttribute("memberAddress1", findDto.getMemberAddress1());
			session.setAttribute("memberAddress2", findDto.getMemberAddress2());
			// 최종 로그인시각 갱신
			memberDao.updateMemberLogin(findDto.getMemberId());

			return "redirect:/";
		} else {// 로그인 실패
			return "redirect:signin?error";
		}
	}

	// 로그아웃

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");// 세션의 값 삭제
		session.removeAttribute("loginGrade");// 세션의 값 삭제
		session.removeAttribute("memberNo");
		session.removeAttribute("memberAddress1");
		session.removeAttribute("memberAddress2");
		return "redirect:/";
	}

	// 프사 반환
	@RequestMapping("/profilePhoto")
	public String image(HttpSession session) {
		try {
			String loginId = (String) session.getAttribute("loginId");
			int attachNo = memberDao.findAttachNo(loginId);
			return "redirect:/download?attachNo=" + attachNo;
		} catch (Exception e) {
			return "redirect:/image/user.png";
		}
	}

	// 마이페이지

	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		// 1. 세션에 저장된 아이디를 꺼낸다
		String loginId = (String) session.getAttribute("loginId");

		// 2. 아이디에 맞는 정보를 조회한다
		MemberDto memberDto = memberDao.selectOne(loginId);

		// 3. 화면에 조회한 정보를 전달한다
		model.addAttribute("memberDto", memberDto);

		// 4. 연결될 화면을 반환한다
		return "/WEB-INF/views/member/mypage.jsp";
	}

	// 비밀번호 변경
	@GetMapping("/pwUpdate")
	public String pwUpdate() {
		return "/WEB-INF/views/member/pwUpdate.jsp";
	}

	// 기존 비밀번호를 originPw, 변경할 비밀번호를 changePw로 처리
	// 아이디는 HttpSession에 존재한다
	@PostMapping("/pwUpdate")
	public String pwUpdate(@RequestParam String originPw, @RequestParam String changePw, HttpSession session) {
		// 로그인된 사용자의 아이디를 추출
		String loginId = (String) session.getAttribute("loginId");

		// 비밀번호 검사를 위해 DB에 저장된 정보를 불러온다
		MemberDto findDto = memberDao.selectOne(loginId);
		boolean isValid = findDto.getMemberPw().equals(originPw);

		if (isValid) {// 입력한 기존 비밀번호가 유효할 경우
			// 아이디와 변경할 비밀번호로 DTO를 만들어 DAO의 기능을 호출
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(loginId);
			memberDto.setMemberPw(changePw);
			memberDao.updateMemberPw(memberDto);

			return "redirect:pwUpdateSuccess";
		} else {// 입력한 기존 비밀번호가 유효하지 않을 경우
			return "redirect:pwUpdate?error";
		}

	}

	@RequestMapping("/pwUpdateSuccess")
	public String pwUpdateSuccess() {
		return "/WEB-INF/views/member/pwUpdateSuccess.jsp";
	}

	// 개인정보 변경
	@GetMapping("/profileEdit")
	public String change(Model model, HttpSession session)
			 {
		// 사용자 아이디를 세션에서 추출
		String loginId = (String) session.getAttribute("loginId");

		// 아이디로 정보 조회
		MemberDto memberDto = memberDao.selectOne(loginId);

		// 모델에 정보 추가
		model.addAttribute("memberDto", memberDto);
		

		return "/WEB-INF/views/member/profileEdit.jsp";
	}

	@PostMapping("/profileEdit")
	public String change(@ModelAttribute MemberDto memberDto, HttpSession session,
			@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		//첨부파일 등록
		if (!attach.isEmpty()) {
			int attachNo = attachService.save(attach);
			memberDao.connect(memberDto.getMemberId(), attachNo);
		}// 세션에서 아이디 추출
		String loginId = (String) session.getAttribute("loginId");

		// memberDto에 아이디 설정
		memberDto.setMemberId(loginId);

		// DB정보 조회
		MemberDto findDto = memberDao.selectOne(loginId);

		// 판정
		boolean isValid = memberDto.getMemberPw().equals(findDto.getMemberPw());

		// 변경 요청
		if (isValid) {
			memberDao.updateMember(memberDto);
			return "redirect:mypage";
		} else {
			// 이전 페이지로 리다이렉트
			return "redirect:profileEdit?error";
		}
	}

	// 회원 탈퇴
	@GetMapping("/delete_account")
	public String delete_account() {
		return "/WEB-INF/views/member/delete_account.jsp";
	}

	@PostMapping("/delete_account")
	public String delete_account(@RequestParam String memberPw, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		MemberDto findDto = memberDao.selectOne(loginId);
		boolean isValid = findDto.getMemberPw().equals(memberPw);

		if (isValid) {
			// 탈퇴 전에 프로필번호를 찾아서 삭제 처리
			try {
				int attachNo = memberDao.findAttachNo(loginId);
				// attachService.remove(attachNo);//파일삭제+DB삭제
			} catch (Exception e) {
				e.printStackTrace();
			}

			memberDao.delete(loginId);// 회원탈퇴
			session.removeAttribute("loginId");// 로그아웃
			return "redirect:delete_account_success";
		} else {
			return "redirect:exit?error";
		}
	}

	@RequestMapping("/delete_account_success")
	public String delete_account_success() {
		return "/WEB-INF/views/member/delete_account_success.jsp";
	}

	// 아이디 찾기
	@GetMapping("/findId")
	public String findId() {
		return "/WEB-INF/views/member/findId.jsp";
	}

	@PostMapping("/findId")
	public String findId(@ModelAttribute MemberDto memberDto, Model model) {
		String memberId = memberDao.findMemberIdByNick(memberDto.getMemberNick());
		if (memberId != null) {
			model.addAttribute("memberId", memberId);
			model.addAttribute("memberNick", memberDto.getMemberNick());
			return "/WEB-INF/views/member/findIdSuccess.jsp";
		} else {
			return "redirect:findIdFail";
		}
	}

	@RequestMapping("/findIdSuccess")
	public String findIdSuccess() {
		return "/WEB-INF/views/member/findIdSuccess.jsp";
	}

	@RequestMapping("/findIdFail")
	public String findIdFail() {
		return "/WEB-INF/views/member/findIdFail.jsp";
	}

	// 비밀번호 찾기
	@GetMapping("/findPw")
	public String findPw() {
		return "/WEB-INF/views/member/findPw.jsp";
	}

	@PostMapping("/findPw")
	public String findPw(@ModelAttribute MemberDto memberDto, Model model) {
		MemberDto findDto = memberDao.selectOne(memberDto.getMemberId());

		boolean isValid = findDto != null && findDto.getMemberEmail().equals(memberDto.getMemberEmail());

		if (isValid) {
			model.addAttribute("foundPw", findDto.getMemberPw());
			model.addAttribute("memberId", findDto.getMemberId()); // memberId를 모델에 추가
			model.addAttribute("kakaoLogin", findDto.getMemberId());
			return "/WEB-INF/views/member/findPwSuccess.jsp";

		} else {
			return "redirect:findPwFail?error"; // 비밀번호 찾기 실패 시 findPwFail 페이지로 리다이렉트

		}
	}

	@GetMapping("/findPwSuccess")
	public String findPwSuccess() {
		return "/WEB-INF/views/member/findPwSuccess.jsp";
	}

	@GetMapping("/findPwFail")
	public String findPwFail() {
		return "/WEB-INF/views/member/findPwFail.jsp";
	}

}