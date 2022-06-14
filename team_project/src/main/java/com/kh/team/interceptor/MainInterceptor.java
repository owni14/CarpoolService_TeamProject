package com.kh.team.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.team.vo.MemberVo;


public class MainInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		if (loginVo == null) {
			response.sendRedirect("/member/loginForm");
			String uri = request.getRequestURI();
			session.setAttribute("targetLocation", uri);
			return false;
		}
			

		return true; 
	}
	
	
	
}
