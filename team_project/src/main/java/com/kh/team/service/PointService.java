package com.kh.team.service;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointHistoryVo;

public interface PointService {
	public List<Map<String, Object>> getPointListById(String m_id, int startRow, int endRow);
	public int getCountPointById(String m_id);
}
