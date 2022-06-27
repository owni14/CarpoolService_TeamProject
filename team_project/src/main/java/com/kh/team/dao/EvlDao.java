package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Is_Update_PointVo;
import com.kh.team.vo.Passenger_EvlVo;

public interface EvlDao {
	public boolean insertDriverEvl(Driver_EvlVo driver_EvlVo);
	public boolean insertPassengerEvl(Passenger_EvlVo passenger_Evl);
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
	
	
}
