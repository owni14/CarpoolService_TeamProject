package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team.service.MessageService;
import com.kh.team.vo.MessageVo;



@RestController
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	
	@RequestMapping(value="/notifyComplete", method= RequestMethod.POST)
	public String notifyComplete(MessageVo messageVo) {
		System.out.println("messageVo : " + messageVo);
		boolean result = messageService.insertMessage(messageVo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/checkSendedMessage", method= RequestMethod.POST)
	public List<Integer> checkSended() {
		List<Integer> list = messageService.adminCheckSendedMessage();
		System.out.println("list : " + list);
		return list;
	}
	
	//add event 메세지
	@RequestMapping(value="/EventIsNoGet", method= RequestMethod.POST)
	public String notifyEventIsNoGet(MessageVo messageVo) {
		System.out.println("messageVo : " + messageVo);
		boolean result = messageService.insertNoBlackMessage(messageVo);
		return String.valueOf(result);
	}
}
