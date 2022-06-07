
package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.EventService;
import com.kh.team.service.MemberService;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	EventService eventService;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/home", method= RequestMethod.GET)
	public String homeAdmin() {
		return "admin/home_admin";
	}

	@RequestMapping(value="/event", method= RequestMethod.GET)
	public String eventList(Model model) {
		List<EventVo> eventList=eventService.getEventList();
		model.addAttribute("eventList", eventList);
		return "admin/eventManagement";
	}
	
	@RequestMapping(value = "/member_management", method = RequestMethod.GET)
	public String memberManagement(Model model, int page) {
//		System.out.println("AdminController int page : " + page);
		PagingDto pagingDto = new PagingDto();
		pagingDto.setPage(page);
//		System.out.println("AdminController int pagingDto : " + pagingDto);
		List<MemberVo> memberList =  memberService.getMemberList(pagingDto);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingDto", pagingDto);
		return "admin/memberManagement";
	}
	
	@RequestMapping(value="/event_details", method= RequestMethod.GET)
	public String eventGetBySeq(int event_seq,Model model) {
		EventVo eventVo=eventService.getEventByEseq(event_seq);
		model.addAttribute("eventVo", eventVo);
		return "admin/eventDetails";
	}

}

