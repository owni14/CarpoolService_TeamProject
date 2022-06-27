package com.kh.team.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.kh.team.dao.CarDao;
import com.kh.team.service.CarService;
import com.kh.team.service.EvlService;
import com.kh.team.service.MemberService;
import com.kh.team.service.MylogService;
import com.kh.team.service.PointService;
import com.kh.team.util.FileUploadHelper;
import com.kh.team.vo.CarInfoVo;
import com.kh.team.vo.DriverVo;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PassengerVo;
import com.kh.team.vo.Passenger_EvlVo;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	private PointService pointService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MylogService mylogService;
	@Autowired
	private CarService carService;
	@Autowired
	private EvlService evlService;	

	
	
	// 탑승 내역 페이지로 이동
	@RequestMapping(value = "/boardedHistory", method = RequestMethod.GET)
	public String boardedHistory(HttpSession session, PagingDto pagingDto, Model model) {
		MemberVo loginVo =(MemberVo)session.getAttribute("loginVo");
		String m_id = loginVo.getM_id();
		pagingDto.setCount(pointService.getCountPointById(m_id));
		pagingDto.setPage(pagingDto.getPage());
		List<Map<String, Object>> passengerlogList = mylogService.passengerlogListById(m_id, pagingDto.getStartRow(), pagingDto.getEndRow());
		model.addAttribute("passengerlogList", passengerlogList);
		
		boolean result = mylogService.isDriver(m_id);
		System.out.println(result);
		if (result) {
			Driver_EvlVo vo = mylogService.driver_evlListById(loginVo.getM_id());
			int sum = vo.getEvl1() * 1 + vo.getEvl2() * 2 + vo.getEvl3() * 3 + vo.getEvl4() * 4 + vo.getEvl5() * 5;
			double avg = sum / (double)vo.getEvl_count();
			model.addAttribute("driver_evlVo", vo);
			model.addAttribute("evl_sum", sum);
			model.addAttribute("evl_avg", avg);
		}
		
		Passenger_EvlVo passengerVo = mylogService.passenger_evlListById(m_id);
		Map<String, Object> pointVo = mylogService.nextPoint(m_id);
		model.addAttribute("passenger_evlVo", passengerVo);
		model.addAttribute("pointVo", pointVo);
		model.addAttribute("isDriver", result);
		
		return "my/boardedHistory";
	}
	
	
	// 운전내역 페이지로 이동
	@RequestMapping(value = "/driveHistory", method = RequestMethod.GET)
	public String driveHistroy(HttpSession session, PagingDto pagingDto, Model model) {
		MemberVo loginVo =(MemberVo)session.getAttribute("loginVo");
		String m_id = loginVo.getM_id();
		pagingDto.setCount(pointService.getCountPointById(m_id));
		pagingDto.setPage(pagingDto.getPage());
		List<DriverVo> driverlogList = mylogService.driverlogListById(m_id, pagingDto.getStartRow(), pagingDto.getEndRow());
		session.setAttribute("driverlogList", driverlogList);
		
		boolean result = mylogService.isDriver(m_id);
		System.out.println(result);
		if (result) {
			Driver_EvlVo vo = mylogService.driver_evlListById(loginVo.getM_id());
			int sum = vo.getEvl1() * 1 + vo.getEvl2() * 2 + vo.getEvl3() * 3 + vo.getEvl4() * 4 + vo.getEvl5() * 5;
			double avg = sum / (double)vo.getEvl_count();
			model.addAttribute("driver_evlVo", vo);
			model.addAttribute("evl_sum", sum);
			model.addAttribute("evl_avg", avg);
		}
		
		Passenger_EvlVo passengerVo = mylogService.passenger_evlListById(m_id);
		Map<String, Object> pointVo = mylogService.nextPoint(m_id);
		model.addAttribute("passenger_evlVo", passengerVo);
		model.addAttribute("pointVo", pointVo);
		model.addAttribute("isDriver", result);
		
		
		return "my/driveHistroy";
	}
		
	
	// 포인트 페이지로 이동
	@RequestMapping(value = "/pointHistory", method = RequestMethod.GET)
	public String pointHistory(HttpSession session, PagingDto pagingDto, Model model) {
		MemberVo loginVo =(MemberVo)session.getAttribute("loginVo");
		String m_id = loginVo.getM_id();
		pagingDto.setCount(pointService.getCountPointById(m_id));
		pagingDto.setPage(pagingDto.getPage());
		List<Map<String, Object>> pointList = pointService.getPointListById(m_id, pagingDto.getStartRow(), pagingDto.getEndRow());
		model.addAttribute("pointList", pointList);
		
		boolean result = mylogService.isDriver(m_id);
		System.out.println(result);
		if (result) {
			Driver_EvlVo vo = mylogService.driver_evlListById(loginVo.getM_id());
			int sum = vo.getEvl1() * 1 + vo.getEvl2() * 2 + vo.getEvl3() * 3 + vo.getEvl4() * 4 + vo.getEvl5() * 5;
			double avg = sum / (double)vo.getEvl_count();
			model.addAttribute("driver_evlVo", vo);
			model.addAttribute("evl_sum", sum);
			model.addAttribute("evl_avg", avg);
		}
		
		Passenger_EvlVo passengerVo = mylogService.passenger_evlListById(m_id);
		Map<String, Object> pointVo = mylogService.nextPoint(m_id);
		model.addAttribute("passenger_evlVo", passengerVo);
		model.addAttribute("pointVo", pointVo);
		model.addAttribute("isDriver", result);
		
		return "my/pointHistory";
	}
	
	
	// 운전자 등록 페이지로 이동
	@RequestMapping(value = "/registerDriver", method = RequestMethod.GET)
	public String registerDriver(Model model) {
		return "my/registerDriver";
	}
	
	// 운전자등록폼 처리
	@RequestMapping(value = "/submitFile", method = RequestMethod.POST)
	public String submitLicenseFile(MultipartFile driverLicense, HttpSession session, RedirectAttributes rttr, String ci_name, String c_no) throws Exception{
		MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
		String m_id = memberVo.getM_id();
		String ext = driverLicense.getOriginalFilename();
		int dot = ext.lastIndexOf(".");
		
		// 기본파일 확장자 얻기
		String imageExt = ext.substring(dot);
		
		String company = memberVo.getM_company();
		String saveName = m_id + "'s_driver_license";
		byte[] fileData = driverLicense.getBytes();
		System.out.println("ci_name:" + ci_name);
		// 파일 경로 및 파일 이름
		String saveFilename = FileUploadHelper.uploadFileForDriver("//192.168.0.232/ServerFolder/DriverLicense/"+ company, (saveName + imageExt), fileData);
		
		if (saveFilename.equals("existence") || saveFilename == null) {
			rttr.addFlashAttribute("isExistence", "true");
			return "redirect:/";
		} 
		
		// db로부터 자동차 코드 얻어오기
		String c_code = carService.getCarCode(ci_name);
		System.out.println("c_code: " + c_code);
		// db에 회원이 소유하고 있는 자동차 정보 등록
		boolean result1 = carService.addCarByMember(c_no, c_code, m_id);
		// db에 회원의 운전면허증 등록
		boolean result2 = memberService.submitDriverLicense(memberVo.getM_id(), saveFilename);
		
		if (result1 && result2) {
			rttr.addFlashAttribute("registerDriver", "true");
		} else {
			rttr.addFlashAttribute("registerDriver", "false");
		}
		
		return "redirect:/";
	}
	
	// 운전내역 탑승객정보 상세보기
	@RequestMapping(value = "/driver_passengerlog", method = RequestMethod.POST)
	@ResponseBody
	public List<PassengerVo> driver_passengerlog(int driver_seq) {
		System.out.println(driver_seq);
		List<PassengerVo> driver_passengerlogList = mylogService.driver_passengerlogListBySeq(driver_seq);
		System.out.println(driver_passengerlogList);
		return driver_passengerlogList;
	}
	
	// 평가하기
	@RequestMapping(value = "/putStar", method = RequestMethod.POST)
	@Transactional
	public String putStar(String driver_m_id, int rating, int driver_seq, RedirectAttributes rttr, HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		System.out.println("rating:" + rating);
		evlService.updateDriverEvl(driver_m_id, rating);
		boolean finish_result = mylogService.evl_finish(loginVo.getM_id(), driver_seq);
		return "redirect:/my/boardedHistory";
	}
}
