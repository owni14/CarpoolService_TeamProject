package com.kh.team.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AdminInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String admin_code = (String)session.getAttribute("admin_code");
		if (admin_code == null || admin_code.equals("")) {
			response.sendRedirect("/admin/admin_login");
			return false;
		}
//			String uri = request.getRequestURI();
//			String queryString = request.getQueryString();
//			System.out.println("uri : " + uri);
//			System.out.println("queryString : " + queryString);
//			String targetLocation = uri + "?" + queryString;
//			session.setAttribute("targetLocation", targetLocation);

		return true; 
	}
	
	
	
}
