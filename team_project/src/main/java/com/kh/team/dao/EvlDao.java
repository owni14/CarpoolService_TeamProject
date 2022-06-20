package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Passenger_EvlVo;

public interface EvlDao {
	public boolean insertDriverEvl(Driver_EvlVo driver_EvlVo);
	public boolean insertPassengerEvl(Passenger_EvlVo passenger_Evl);
	public List<String> selectEvlCodeList();
	public boolean updatePointByEvl();
}
