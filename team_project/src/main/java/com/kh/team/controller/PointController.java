package com.kh.team.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MemberService;
import com.kh.team.service.PointService;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	private PointService pointService;
	@Autowired
	private MemberService memberService;
	
	// 포인트 페이지로 이동
	@RequestMapping(value = "point", method = RequestMethod.GET)
	public String describePoint(HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		if (memberVo != null) {
			MemberVo loginVo = memberService.getMemberByIdAndPw(memberVo.getM_id(), memberVo.getM_pw());
			session.setAttribute("loginVo", loginVo);
		}
		return "point/point";
	}
	
	// 포인트 결제하기
	@RequestMapping(value = "payment", method = RequestMethod.POST)
	public String payment(int m_point, RedirectAttributes rttr, HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		boolean result = pointService.paymet(loginVo.getM_id(), m_point);
		rttr.addFlashAttribute("payment_result", result);
		return "redirect:/point/point";
	}
	
}
