package com.kh.team.service;

import java.sql.Date;
import java.util.List;

import com.kh.team.vo.EventVo;
import com.kh.team.vo.PagingDto;

public interface EventService {
	public List<EventVo> getEventList();
	public boolean insertEvent(EventVo eventVo);
	public boolean updateEvent(EventVo eventVo);
	public boolean deleteEvent(int event_seq);
	public List<EventVo> isEndEventList(String event_is_finish);
	public EventVo getEventByEseq(int event_seq);
	public int getCountEvent(PagingDto pagingDto); // 이벤트 수 확인
	public List<EventVo> getEventMainList(PagingDto pagingDto);
	public void updateEventFinish(int event_seq);
}
