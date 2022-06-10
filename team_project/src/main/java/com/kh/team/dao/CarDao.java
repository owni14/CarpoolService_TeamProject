package com.kh.team.dao;

import com.kh.team.vo.CarInfoVo;

public interface CarDao {
	public void insertCarInfo(CarInfoVo carInfoVo); // 자동차 정보 입력
	public String getCarCode(String ci_name); // 자동차 코드
	public void insertCarInfoInMemberInfo(String m_id, String c_code); // 회원에 대한 자동차정보 입력
}
