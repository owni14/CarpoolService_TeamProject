package com.kh.team.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.EventVo;
@Repository
public class EventDaoImpl implements EventDao{
	private final String NAMESPACE="com.kh.team.mappers.event.";
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<EventVo> getEventList() {
		List<EventVo> eventList=sqlSession.selectList(NAMESPACE+"getEventList");
		return eventList;
	}

	@Override
	public boolean insertEvent(EventVo vo) {
		int count=sqlSession.insert(NAMESPACE+"insertEvent",vo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateEvent(EventVo vo) {
		int count=sqlSession.update(NAMESPACE+"updateEvent",vo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteEvent(int event_seq) {
		int count=sqlSession.update(NAMESPACE+"deleteEvent",event_seq);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isEndEventList(Date date) {
		sqlSession.selectList(NAMESPACE);
		return false;
	}

	@Override
	public EventVo getEventByEseq(int event_seq) {
		EventVo eventVo=sqlSession.selectOne(NAMESPACE+"getEventByEseq",event_seq);
		return eventVo;
	}

}
