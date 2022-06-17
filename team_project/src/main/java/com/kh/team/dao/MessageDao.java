package com.kh.team.dao;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

public interface MessageDao {
	public boolean insertMessage(MessageVo messageVo); // 쪽지 추가 sequence 사용하므로 새로 만들지 말고 모두 해당 method 사용해 주세요
	public List<Integer> adminCheckSendedMessage();
	public boolean insertNoBlackMessage(MessageVo messageVo);
	public List<Map<String, Object>> recAdminMessageListById(String m_id, PagingDto pagingDto); // 시스템 쪽지 리스트 // 받은 쪽지
	public List<MessageVo> recUserMessageListById(String m_id, PagingDto pagingDto); // 유저 쪽지 리스트 // 받은 쪽지
	public List<MessageVo> sendMessageListById(String m_id, PagingDto pagingDto); // 보낸 쪽지 리스트
	public int recAdminMessageCountById(String m_id); // 시스템 쪽지 개수
	public int recUserMessageCountById(String m_id); // 유저 쪽지 개수
	public int sendMessageCountById(String m_id); // 보낸 쪽지 개수
	public List<MessageVo> lastMessageListById(String m_id); // 최근 쪽지 목록
	
}
