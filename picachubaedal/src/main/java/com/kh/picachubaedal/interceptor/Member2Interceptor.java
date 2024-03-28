package com.kh.picachubaedal.interceptor;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class Member2Interceptor implements HandlerInterceptor {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//세션에 있는 loginGrade을 조사하여 관리자인지 아닌지 판정
		HttpSession session = request.getSession();
		String loginGrade = (String)session.getAttribute("loginGrade");
		
		boolean isAdmin = loginGrade != null && loginGrade.equals("일반회원");
		if(isAdmin) {
			return true;
		}
		else {
			response.sendError(403);
			return false;
		}
	}

}
