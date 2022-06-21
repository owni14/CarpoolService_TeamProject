package com.kh.team;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.EventService;
import com.kh.team.vo.EventVo;


@Controller
public class HomeController {
	@Autowired
	EventService eventService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<EventVo> eventList=eventService.selectEventTopThree();
		model.addAttribute("eventList",eventList);
		return "home";
	}
	
}
