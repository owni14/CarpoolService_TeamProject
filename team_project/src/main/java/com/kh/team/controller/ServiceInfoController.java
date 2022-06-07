package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/serviceInfo")
public class ServiceInfoController {

	// 예약 방법 페이지로 이동
	@RequestMapping(value = "method", method = RequestMethod.GET)
	public String reservationMethod() {
		return "serviceInfo/method";
	}
	
	// 포인트 페이지로 이동
	@RequestMapping(value = "describe", method = RequestMethod.GET)
	public String describePoint() {
		return "serviceInfo/describe";
	}
	
}
