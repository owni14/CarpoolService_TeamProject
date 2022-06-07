package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	// 운전자 등록 페이지로 이동
	@RequestMapping(value = "drive", method = RequestMethod.GET)
	public String drive() {
		return "board/drive";
	}
	
	// 예약하기 페이지로 이동
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String passengerReservation() {
		return "board/reservation";
	}
}
