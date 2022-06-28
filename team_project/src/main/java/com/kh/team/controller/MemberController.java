package com.kh.team.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.EvlService;
import com.kh.team.service.MemberService;
import com.kh.team.vo.MemberVo;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private EvlService evlService;
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "member/login_form";
	}
	
	
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String m_id, String m_pw, String saveId, HttpSession session, HttpServletResponse response) {
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
		String targetLocation = (String)session.getAttribute("targetLocation");
		if (targetLocation == null || targetLocation.equals("")) {
			return "redirect:/";
		}
		session.removeAttribute("targetLocation");
		return "redirect:" + targetLocation;
	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join_form";
	}
	
	
	@RequestMapping(value = "/join_run", method = RequestMethod.POST)
	@Transactional
	public String joinRun(MemberVo memberVo, RedirectAttributes rttr) {
		if (memberVo.getM_company().equals("null")) {
			rttr.addFlashAttribute("join_result", "false");
			return "redirect:/member/joinForm";
		}
		memberService.insertMember(memberVo);
		evlService.insertPassengerEvl(memberVo.getM_id());
		rttr.addFlashAttribute("join_result", "true");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginVo");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "member/findId";
	}
	
	@RequestMapping(value = "/foundId", method = RequestMethod.POST)
	public String findId_run(MemberVo memberVo, Model model) {
		String m_id = memberService.getMemberId(memberVo);
		System.out.println("m_id:" + m_id);
		model.addAttribute("m_id", m_id);
		return "member/foundId";
	}
	
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() {
		return "member/findPw";
	}
	
	@RequestMapping(value = "/foundPw", method = RequestMethod.POST)
	public String findPw_run(MemberVo memberVo, Model model) {
		String m_pw = memberService.getMemberPw(memberVo);
		model.addAttribute("m_pw", m_pw);
		return "member/foundPw";
	}
	
	
}
