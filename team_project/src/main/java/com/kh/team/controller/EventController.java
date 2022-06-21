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
import com.kh.team.service.MessageService;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	@Autowired
	private MessageService messageService;
	
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
		System.out.println("event_seq: " + event_seq);
		String content = eventService.getContent(event_seq);
		model.addAttribute("content", content);
		model.addAttribute("event_seq", event_seq);
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
	
	// 당첨자 확인하기
	@ResponseBody
	@RequestMapping(value = "/checkWinner", method = RequestMethod.GET)
	public String checkWinner(String m_id, int event_seq) {
		boolean winnerResult = eventService.checkWinner(m_id, event_seq);
		if (winnerResult) {
			String goodsResult = eventService.checkGoods(m_id, event_seq);
			if (goodsResult.equals("Y")) {
				System.out.println("goodsResult : " + goodsResult);
				return "already";
			}
			return "true";
		}
		return "false";
	}
	
	// 당첨자 쪽지 발송
	@ResponseBody
	@RequestMapping(value = "/winnerMessage", method = RequestMethod.POST)
	public void winnerMessage(String m_id, int event_seq) {
		int couponPrice = eventService.couponPrice(event_seq);
		int eventPoint = eventService.getEventPoint(event_seq);
		System.out.println("eventPoint:" + eventPoint);
		String content = "";
		if (couponPrice > 0) {
			content += "주유 쿠폰 " + couponPrice + "만원 권 지급되었습니다.\n";
		} 
		if (eventPoint > 0) {
			content += "이벤트에 당첨되어 " + eventPoint + "point가 충전되었습니다.";
		}
		System.out.println("content: " + content); 
		MessageVo messageVo = new MessageVo();
		messageVo.setReceiver_m_id(m_id);
		messageVo.setSender_admin_code("1002");
		messageVo.setContent(content);
		messageService.insertNoBlackMessage(messageVo);
		eventService.sendGoods(m_id, event_seq);
	}
}
