package com.kh.team.dao;

import com.kh.team.vo.PointCodeVo;
import com.kh.team.vo.PointHistoryVo;

public interface PointDao {
	public void insertPointCode(PointCodeVo pointCodeVo);
	public void insertPointHistory(PointHistoryVo pointHistoryVo);
	public PointHistoryVo getPointHistoryById(String m_id);
}
