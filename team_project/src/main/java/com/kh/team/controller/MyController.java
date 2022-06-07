package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/my")
public class MyController {

	// 탑승 내역 페이지로 이동
	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String boardedHistory() {
		return "my/history";
	}
	
	// 탑승 내역 페이지로 이동
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String pointHistory() {
		return "my/point";
	}
	
	// 충전하기 페이지로 이동
	@RequestMapping(value = "/purchasePoint", method = RequestMethod.GET)
	public String purchasePoint() {
		return "my/purchasePoint";
	}
	
	// 운전자 등록 페이지로 이동
	@RequestMapping(value = "/rgstDriver", method = RequestMethod.GET)
	public String registerDriver() {
		return "my/registerDriver";
	}
	
}
