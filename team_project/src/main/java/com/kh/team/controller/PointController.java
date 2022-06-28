package com.kh.team.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MemberService;
import com.kh.team.service.MessageService;
import com.kh.team.service.PointService;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.MessageVo;

@Controller
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	private PointService pointService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MessageService messageService;
	
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
	public String payment(int m_point, String coupon, int price, RedirectAttributes rttr, HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		boolean result = pointService.paymet(loginVo.getM_id(), m_point);
		if (result) {
			MessageVo messageVo = new MessageVo();
			messageVo.setSender_admin_code("1002");
			messageVo.setReceiver_m_id(loginVo.getM_id());
			messageVo.setContent("포인트 스토어에서" + coupon + price + "원권이 도착하였습니다.\n 교환 후 포인트 : " + m_point + "point\n 이용해주셔서 감사합니다.");
			boolean message_result = messageService.insertNoBlackMessage(messageVo);
			System.out.println("message_result : " + message_result);
			rttr.addFlashAttribute("message_result", message_result);
		}
		
		return "redirect:/point/point";
	}
	
}
