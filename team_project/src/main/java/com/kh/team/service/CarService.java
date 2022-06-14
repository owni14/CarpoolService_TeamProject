package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.CarInfoVo;

public interface CarService {
	public String getCarCode(String ci_name); // 자동차 코드
	public boolean addCarByMember(String c_no, String c_code, String m_id); // 회원이 가지고 있는 자동차정보 등록
	public boolean increaseCount(String m_id); // 탑승할 경우 회원 차량에 대한 숫자 증가
}
