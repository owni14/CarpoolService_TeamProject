package com.kh.team.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MemberService;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "member/login_form";
	}
	
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String m_id, String m_pw, String saveId, HttpSession session, HttpServletResponse response) {
		System.out.println("m_id: " + m_id);
		System.out.println("m_pw: " + m_pw);
		System.out.println("saveId: " + saveId);
		MemberVo memberVo = memberService.getMemberByIdAndPw(m_id, m_pw);
		if (memberVo == null) {
			return "redirect:/member/loginForm";
		} else {
			session.setAttribute("loginVo", memberVo);
		}
		
		if (saveId != null && !saveId.equals("")) { // 아이디 저장에 체크하고 로그인한 경우
			Cookie cookie = new Cookie("saveid", m_id);
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24 * 7); // 일주일
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("saveid", m_id);
			cookie.setPath("/");
			cookie.setMaxAge(0); // 일주일
			response.addCookie(cookie);
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join_form";
	}
	
	//
	
}
