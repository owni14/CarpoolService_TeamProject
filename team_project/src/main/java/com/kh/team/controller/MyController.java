package com.kh.team.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MemberService;
import com.kh.team.service.PointService;
import com.kh.team.util.FileUploadHelper;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	private PointService pointService;
	
	@Autowired
	private MemberService memberService;

	// 탑승 내역 페이지로 이동
	@RequestMapping(value = "/boardedHistory", method = RequestMethod.GET)
	public String boardedHistory(HttpSession session, PagingDto pagingDto) {
		MemberVo loginVo =(MemberVo)session.getAttribute("loginVo");
//		System.out.println("loginVo :" + loginVo);
		pagingDto.setCount(pointService.getCountPointById(loginVo.getM_id()));
		pagingDto.setPage(pagingDto.getPage());
		return "my/boardedHistory";
	}
	
	// 탑승 내역 페이지로 이동
	@RequestMapping(value = "/pointHistory", method = RequestMethod.GET)
	public String pointHistory(HttpSession session, PagingDto pagingDto) {
		MemberVo loginVo =(MemberVo)session.getAttribute("loginVo");
//		System.out.println("loginVo :" + loginVo);
		pagingDto.setCount(pointService.getCountPointById(loginVo.getM_id()));
		pagingDto.setPage(pagingDto.getPage());
		List<Map<String, Object>> pointList = pointService.getPointListById(loginVo.getM_id(), pagingDto.getStartRow(), pagingDto.getEndRow());
//		System.out.println("pointList : " + pointList);
		session.setAttribute("pointList", pointList);
		return "my/pointHistory";
	}
	
	// 충전하기 페이지로 이동
	@RequestMapping(value = "/purchasePoint", method = RequestMethod.GET)
	public String purchasePoint() {
		return "my/purchasePoint";
	}
	
	// 운전자 등록 페이지로 이동
	@RequestMapping(value = "/registerDriver", method = RequestMethod.GET)
	public String registerDriver() {
		return "my/registerDriver";
	}
	
	// 운전자등록폼 처리
	@RequestMapping(value = "/submitFile", method = RequestMethod.POST)
	public String submitLicenseFile(MultipartFile driverLicense, HttpSession session, RedirectAttributes rttr) throws Exception{
		MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
		String ext = driverLicense.getOriginalFilename();
		int dot = ext.lastIndexOf(".");
		
		// 기본파일 확장자 얻기
		String imageExt = ext.substring(dot);
		
//		System.out.println("imageExtension:" + imageExt);
		
		String company = memberVo.getM_company();
		String saveName = memberVo.getM_id() + "'s_driver_license";
		byte[] fileData = driverLicense.getBytes();
		
		// 파일 경로 및 파일 이름
		String saveFilename = FileUploadHelper.uploadFileForDriver("//192.168.0.232/ServerFolder/DriverLicense/"+ company, (saveName + imageExt), fileData);
		
		if (saveFilename.equals("existence") || saveFilename == null) {
			rttr.addFlashAttribute("isExistence", "true");
			return "redirect:/";
		}
		
		memberService.submitDriverLicense(memberVo.getM_id(), saveFilename);
		
//		System.out.println("MyController, saveFilename:" + saveFilename);
		return "redirect:/";
	}
}
