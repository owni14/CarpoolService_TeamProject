package com.kh.team.dao;

import java.sql.Date;
import java.util.List;

import com.kh.team.vo.EventVo;

public interface EventDao {

	public List<EventVo> getEventList();
	public boolean insertEvent(EventVo vo);
	public boolean updateEvent(EventVo vo);
	public boolean deleteEvent(int event_seq);
	public boolean isEndEventList(Date date);
	public EventVo getEventByEseq(int event_seq);
}
