package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/customer")
public class CostomerController {
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return "customer/faq";
	}
	
	@RequestMapping(value = "/counsel", method = RequestMethod.GET)
	public String counsel() {
		return "customer/counsel";
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report() {
		return "customer/report";
	}
}
