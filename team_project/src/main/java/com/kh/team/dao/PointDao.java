package com.kh.team.dao;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointCodeVo;
import com.kh.team.vo.PointHistoryVo;

public interface PointDao {
	public void insertPointCode(PointCodeVo pointCodeVo);
	public void insertPointHistory(PointHistoryVo pointHistoryVo);
	public List<PointHistoryVo> getPointHistoryById(String m_id);
	public List<Map<String, Object>> getPointListById(String m_id, int startRow, int endRow);
	public int getCountPointById(String m_id);
}
