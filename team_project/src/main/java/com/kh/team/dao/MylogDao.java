package com.kh.team.dao;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.DriverVo;
import com.kh.team.vo.PassengerVo;

public interface MylogDao {
	public void insertDriver(DriverVo driverVo); // 테스트용 드라이버로그 추가
	public void insertPassenger(PassengerVo passengerVo); // 테스트용 탑승자로그 추가
	public List<Map<String, Object>> mylogListById (String m_id, int startRow, int endRow); // 마이카풀 탑승내역 리스트
}
