package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.MessageVo;

public interface MessageService {
	public boolean insertMessage(MessageVo messageVo); // 쪽지 추가 sequence 사용하므로 새로 만들지 말고 모두 해당 method 사용해 주세요
	public List<Integer> adminCheckSendedMessage();
	public boolean insertNoBlackMessage(MessageVo messageVo);
	public List<MessageVo> recAdminMessageListById(String m_id);
	public List<MessageVo> recUserMessageListById(String m_id);
	public List<MessageVo> sendMessageListById(String m_id);
}
