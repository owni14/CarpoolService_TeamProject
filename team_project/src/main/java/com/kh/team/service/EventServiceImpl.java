package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.EventDao;
import com.kh.team.vo.EventParticipationVo;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.EventWinnerVo;
import com.kh.team.vo.PagingDto;
@Service
public class EventServiceImpl implements EventService {
	@Autowired
	EventDao eventDao;
	
	@Override
	public List<EventVo> getEventList(PagingDto pagingDto) {
		
		return eventDao.getEventList(pagingDto);
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
	public int getCountMainEvent() {
		return eventDao.getCountMainEvent();
	}
	
	@Override
	public int getCountFinishEvent() {
		return eventDao.getCountFinishEvent();
	}

	@Override
	public List<EventVo> getEventMainList(PagingDto pagingDto) {
		return eventDao.getEventMainList(pagingDto);
	}
	
	@Override
	public List<EventVo> getEventFinishList(PagingDto pagingDto) {
		return eventDao.getEventFinishList(pagingDto);
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
	public boolean checkWinner(String m_id, int event_seq) {
		return eventDao.checkWinner(m_id, event_seq);
	}
	
	@Override
	public int couponPrice(int event_seq) {
		return eventDao.couponPrice(event_seq);
	}
	
	@Override
	public int getEventPoint(int event_seq) {
		return eventDao.getEventPoint(event_seq);
	}
	
	@Override
	public String checkGoods(String m_id, int event_seq) {
		return eventDao.checkGoods(m_id, event_seq);
	}
	
	@Override
	public void sendGoods(String m_id, int event_seq) {
		eventDao.sendGoods(m_id, event_seq);
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

	@Override
	public List<Integer> selectAllEventList() {
		return eventDao.selectAllEventList();
	}

	@Override
	public List<EventVo> selectEndEventList() {
		return eventDao.selectEndEventList();
	}

	@Override
	public List<Integer> selectLiveEventList() {
		return eventDao.selectLiveEventList();
	}

	@Override
	public int selectEventMaxCount(int event_seq) {
		return eventDao.selectEventMaxCount(event_seq);
	}
	@Override
	public boolean updateIsLot(int event_seq) {
		return eventDao.updateIsLot(event_seq);
	}
	
	@Override
	public boolean updateEventWinnerToParticipation(int event_seq, String m_id) {
		return eventDao.updateEventWinnerToParticipation(event_seq, m_id);
	}
	@Override
	public boolean updateEventWinnerPoint(String m_id, String pc_code) {
		return eventDao.updateEventWinnerPoint(m_id, pc_code);
	}
	@Override
	public boolean insertEventWinnerPointHistory(String m_id, String pc_code) {
		return eventDao.insertEventWinnerPointHistory(m_id, pc_code);
	}
	
	@Transactional
	@Override
	public boolean transactionEventUpdate(int event_seq,String m_id, String pc_code) {
		boolean resultIsLot=updateIsLot(event_seq);
		boolean resultWinner=updateEventWinnerToParticipation(event_seq, m_id);
		boolean resultPoint=updateEventWinnerPoint(m_id, pc_code);
		boolean resultWinnerTbl=insertEventWinnerTable(m_id, event_seq);
		boolean resultHistory=insertEventWinnerPointHistory(m_id, pc_code);
		if(resultIsLot &&resultWinner &&resultPoint &&resultHistory &&resultWinnerTbl  ) {
			return true;
		}
		return false;
	}
	@Override
	public boolean insertEventWinnerTable(String m_id, int event_seq) {
		return eventDao.insertEventWinnerTable(m_id, event_seq);
	}
	@Override
	public List<EventWinnerVo> selectWinnerIsGet(int event_seq) {
		return eventDao.selectWinnerIsGet(event_seq);
	}

	@Override
	public int selectCountWinnerNoGet() {
		return eventDao.selectCountWinnerNoGet();
	}

	

	

	

	

	

	

	
}
