package com.kh.team.service;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Is_Update_PointVo;
import com.kh.team.vo.Passenger_EvlVo;

public interface EvlService {
	public boolean insertDriverEvl(Driver_EvlVo driver_EvlVo);
	public boolean insertPassengerEvl(Passenger_EvlVo passenger_Evl);
	public List<String> selectEvlCodeList();
	public boolean updatePointByEvl();
	public int selectCountIsUpdate(String formattedToday, String iup_what);// 포인트 업데이트 유무
	public boolean insertEvlUpdate(Is_Update_PointVo is_Update_PointVo);
	public boolean transactionGivingPoint(Is_Update_PointVo is_Update_PointVo);
	public boolean transactionGivingSixPoint(Is_Update_PointVo is_Update_PointVo);//6달후 포인트 지급 트랜잭션
	//메세지 포인트 내역추가 트랜잭션
	public void transactionPointHistoryNMessage(String m_id,String pc_code);
	
	public List<Integer> countEvl(); // 운전자, 동승자 등급에 따른 인원수 가져오기 
}
