package com.kh.picachubaedal.interceptor;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class CeoInterceptor implements HandlerInterceptor  {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//세션에 있는 loginLevel을 조사하여 관리자인지 아닌지 판정
		HttpSession session = request.getSession();
		String loginGrade = (String)session.getAttribute("loginGrade");
		
		boolean isAdmin = loginGrade != null && loginGrade.equals("사장님");
		 // 만약 관리자라면 true를 반환하여 요청을 계속 진행합니다.
		if(isAdmin) {
			return true;
		}
		 // 관리자가 아니라면 403 오류를 응답으로 설정하고 false를 반환하여 요청을 중단합니다.
		else {
			response.sendError(403);
			return false;
		}
	}
}
