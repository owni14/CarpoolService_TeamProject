package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.CarInfoVo;

public interface CarDao {
	public void insertCarInfo(CarInfoVo carInfoVo); // 자동차 정보 입력
	public String getCarCode(String ci_name); // 자동차 코드
	public void insertCar(String c_no, String c_code, String m_id); // 회원이 가지고 있는 자동차정보 등록
}
