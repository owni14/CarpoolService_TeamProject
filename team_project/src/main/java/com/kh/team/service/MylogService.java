package com.kh.team.service;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.DriverVo;

public interface MylogService {
	public List<Map<String, Object>> passengerlogListById (String m_id, int startRow, int endRow); // 마이카풀 탑승내역 리스트
	public List<DriverVo> driverlogListById (String m_id, int startRow, int endRow); // 마이카풀 운전내역 리스트
	public List<Map<String, Object>> driver_passengerlogListById (String m_id); // 마이카풀 운전내역 리스트
}
