package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team.service.MessageService;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.MessageVo;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/receivedMessagePage", method= RequestMethod.GET)
	public String receivedMessagePage(HttpSession session)	{
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		List<MessageVo> receivedMessageList = messageService.receivedMessageListById(loginVo.getM_id());
		session.setAttribute("receivedMessageList", receivedMessageList);
		return "/message/receive";
	}
	
	@RequestMapping(value="/sendMessagePage", method= RequestMethod.GET)
	public String sendMessagePage(HttpSession session)	{
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		List<MessageVo> sendMessageList = messageService.sendMessageListById(loginVo.getM_id());
		session.setAttribute("sendMessageList", sendMessageList);
		return "/message/send";
	}
	
	@ResponseBody
	@RequestMapping(value="/notifyComplete", method= RequestMethod.POST)
	public String notifyComplete(MessageVo messageVo) {
		System.out.println("messageVo : " + messageVo);
		boolean result = messageService.insertMessage(messageVo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/checkSendedMessage", method= RequestMethod.POST)
	public List<Integer> checkSended() {
		List<Integer> list = messageService.adminCheckSendedMessage();
		System.out.println("list : " + list);
		return list;
	}
	
	//add event 메세지
	@ResponseBody
	@RequestMapping(value="/EventIsNoGet", method= RequestMethod.POST)
	public String notifyEventIsNoGet(MessageVo messageVo) {
		System.out.println("messageVo : " + messageVo);
		boolean result = messageService.insertNoBlackMessage(messageVo);
		return String.valueOf(result);
	}
}
