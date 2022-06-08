package com.kh.team.dao;

import java.sql.Date;
import java.util.List;

import com.kh.team.vo.EventVo;
import com.kh.team.vo.PagingDto;

public interface EventDao {

	public List<EventVo> getEventList();
	public boolean insertEvent(EventVo eventVo);
	public boolean updateEvent(EventVo eventVo);
	public boolean deleteEvent(int event_seq);
	public List<EventVo> isEndEventList(String event_is_finish);
	public EventVo getEventByEseq(int event_seq);
	public int getCountEvent(PagingDto pagingDto);
	public List<EventVo> getEventMainList(PagingDto pagingDto);
}
