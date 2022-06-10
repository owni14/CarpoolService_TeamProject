package com.kh.team.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	// 로그인 안되어 있으면 페이지 이동이 안됨
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String passengerReservation(Model model, HttpSession session) {
		MemberVo loginVo = (MemberVo) session.getAttribute("loginVo");
		String m_company = loginVo.getM_company();
		List<Map<String, Object>> driverList = memberService.getDriverList(m_company);
		if (driverList != null) {
			model.addAttribute("driverList", driverList);
		}
		return "board/reservation";
	}
	
	// 운전자 리스트 (비동기)
	@ResponseBody
	@RequestMapping(value = "/driverList", method = RequestMethod.GET)
	public List<Map<String, Object>> passengerReservationList(HttpSession session) {
		MemberVo loginVo = (MemberVo) session.getAttribute("loginVo");
		String m_company = loginVo.getM_company();
		List<Map<String, Object>> driverList = memberService.getDriverList(m_company);
		return driverList;
	}
	
	// 탑승하기 클릭시 운전자 정보 가져오는 메서드 (비동기)
	@ResponseBody
	@RequestMapping(value = "/driverInfo", method = RequestMethod.GET)
	public Map<String, Object> driverInformation(String m_id, String m_company) {
		Map<String, Object> mapDriverInfo = memberService.getDriverById(m_id, m_company);
		return mapDriverInfo;
	}
	
	@RequestMapping(value = "/addPasgInfo", method = RequestMethod.POST)
	public String addPassengerInfo(String boardLoct, String boardHour, String boardMin, String m_id, String driver_seq) {
		String boardTime = boardHour + boardMin;
		System.out.println("m_id:" + m_id);
		memberService.addPassengerInfo(m_id, boardLoct, boardTime, driver_seq);
		return "redirect:/";
	}
	
}
