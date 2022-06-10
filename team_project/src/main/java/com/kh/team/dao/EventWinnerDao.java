package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.EventWinnerVo;

public interface EventWinnerDao {
	public List<EventWinnerVo> selectAllWinner();
	public List<EventWinnerVo> selectByEventSeq(int event_seq);
	 
}
