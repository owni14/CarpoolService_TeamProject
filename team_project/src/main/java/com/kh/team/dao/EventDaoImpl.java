package com.kh.team.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.EventVo;
import com.kh.team.vo.PagingDto;
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
	public boolean insertEvent(EventVo eventVo) {
		int count=sqlSession.insert(NAMESPACE+"insertEvent",eventVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateEvent(EventVo eventVo) {
		int count=sqlSession.update(NAMESPACE+"updateEvent",eventVo);
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
	public List<EventVo> isEndEventList(String event_is_finish) {
		List<EventVo> eventList=sqlSession.selectList(NAMESPACE+"isEndEventList",event_is_finish);
		return eventList;
	}

	@Override
	public EventVo getEventByEseq(int event_seq) {
		EventVo eventVo=sqlSession.selectOne(NAMESPACE+"getEventByEseq",event_seq);
		return eventVo;
	}

	@Override
	public int getCountEvent() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "getCountEvent"); 
		return count;
	}

	@Override
	public List<EventVo> getEventMainList(PagingDto pagingDto) {
		List<EventVo> eventList=sqlSession.selectList(NAMESPACE+"getEventMainList", pagingDto);
		return eventList;
	}

	@Override
	public void updateEventFinish(int event_seq) {
		sqlSession.update(NAMESPACE+"updateEventFinish",event_seq);
	}

	@Override
	public String getContent(int event_seq) {
		String event_content=sqlSession.selectOne(NAMESPACE+"getContent",event_seq );
		return event_content;
	}

}
