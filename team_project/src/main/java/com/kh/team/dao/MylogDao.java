package com.kh.team.dao;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.DriverVo;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.PassengerVo;

public interface MylogDao {
	public void insertPassenger(PassengerVo passengerVo); // 테스트용 탑승자로그 추가
	public List<Map<String, Object>> passengerlogListById (String m_id, int startRow, int endRow); // 마이카풀 탑승내역 리스트
	public List<DriverVo> driverlogListById (String m_id, int startRow, int endRow); // 마이카풀 운전내역 리스트
	public List<PassengerVo> driver_passengerlogListBySeq (int driver_seq); // 마이카풀 운전내역 리스트
	public boolean putStar (String driver_m_id, int rating); // 평점 업데이트
	public boolean evl_finish (String m_id, int driver_seq); // 평점 완료 로그 찍기
	public Driver_EvlVo driver_evlListById (String m_id); // 운전자 평점 불러오기
}
