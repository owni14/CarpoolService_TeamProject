package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Is_Update_PointVo;
import com.kh.team.vo.Passenger_EvlVo;

public interface EvlDao {
	public boolean insertDriverEvl(Driver_EvlVo driver_EvlVo);
	public boolean insertPassengerEvl(String m_id);
	public List<String> selectEvlCodeList();
	public boolean updatePointByEvl();//드라이버 등급에 따른 포인트 업데이트
	
	public int selectCountIsUpdate(String formattedToday, String iup_what);// 포인트 업데이트 유무
	public boolean insertEvlUpdate(Is_Update_PointVo is_Update_PointVo);
	public boolean updatePointPassengerByEvl();//패신저 등급에 따른 포인트 업데이트
	
	// driver 등급 별 인원 수 파악
	public int countvvipDriver();
	public int countvipDriver();
	public int countgoldDriver();
	public int countsilverDriver();
	public int countwhiteDriver();
	// passenger 등급 별 인원 수 파악
	public int countvvipPassenger();
	public int countvipPassenger();
	public int countgoldPassenger();
	public int countsilverPassenger();
	public int countwhitePassenger();
	
	public boolean driverEvlUpdate(String m_id, int rating); // 탑승자가 평가하기 클릭 시 운전자에 대한 평가
	public Driver_EvlVo getDriverEvlInfo(String m_id); // 윤전자의 평가 점수 및 현재 운행횟수 확인
	public void driverGradeUpdate(String m_id, String g_code); // 운전자의 등급 업데이트
	
}
