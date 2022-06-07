package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.MemberService;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/event")
public class eventController {
	
	@Autowired
	private MemberService memberService;
	
	// 이벤트 & 혜택 페이지로 이동
	// 현재 진행중인 이벤트로 이동
	@RequestMapping(value = "/now", method = RequestMethod.GET)
	public String now() {
		return "board/event_now";
	}
	
	// 당첨자 발표 페이지로 이동
	@RequestMapping(value = "/winner", method = RequestMethod.GET)
	public String winner() {
		return "board/event_winner";
	}
	
	// 등급별 혜택
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() {
		System.out.println();
		return "board/event_info";
	}
}
