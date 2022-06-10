package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.EventDao;
import com.kh.team.vo.EventParticipationVo;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.PagingDto;
@Service
public class EventServiceImpl implements EventService {
	@Autowired
	EventDao eventDao;
	
	@Override
	public List<EventVo> getEventList() {
		
		return eventDao.getEventList();
	}

	@Override
	public boolean insertEvent(EventVo param) {
		boolean result=eventDao.insertEvent(param);
		System.out.println("insertEvent 서비스 실행 결과 : getEvent_seq "+param.getEvent_seq());
		return result;
	}

	@Override
	public boolean updateEvent(EventVo vo) {
		return eventDao.updateEvent(vo);
	}

	@Override
	public boolean deleteEvent(int event_seq) {
		return eventDao.deleteEvent(event_seq);
	}

	@Override
	public List<EventVo> isEndEventList(String event_is_finish) {
		return eventDao.isEndEventList(event_is_finish);
	}

	@Override
	public EventVo getEventByEseq(int event_seq) {
		return eventDao.getEventByEseq(event_seq);
	}

	@Override
	public int getCountEvent() {
		return eventDao.getCountEvent();
	}

	@Override
	public List<EventVo> getEventMainList(PagingDto pagingDto) {
		return eventDao.getEventMainList(pagingDto);
	}

	@Override
	public void updateEventFinish(int event_seq) {
			eventDao.updateEventFinish(event_seq);
	}

	@Override
	public String getContent(int event_seq) {
		return eventDao.getContent(event_seq);
	}

	@Override
	public void createTableEvnet(int event_seq) {
			eventDao.createTableEvnet(event_seq);
	}

	@Override
	public void createSeqParticipation(int event_seq) {
		eventDao.createSeqParticipation(event_seq);
	}

	@Override
	public boolean insertParticipation(String m_id, int event_seq) {
		return eventDao.insertParticipation(m_id, event_seq);
	}

	@Override
	public boolean updateParticipation(String m_id, int event_seq) {
		return eventDao.updateParticipation(m_id, event_seq);
	}

	@Override
	public List<EventParticipationVo> getListParticipationByEventSeq(int event_seq) {
		return eventDao.getListParticipationByEventSeq(event_seq);
	}

	@Override
	public int getMaxNoFinishEventSeq() {
		return eventDao.getMaxNoFinishEventSeq();
	}

	@Override
	public List<Map<String, Object>> getJoinEventData(int event_seq) {
		return eventDao.getJoinEventData(event_seq);
	}

}
