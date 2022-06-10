package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.FaqService;
import com.kh.team.vo.FaqVo;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private FaqService faqService;
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(HttpSession session) {
		List<FaqVo> faqList = faqService.getFaqList();
		session.setAttribute("faqList", faqList);
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
