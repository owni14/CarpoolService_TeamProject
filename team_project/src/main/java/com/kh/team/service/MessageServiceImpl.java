package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.MessageDao;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDao messageDao;

	@Override
	public boolean insertMessage(MessageVo messageVo) {
		boolean result = messageDao.insertMessage(messageVo);
		return result;
	}

	@Override
	public List<Integer> adminCheckSendedMessage() {
		List<Integer> list = messageDao.adminCheckSendedMessage();
		return list;
	}

	@Override
	public boolean insertNoBlackMessage(MessageVo messageVo) {
		return messageDao.insertNoBlackMessage(messageVo);
	}

	@Override
	public List<MessageVo> sendMessageListById(String m_id, PagingDto pagingDto) {
		List<MessageVo> sendMessageList = messageDao.sendMessageListById(m_id, pagingDto);
		return sendMessageList;
	}

	@Override
	public List<Map<String, Object>> recAdminMessageListById(String m_id, PagingDto pagingDto) {
		List<Map<String, Object>> recAdminMessageList = messageDao.recAdminMessageListById(m_id, pagingDto);
		return recAdminMessageList;
	}

	@Override
	public List<MessageVo> recUserMessageListById(String m_id, PagingDto pagingDto) {
		List<MessageVo> recUserMessageList = messageDao.recUserMessageListById(m_id, pagingDto);
		return recUserMessageList;
	}

	@Override
	public int recAdminMessageCountById(String m_id) {
		int count = messageDao.recAdminMessageCountById(m_id);
		return count;
	}

	@Override
	public int recUserMessageCountById(String m_id) {
		int count = messageDao.recUserMessageCountById(m_id);
		return count;
	}

	@Override
	public int sendMessageCountById(String m_id) {
		int count = messageDao.sendMessageCountById(m_id);
		return count;
	}

	@Override
	public List<MessageVo> lastMessageListById(String m_id) {
		List<MessageVo> lastMessageList = messageDao.lastMessageListById(m_id);
		return lastMessageList;
	}

	



}
