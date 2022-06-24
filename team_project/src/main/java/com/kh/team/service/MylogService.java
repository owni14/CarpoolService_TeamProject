package com.kh.team.service;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.DriverVo;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.PassengerVo;
import com.kh.team.vo.Passenger_EvlVo;

public interface MylogService {
	public List<Map<String, Object>> passengerlogListById (String m_id, int startRow, int endRow); // 마이카풀 탑승내역 리스트
	public List<DriverVo> driverlogListById (String m_id, int startRow, int endRow); // 마이카풀 운전내역 리스트
	public List<PassengerVo> driver_passengerlogListBySeq (int driver_seq); // 마이카풀 운전내역 리스트
	public boolean putStar (String driver_m_id, int rating); // 평점 업데이트
	public boolean evl_finish (String m_id, int driver_seq); // 평점 완료 로그 찍기
	public Driver_EvlVo driver_evlListById (String m_id); // 운전자 등급 정보 불러오기
	public Passenger_EvlVo passenger_evlListById (String m_id); // 동승자 등급 정보 불러오기
	public Map<String, Object> nextPoint (String m_id); // 다음달 받을 포인트
}
