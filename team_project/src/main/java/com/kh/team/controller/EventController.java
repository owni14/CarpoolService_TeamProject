package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.EventService;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// 현재 진행중인 이벤트로 이동
	@RequestMapping(value = "/now", method = RequestMethod.GET)
	public String now(Model model, PagingDto pagingDto) {
		pagingDto.setCount(eventService.getCountMainEvent());
		pagingDto.setPerPage(5); // 한 페이지에 나오는 이벤트 개수
		pagingDto.setPage(pagingDto.getPage());
		List<EventVo> eventList = eventService.getEventMainList(pagingDto);
		System.out.println("eventList: " + eventList);
		model.addAttribute("eventList", eventList);
		model.addAttribute("pagingDto", pagingDto);
		return "event/now";
	}
	
	// 당첨자 발표 페이지로 이동
	@RequestMapping(value = "/winner", method = RequestMethod.GET)
	public String winner(Model model, PagingDto pagingDto) {
		pagingDto.setCount(eventService.getCountFinishEvent());
		pagingDto.setPerPage(5);
		pagingDto.setPage(pagingDto.getPage());
		List<EventVo> finishList = eventService.getEventFinishList(pagingDto);
		model.addAttribute("finishList", finishList);
		model.addAttribute("pagingDto", pagingDto);
		return "event/winner";
	}
	
	// 등급별 혜택
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() {
		return "event/info";
	}
	
	// 이벤트 상세 정보
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(int event_seq, Model model) {
		String content = eventService.getContent(event_seq);
		model.addAttribute("content", content);
		return "event/detail";
	}
	
	// 이벤트 당첨자 확인
	@RequestMapping(value = "/winnerCheck", method = RequestMethod.GET)
	public String winnerCheck(int event_seq, Model model) {
		String content = eventService.getContent(event_seq);
		List<String> winnerList = eventService.getWinnerId(event_seq);
		model.addAttribute("content", content);
		model.addAttribute("winnerList", winnerList);
		return "event/winner_check";
	}
	
	// 썸네일 불러오기
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception {
		System.out.println("displayImage 호출됨");
		FileInputStream fis = null;
		fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;

	}
}
