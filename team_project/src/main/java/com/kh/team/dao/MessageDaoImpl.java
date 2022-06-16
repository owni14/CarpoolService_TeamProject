package com.kh.team.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;



@Repository
public class MessageDaoImpl implements MessageDao {
	private final String NAMESPACE = "com.kh.team.mappers.message.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertMessage(MessageVo messageVo) {
		int count = sqlSession.insert(NAMESPACE + "insertMessage", messageVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Integer> adminCheckSendedMessage() {
		List<Integer> list = sqlSession.selectList(NAMESPACE + "adminCheckSendedMessage");
		return list;
	}

	@Override
	public boolean insertNoBlackMessage(MessageVo messageVo) {
		System.out.println("dao message "+messageVo);
		int count = sqlSession.insert(NAMESPACE + "insertNoBlackMessage", messageVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<MessageVo> sendMessageListById(String m_id, PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		List<MessageVo> sendMessageList = sqlSession.selectList(NAMESPACE + "sendMessageListById", map);
		return sendMessageList;
	}

	@Override
	public List<Map<String, Object>> recAdminMessageListById(String m_id, PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		List<Map<String, Object>> recAdminMessageList = sqlSession.selectList(NAMESPACE + "recAdminMessageListById", map);
		return recAdminMessageList;
	}

	@Override
	public List<MessageVo> recUserMessageListById(String m_id, PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		List<MessageVo> recUserMessageList = sqlSession.selectList(NAMESPACE + "recUserMessageListById", map);
		return recUserMessageList;
	}

	@Override
	public int recAdminMessageCountById(String m_id) {
		int count = sqlSession.selectOne(NAMESPACE + "recAdminMessageCountById", m_id);
		return count;
	}

	@Override
	public int recUserMessageCountById(String m_id) {
		int count = sqlSession.selectOne(NAMESPACE + "recUserMessageCountById", m_id);
		return count;
	}

	@Override
	public int sendMessageCountById(String m_id) {
		int count = sqlSession.selectOne(NAMESPACE + "sendMessageCountById", m_id);
		return count;
	}

	@Override
	public List<MessageVo> lastMessageListById(String m_id) {
		List<MessageVo> lastMessageList = sqlSession.selectList(NAMESPACE + "lastMessageListById", m_id);
		return lastMessageList;
	}

}
