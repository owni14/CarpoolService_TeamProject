package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.EventService;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// 이벤트 & 혜택 페이지로 이동
	// 현재 진행중인 이벤트로 이동
	@RequestMapping(value = "/now", method = RequestMethod.GET)
	public String now(Model model, PagingDto pagingDto) {
		
		
		pagingDto.setCount(eventService.getCountEvent(pagingDto));
		pagingDto.setPerPage(3); // 한 페이지에 나오는 이벤트 개수
		pagingDto.setPage(pagingDto.getPage());
		List<EventVo> eventList = eventService.getEventMainList(pagingDto);
//		System.out.println("eventList: " + eventList);
		model.addAttribute("eventList", eventList);
		model.addAttribute("pagingDto", pagingDto);
		return "event/now";
	}
	
	// 당첨자 발표 페이지로 이동
	@RequestMapping(value = "/winner", method = RequestMethod.GET)
	public String winner() {
		return "event/winner";
	}
	
	// 등급별 혜택
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() {
		return "event/info";
	}
}
