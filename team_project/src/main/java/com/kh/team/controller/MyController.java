package com.kh.team.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.PointService;
import com.kh.team.service.PointServiceImpl;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointHistoryVo;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	private PointService pointService;

	// 탑승 내역 페이지로 이동
	@RequestMapping(value = "/boardedHistory", method = RequestMethod.GET)
	public String boardedHistory() {
		return "my/boardedHistory";
	}
	
	// 탑승 내역 페이지로 이동
	@RequestMapping(value = "/pointHistory", method = RequestMethod.GET)
	public String pointHistory(HttpSession session, PagingDto pagingDto) {
		MemberVo loginVo =(MemberVo)session.getAttribute("loginVo");
		System.out.println("loginVo :" + loginVo);
		pagingDto.setCount(pointService.getCountPointById(pagingDto));
		List<Map<String, Object>> pointList = pointService.getPointListById(loginVo.getM_id(), pagingDto);
		System.out.println("pointList : " + pointList);
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
	
}
