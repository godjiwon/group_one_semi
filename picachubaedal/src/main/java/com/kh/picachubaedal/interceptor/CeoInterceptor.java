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
		String memberGrade = (String)session.getAttribute("memberGrade");
		
		boolean isAdmin = memberGrade != null && memberGrade.equals("사장님");
		
		if(isAdmin) {
			return true;
		}
		else {
			response.sendError(403);
			return false;
		}
	}
}
