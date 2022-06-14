package com.kh.team.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.CarService;
import com.kh.team.service.MemberService;
import com.kh.team.service.MylogService;
import com.kh.team.vo.DriverVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MylogService myLogService;
	
	@Autowired
	private CarService carService;
	
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
		String m_id = loginVo.getM_id();
		boolean result = memberService.getApplicationPassengerCount(m_id);
		System.out.println("BoardController passengerReservation result: " + result);
		if (result) {
			String driver_seq = memberService.getDriverSeq(m_id);
			String driverId = memberService.getDriverId(driver_seq);
			model.addAttribute("driverId", driverId);
		}
		
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
	
	// 탑승자 정보 입력
	@RequestMapping(value = "/addPasgInfo", method = RequestMethod.POST)
	public String addPassengerInfo(RedirectAttributes rttr, String boardLoct, String boardHour, String boardMin, String m_id, String driver_seq, String driver_id) {
		String boardTime = boardHour + boardMin;
		boolean result_increase = carService.increaseCount(driver_id);
		boolean result_insert = memberService.addPassengerInfo(m_id, boardLoct, boardTime, driver_seq);
		if (result_increase && result_insert) {
			rttr.addFlashAttribute("passengerResult", "true");
		} else {
			rttr.addAttribute("passengerResult", "false");
		}
		return "redirect:/board/reservation";
	}
	
	// 운전하기 등록
	@RequestMapping(value = "/addDriver", method = RequestMethod.POST)
	public String addDriver(HttpSession session, RedirectAttributes rttr, String startLoct, String isSmoke, String requirements, String startHour, String startMin) {
		MemberVo loginVo = (MemberVo) session.getAttribute("loginVo");
		String m_id = loginVo.getM_id();
		String driver_depart_time = startHour + startMin;
		DriverVo driverVo = new DriverVo(m_id, startLoct, isSmoke, requirements, driver_depart_time);
		boolean result = myLogService.addDriver(driverVo);
		if (result) {
			rttr.addFlashAttribute("driverResult", result);
		} else {
			rttr.addFlashAttribute("driverResult", "false");
		}
		
//		System.out.println("MyController addDriver, startLoct:" + startLoct);
//		System.out.println("MyController addDriver, isSmoke:" + isSmoke);
//		System.out.println("MyController addDriver, requirements:" + requirements);
//		System.out.println("MyController addDriver, stratTime:" + stratTime);
		
		return "redirect:/";
	}
	
	// 회원의 위치정보 가져오는 메서드 (비동기)
	@ResponseBody
	@RequestMapping(value = "/member", method = RequestMethod.GET, produces = "text/plain; charset=utf8")
	public String getMemberLocation(String m_id) {
		String memberLocation = memberService.getMemberLocation(m_id);
		return memberLocation;
	}
	
	// 운전자 차량의 최대 탑승인원 및 현재 탑승인원 가져오는 메서드 (비동기)
	@ResponseBody
	@RequestMapping(value = "/count", method = RequestMethod.GET)
	public Map<String, String> getCount(String m_id) {
		Map<String, String> map = memberService.getCount(m_id);
		return map;
	}
	
	// 운전자의 아이디를 받아올 메서드
	@ResponseBody
	@RequestMapping(value = "/getDriverId", method = RequestMethod.POST)
	public String getDriverId(String driver_seq) {
		String driverId = memberService.getDriverId(driver_seq);
		return driverId;
	}
	
	// 탑승하기를 두번이상 눌렀는지여부
	@ResponseBody
	@RequestMapping(value = "/isApplicaiton", method = RequestMethod.GET)
	public String isApplication(String m_id) {
		System.out.println("BoardController BoardController, m_id:" + m_id);
		boolean result = memberService.isApplication(m_id);
		return String.valueOf(result);
	}
	
}
