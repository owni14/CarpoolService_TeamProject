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
	
	// 이벤트 & 혜택 페이지로 이동
	// 현재 진행중인 이벤트로 이동
	@RequestMapping(value = "/now", method = RequestMethod.GET)
	public String now(Model model, PagingDto pagingDto) {
		pagingDto.setCount(eventService.getCountEvent());
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
	
	// 이벤트 상세 정보
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String event_seq) {
		System.out.println("event_seq: " + event_seq);
		return "event/detail";
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
