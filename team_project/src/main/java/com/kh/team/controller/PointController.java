package com.kh.team.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/point")
public class PointController {
	
	// 포인트 페이지로 이동
	@RequestMapping(value = "point", method = RequestMethod.GET)
	public String describePoint() {
		return "point/point";
	}
	
}
