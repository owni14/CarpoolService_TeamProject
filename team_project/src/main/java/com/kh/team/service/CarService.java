package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.CarInfoVo;

public interface CarService {
	public String getCarCode(String ci_name); // 자동차 코드
	public boolean addCarByMember(String c_no, String c_code, String m_id); // 회원이 가지고 있는 자동차정보 등록
	public boolean increaseCount(String m_id); // 탑승할 경우 회원 차량에 대한 숫자 증가
	public void decreaseCount(String m_id); // 현재 차량의 탑승인원 감소
	public String getCarCodeByM_Id(String m_id); // 회원 이메일로 자동차 코드 얻기
	public void resetCount(String m_id); // 현재 차량의 탑승인원 초기화. 원래 1이었던 상태로 되돌린다.
}
