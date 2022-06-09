package com.kh.team.service;

import java.util.List;
import java.util.Map;

public interface MylogService {
	public List<Map<String, Object>> mylogListById (String m_id, int startRow, int endRow); // 마이카풀 탑승내역 리스트
}
