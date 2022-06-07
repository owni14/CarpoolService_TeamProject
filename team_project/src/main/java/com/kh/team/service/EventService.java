package com.kh.team.service;

import java.sql.Date;
import java.util.List;

import com.kh.team.vo.EventVo;

public interface EventService {
	public List<EventVo> getEventList();
	public boolean insertEvent(EventVo vo);
	public boolean updateEvent(EventVo vo);
	public boolean deleteEvent(int event_seq);
	public List<EventVo> isEndEventList(String event_is_finish);
	public EventVo getEventByEseq(int event_seq);
}
