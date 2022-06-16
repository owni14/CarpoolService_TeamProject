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
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MylogService myLogService;
	
	@Autowired
	private CarService carService;
	
	// 운전자 등록 페이지로 이동합니다.
	@RequestMapping(value = "/drive", method = RequestMethod.GET)
	public String drive(HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
		String driver_seq = memberService.getDriverSeqFromDriver(memberVo.getM_id());
		List<Map<String, Object>> passengerList = memberService.getPassengerList(driver_seq, memberVo.getM_company());
		model.addAttribute("driver_seq", driver_seq);
		model.addAttribute("passengerList", passengerList);
		return "board/drive";
	}
	
	// 예약하기 페이지로 이동합니다.
	// 로그인 안되어 있으면 페이지 이동이 안됩니다.
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String passengerReservation(Model model, HttpSession session, PagingDto pagingDto) {
		MemberVo loginVo = (MemberVo) session.getAttribute("loginVo");
		String m_id = loginVo.getM_id();
		String m_company = loginVo.getM_company();
		
		// 회원이 탑승신청을 하였는지 여부를 확인
		boolean result = memberService.isApplication(m_id);
		
		// 탑승신청을 하였다면, 운전자의 번호를 얻어내 운전자의 아이디를 받아옵니다.
		if (result) {
			String driver_seq = memberService.getDriverSeqFromPassenger(m_id);
			String driverId = memberService.getDriverId(driver_seq);
			model.addAttribute("driverId", driverId);
		}
		
		// 회원의 회사정보를 가져와 그 회사에서 현재 등록된 금일 운전자의 수를 얻어옵니다. 
		int count = memberService.getTotalDriverCount(m_company);
		
		
		// 보여줄 행을 5개(perPage), 금일 운전자수(count), 밑에 나타내는 페이지수를 5개(block_page)로 설정
		pagingDto.setPerPage(5);
		pagingDto.setPage_block(5);
		pagingDto.setCount(count);
		
		// 현재 페이지의 수를 얻어와 페이지 설정
		pagingDto.setPage(pagingDto.getPage());
		
		System.out.println("BoardController passengerReservation, page :" + pagingDto.getPage());
		
		/* 초반에 설정했었는데 코드 분석을 하다보니 동기로 운전자리스트를 가져올 필요가 있나 싶은데 혹시 몰라서 남겨둡니다. 
		List<Map<String, Object>> driverList = memberService.getDriverList(m_company, pagingDto);
		if (driverList != null) {
			model.addAttribute("driverList", driverList);
		}
		*/
		
		
		model.addAttribute("pagingDto", pagingDto);
		return "board/reservation";
	}
	
	// 비동기로 운전자 리스트를 얻어옵니다.
	@ResponseBody
	@RequestMapping(value = "/driverList", method = RequestMethod.GET)
	public List<Map<String, Object>> passengerReservationList(HttpSession session, String page) {
		MemberVo loginVo = (MemberVo) session.getAttribute("loginVo");
		String m_company = loginVo.getM_company();
		
		System.out.println("BoardController passengerReservationList, page :" + page);
		// 회원이 속한 회사의 금일 운전자수를 얻어옵니다. 
		int count = memberService.getTotalDriverCount(m_company);
		
		// 보여줄 행을 5개(perPage), 금일 운전자수(count), 밑에 나타내는 페이지수를 5개(block_page)로 설정
		PagingDto pagingDto = new PagingDto(5, count, 5);
		
		// 현재 페이지를 얻어와  pagingDto에 페이지를 설정
		pagingDto.setPage(Integer.parseInt(page));
		
//		System.out.println("BoardController passengerReservationList :" + pagingDto);
		
		// 회사 정보와 페이지와 관련된 정보를 보내 운전자 리스트를 받아옵니다.
		List<Map<String, Object>> driverList = memberService.getDriverList(m_company, pagingDto);
		
		// 가져온 운전자 리스트 확인
		// Driver List Test : OK.
		for (Map<String, Object> map : driverList) {
			System.out.println("BoardController passengerReservationList: "+ map);
		}
		
		
		return driverList;
	}
	
	// 탑승하기 클릭시 클릭한 행에 있는 운전자 정보를 비동기로 가져옵니다.
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
	
	// 탑승취소 버튼 클릭할 경우 탑승객 테이블의 is_deletion을 'Y'로 바꿀 메서드
	@RequestMapping(value = "/cancelBoarding", method = RequestMethod.GET)
	public String cancelBoarding(RedirectAttributes rttr, String m_id, String driver_seq, String driver_id) {
		System.out.println("BoardController cancelBoarding, m_id:" + m_id);
		System.out.println("BoardController cancelBoarding, driver_seq:" + driver_seq);
		boolean result = memberService.deletePassenger(m_id, driver_seq);
		if (result) {
			carService.decreaseCount(driver_id);
			rttr.addFlashAttribute("deletePasgResult", result);
		} else {
			rttr.addFlashAttribute("deletePasgResult", "false");
		}
		return "redirect:/board/reservation";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getPsgList", method = RequestMethod.GET)
	public List<Map<String, Object>> getPassengerList(String driver_seq, String m_company) {
		
		return null;
	}
	
}
