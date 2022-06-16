package com.kh.team.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.ComplainService;
import com.kh.team.service.FaqService;
import com.kh.team.service.NotifyService;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.ComplainVo;
import com.kh.team.vo.FaqVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	private final String GM = "1001";
	private final String CS = "1002";
	private final String CS2 = "1003";
	@Autowired
	private FaqService faqService;
	@Autowired
	private ComplainService complainService;
	@Autowired
	private NotifyService notifyService;
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(HttpSession session) {
		List<FaqVo> faqList = faqService.getFaqList();
		session.setAttribute("faqList", faqList);
		return "customer/faq";
	}
	
	@RequestMapping(value = "/counsel", method = RequestMethod.GET)
	public String counsel(HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		List<Map<String, Object>> finishList = complainService.getFinishListById(loginVo.getM_id());
		List<ComplainVo> notFinishList = complainService.getNotFinishListById(loginVo.getM_id());
		session.setAttribute("finishList", finishList);
		session.setAttribute("notFinishList", notFinishList);
		return "customer/counsel";
	}
	
	@RequestMapping(value = "/complain_run", method = RequestMethod.POST)
	public String complain_run(ComplainVo complainVo, RedirectAttributes rttr) {
		String menu = complainVo.getComplain_classification();
		String content = complainVo.getComplain_content();
		if (menu.equals("분류를 선택해 주세요") || (content != null && content.equals(""))) {
			rttr.addFlashAttribute("complain_error", true);
			return "redirect:/customer/counsel";
		}
		if (menu.equals("시스템 이용문의") || menu.equals("기타")) {
			complainVo.setAdmin_code(GM);
		} else if (menu.equals("불편")) {
			complainVo.setAdmin_code(CS2);
		} else {
			complainVo.setAdmin_code(CS);
		}
		boolean result = complainService.insertComplain(complainVo);
		rttr.addFlashAttribute("complain_submit", result);
		return "redirect:/customer/counsel";
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report(HttpSession session,PagingDto pagingDto) {
		List<BlackListVo> yBlackList = notifyService.yNotifyList();
		List<BlackListVo> nBlackList = notifyService.nNotifyList(pagingDto);
		session.setAttribute("yBlackList", yBlackList);
		session.setAttribute("nBlackList", nBlackList);
		return "customer/report";
	}
	
	@RequestMapping(value = "/black_report", method= RequestMethod.POST)
	public String black_report(BlackListVo blackListVo, RedirectAttributes rttr) {
		boolean result = notifyService.insertNotification(blackListVo);
		if (result) {
			rttr.addFlashAttribute("black_result", true);
			return "redirect:/customer/report";
		} 
		rttr.addFlashAttribute("black_result", false);
		return "redirect:/my/boardedHistory";
		
	}
}
