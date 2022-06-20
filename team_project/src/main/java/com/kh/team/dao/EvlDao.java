package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Is_Update_PointVo;
import com.kh.team.vo.Passenger_EvlVo;

public interface EvlDao {
	public boolean insertDriverEvl(Driver_EvlVo driver_EvlVo);
	public boolean insertPassengerEvl(Passenger_EvlVo passenger_Evl);
	public List<String> selectEvlCodeList();
	public boolean updatePointByEvl();
	
	public int selectCountIsUpdate(String formattedToday, String iup_what);// 포인트 업데이트 유무
	public boolean insertEvlUpdate(Is_Update_PointVo is_Update_PointVo);
	
}
