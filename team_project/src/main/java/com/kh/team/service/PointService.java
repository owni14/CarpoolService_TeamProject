package com.kh.team.service;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointHistoryVo;

public interface PointService {
	public List<Map<String, Object>> getPointListById(String m_id, int startRow, int endRow);
	public int getCountPointById(String m_id);
	public boolean paymet(String m_id, int m_point); // 포인트 결제하기
	public void insertPointHistory(PointHistoryVo pointHistoryVo);
}
