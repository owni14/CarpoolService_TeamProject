package com.kh.team.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kh.team.dao.CarDao;
import com.kh.team.service.CarService;
import com.kh.team.service.MemberService;
import com.kh.team.service.MessageService;
import com.kh.team.service.MylogService;
import com.kh.team.vo.DriverVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CarService carService;
	
	@Autowired
	private MessageService messageService;	
	
	// 운전자 등록 페이지로 이동합니다.
	@RequestMapping(value = "/drive", method = RequestMethod.GET)
	public String drive(RedirectAttributes rttr, HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
		String m_id = memberVo.getM_id();
		boolean submitDriver_result = memberService.submitDriver(m_id);
		if(submitDriver_result) { 
 			boolean approve_result = memberService.isApproveDriver(m_id);
			if (approve_result) {
				boolean result = memberService.isDriver(m_id); 
				if (result) {
					String driver_seq = memberService.getDriverSeqFromDriver(m_id);
					List<Map<String, Object>> passengerList = memberService.getPassengerList(driver_seq, memberVo.getM_company());
					DriverVo driverVo = memberService.getDriverInfo(Integer.valueOf(driver_seq));
					String depart_time = driverVo.getDriver_depart_time();
					int colon = depart_time.indexOf(":");
					String depart_time_hour = depart_time.substring(0, colon + 1);
					String depart_time_min = depart_time.substring(colon + 1);
					model.addAttribute("depart_time_hour", depart_time_hour);
					model.addAttribute("depart_time_min", depart_time_min);
					model.addAttribute("driverVo", driverVo);
					model.addAttribute("driver_seq", driver_seq);
					model.addAttribute("passengerList", passengerList);
					model.addAttribute("isDriver", result);
				} else {
					model.addAttribute("isDriver", false);
				}
				return "board/drive";
			} else {
				rttr.addFlashAttribute("approve_result", false);
				return "redirect:/";
			}
		} else {
			rttr.addFlashAttribute("submitDriver_result", false);
			return "redirect:/";
		}
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
		System.out.println("BoardController passengerReservation, result: " + result);
		
		// 탑승신청을 하였다면, 운전자의 번호를 얻어내 운전자의 아이디를 받아옵니다.
		if (result) {
			String driver_seq = memberService.getDriverSeqFromPassenger(m_id);
			String approveState = memberService.getApproveState(m_id);
			String driverId = memberService.getDriverId(driver_seq);
			System.out.println("BoardController passengerReservation, m_id: " + m_id);
			System.out.println("BoardController passengerReservation, approveState: " + approveState);
			System.out.println("BoardController passengerReservation, driverId: " + driverId);
			
			model.addAttribute("driverId", driverId);
			model.addAttribute("approveState", approveState);
		}
		
		// 회원의 회사정보를 가져와 그 회사에서 현재 등록된 금일 운전자의 수를 얻어옵니다. 
		int count = memberService.getTotalDriverCount(m_company);
		
		
		// 보여줄 행을 5개(perPage), 금일 운전자수(count), 밑에 나타내는 페이지수를 5개(block_page)로 설정
		pagingDto.setPerPage(5);
		pagingDto.setPage_block(5);
		pagingDto.setCount(count);
		
		// 현재 페이지의 수를 얻어와 페이지 설정
		pagingDto.setPage(pagingDto.getPage());
		
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
		/* Driver List Test : OK.
		for (Map<String, Object> map : driverList) {
			System.out.println("BoardController passengerReservationList: "+ map);
		}
		*/
		
		
		return driverList;
	}
	
	// 탑승하기 클릭시 클릭한 행에 있는 운전자 정보를 비동기로 가져옵니다.
	@ResponseBody
	@RequestMapping(value = "/driverInfo", method = RequestMethod.GET)
	public Map<String, Object> driverInformation(String m_id, String m_company) {
		String ci_code = carService.getCarCodeByM_Id(m_id);
		Map<String, Object> mapDriverInfo = memberService.getDriverById(m_id, m_company, ci_code);
		return mapDriverInfo;
	}
	
	// 탑승자 정보 입력
	@RequestMapping(value = "/addPasgInfo", method = RequestMethod.POST)
	public String addPassengerInfo(RedirectAttributes rttr, HttpSession session, String boardLoct, String boardHour, String boardMin, String m_id, String driver_seq, String driver_id) {
		String boardTime = boardHour + boardMin;
		boolean result = memberService.isDriver(m_id);
		System.out.println("BoardController addPassengerInfo, result :" + result);
		System.out.println("BoardController addPassengerInfo, m_id :" + m_id);
		System.out.println("BoardController addPassengerInfo, driver_id :" + driver_id);
		if (result) {
			rttr.addFlashAttribute("duplication", "true");
			return "redirect:/board/reservation";
		}
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
		
		// 현재 운전을 등록하려고 하는 회원이 탑승자로 등록되어 있는지 여부 확인 
		String state = memberService.getApproveState(m_id);
		
		// 운전자로 등록하려고 하는 회원이 탑승자로 등록되어 있다면 탑승자 정보를 삭제시킵니다.
		if (state != null) { // 탑승자로 등록되어 있다면
			
			// 등록하려고하는 운전자의 번호 및 아이디를 가지고 와서 탑승자정보를 삭제
			String driver_seq = memberService.getDriverSeqFromPassenger(m_id);
			String driver_id = memberService.getDriverId(driver_seq);
			boolean delete_result = memberService.deletePassenger(m_id, driver_seq);
			
			// 삭제가 정상적으로 완료되면 
			if (delete_result) {
				// 자동차 탑승인원 하나 감소
				carService.decreaseCount(driver_id);
			} 
		} 
		
		String driver_depart_time = startHour + startMin; // 출발시간 확인
		DriverVo driverVo = new DriverVo(m_id, startLoct, isSmoke, requirements, driver_depart_time);
		boolean result = memberService.addDriver(driverVo); // 운전정보 추가
		
		// 운전자 정보를 추가시킨 결과
		if (result) {
			rttr.addFlashAttribute("driverResult", "true");
		} else {
			rttr.addFlashAttribute("driverResult", "false");
		}
			
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
	public String cancelBoarding(RedirectAttributes rttr, String m_id, String driver_seq, String driver_id, String is_refuse) {
		boolean result = memberService.deletePassenger(m_id, driver_seq);
		if (result) {
			if (!(is_refuse.equals("true"))){
				carService.decreaseCount(driver_id);
				MessageVo messageVo = new MessageVo(driver_id, "1004", m_id + "님이 탑승신청을 취소하였습니다.");
				messageService.insertNoBlackMessage(messageVo);
				rttr.addFlashAttribute("deletePasgResult", result);
			}
		} else {
			rttr.addFlashAttribute("deletePasgResult", "false");
		}
		return "redirect:/board/reservation";
	}
	
	// 운전자가 탑승객을 승인
	@Transactional
	@RequestMapping(value = "/approvePassenger", method = RequestMethod.GET)
	public String approvePassenger(RedirectAttributes rttr, String m_id, String m_name, String depart_time, String depart_location, HttpSession session) {
		boolean result = memberService.approvePassenger(m_id);
		MemberVo loginVo = (MemberVo) session.getAttribute("loginVo");
		String user_id = loginVo.getM_id();
		MessageVo messageVo = new MessageVo(user_id, "1004", user_id + "님이 승인한 탑승자 정보입니다.\n" + "탑승자 : " + m_name +"\n탑승 시간 : " + depart_time + "\n탑승 장소 : " + depart_location);
		MessageVo messageVo2 = new MessageVo(m_id, "1004", user_id + "님이 탑승신청을 승인하였습니다.");
		messageService.insertNoBlackMessage(messageVo);
		messageService.insertNoBlackMessage(messageVo2);
		if (result)	{
			rttr.addFlashAttribute("approveResult", result);
		} else {
			rttr.addFlashAttribute("approveResult", "false");
		}
		return "redirect:/board/drive";
	}
	
	// 운전자가 탑승객을 거부
	@RequestMapping(value = "/rejectPassenger", method = RequestMethod.GET)
	public String rejectPassenger(RedirectAttributes rttr, String m_id, String driverId, HttpSession session) {
		boolean result = memberService.rejectPassenger(m_id);
		MemberVo loginVo = (MemberVo) session.getAttribute("loginVo");
		String user_id = loginVo.getM_id();
		MessageVo messageVo = new MessageVo(m_id, "1004", user_id + "님이 회원님의 탑승신청을 거부하였습니다.");
		messageService.insertNoBlackMessage(messageVo);
		if (result)	{
			carService.decreaseCount(driverId);
			rttr.addFlashAttribute("rejectResult", result);
		} else {
			rttr.addFlashAttribute("rejectResult", "false");
		}
		return "redirect:/board/drive";
	}
	
	
//	@RequestMapping(value = "/updateDriver", method = RequestMethod.POST)
//	public String updateDriver(RedirectAttributes rttr, String startLoct, String isSmoke, String requirements, String startHour, String startMin, String driver_seq) {
//		String driver_depart_time = startHour + startMin;
//		System.out.println("driver_seq:" + driver_seq);
//		DriverVo driverVo = new DriverVo(Integer.valueOf(driver_seq), startLoct, isSmoke, requirements, driver_depart_time);
//		
//		System.out.println(driverVo);
//		boolean result = memberService.updateDriver(driverVo);
//		rttr.addFlashAttribute("updateResult", result);
//		return "redirect:/board/drive";
//	}
	
	
	// 운전하기 삭제
	@RequestMapping(value = "/deleteDriver", method = RequestMethod.GET)
	public String deleteDriver(RedirectAttributes rttr, int driver_seq, String driver_id) {
		// 탑승자에게 메세지를 보내기 위해 탑승자 리스트를 얻어옵니다.
		List<String> list = memberService.getDeletingPassengerList(driver_seq);
		for (String m_id : list) {
			MessageVo messageVo = new MessageVo(m_id, "1004", driver_id + "님이 회원님이 운전을 취소하였습니다.");
			messageService.insertNoBlackMessage(messageVo);
		}
		boolean result = memberService.deleteDriver(driver_seq);
		carService.resetCount(driver_id);
		rttr.addFlashAttribute("deleteResult", result);
		return "redirect:/board/drive";
	}
	
}