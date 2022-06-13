package com.kh.team.service;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.DriverVo;
import com.kh.team.vo.PassengerVo;

public interface MylogService {
	public List<Map<String, Object>> passengerlogListById (String m_id, int startRow, int endRow); // 마이카풀 탑승내역 리스트
	public List<DriverVo> driverlogListById (String m_id, int startRow, int endRow); // 마이카풀 운전내역 리스트
	public List<PassengerVo> driver_passengerlogListBySeq (int driver_seq); // 마이카풀 운전내역 리스트
	public boolean addDriver(DriverVo driverVo); // 회원이 운전하기페이지에서 운전정보 등록
}
