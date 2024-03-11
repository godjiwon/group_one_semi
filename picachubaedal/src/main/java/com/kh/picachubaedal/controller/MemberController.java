package com.kh.picachubaedal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {

	//내정보페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		
		return "/WEB-INF/views/member/mypage.jsp";
	}
	
	//회원탍퇴페이지
	@GetMapping("/delete_account")
	public String delete_account() {
		
		return "/WEB-INF/views/member/delete_account.jsp";
	}
	
	
	/*
	 * @PostMapping("/delete_account") public String delete_account() {
	 * 
	 * return ""; }
	 */
	
	
	@RequestMapping("/delete_account_success")
	public String delete_account_finish() {
		
		return "/WEB-INF/views/member/delete_account_success.jsp";
	}
	
	//개인정보변경페이지
	@GetMapping("/profileEdit")
	public String profileEdit() {
		
		return "/WEB-INF/views/member/profileEdit.jsp";
	}
	
	/*
	 * @PostMapping("/profileEdit") public String profileEdit()
	 *  { return ""; }
	 */
	
	//비밀번호변경페이지
	@GetMapping("/pwUpdate")
	public String pwUpdate() {
		
		return "/WEB-INF/views/member/pwUpdate.jsp";
	}
	
	/*
	 * @PostMapping("/pwUpdate") public String pwUpdate() {
	 * 
	 * return ""; }
	 */
	//asd
	@RequestMapping("/pwUpdateSuccess")
	public String pwUpdateSuccess() {
		
		return "/WEB-INF/views/member/pwUpdateSuccess.jsp";
	}
	
	
	
	
	
	
	
	
}
