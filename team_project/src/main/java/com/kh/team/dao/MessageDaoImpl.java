package com.kh.team.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.MessageVo;



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
	public List<MessageVo> sendMessageListById(String m_id) {
		List<MessageVo> sendMessageList = sqlSession.selectList(NAMESPACE + "sendMessageListById", m_id);
		return sendMessageList;
	}

	@Override
	public List<MessageVo> recAdminMessageListById(String m_id) {
		List<MessageVo> recAdminMessageList = sqlSession.selectList(NAMESPACE + "recAdminMessageListById", m_id);
		return recAdminMessageList;
	}

	@Override
	public List<MessageVo> recUserMessageListById(String m_id) {
		List<MessageVo> recUserMessageList = sqlSession.selectList(NAMESPACE + "recUserMessageListById", m_id);
		return recUserMessageList;
	}

}
