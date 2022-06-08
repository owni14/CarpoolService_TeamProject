package com.kh.team.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		if (memberList != null) {
			model.addAttribute("driverList", memberList);
		}
		return "board/reservation";
	}
	
	// 운전자 리스트 (비동기 방식)
	@ResponseBody
	@RequestMapping(value = "/driverList", method = RequestMethod.GET)
	public List<MemberVo> passengerReservationList() {
		List<MemberVo> memberList = memberService.getMemberList();
		return memberList;
	}
	
	// 탑승하기 클릭시 운전자 정보 가져오는 메서드 (비동기)
	@ResponseBody
	@RequestMapping(value = "/driverInfo", method = RequestMethod.GET)
	public MemberVo driverInformation(String m_id) {
		MemberVo driverInfo = memberService.getMemberById(m_id);
		return driverInfo;
	}
	
}
