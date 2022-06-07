package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.MemberService;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private MemberService memberService;
	
	// 운전자 등록 페이지로 이동
	@RequestMapping(value = "/drive", method = RequestMethod.GET)
	public String drive() {
		return "board/drive";
	}
	
	// 예약하기 페이지로 이동
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String passengerReservation(Model model) {
		List<MemberVo> memberList = memberService.getMemberList();
		System.out.println(memberList);
		if (memberList != null) {
			model.addAttribute("driverList", memberList);
		}
		return "board/reservation";
	}
	
	// 이벤트 & 혜택 페이지로 이동
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String event(Model model) {
		
		return "board/event";
	}
}
