package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.CarInfoVo;

public interface CarDao {
	public void insertCarInfo(CarInfoVo carInfoVo); // 자동차 정보 입력
	public String getCarCodeByCi_Name(String ci_name); // 차량 이름으로 자동차 코드 얻기
	public boolean insertCar(String c_no, String c_code, String m_id); // 회원이 가지고 있는 자동차정보 등록
	public void resetCount(String m_id); // 현재 차량의 탑승인원 초기화. 원래 1이었던 상태로 되돌린다.
	public boolean increaseCount(String m_id); // 현재 차량의 탑승인원 증가
	public String getMaxPeopleCountOfCar(String ci_code); // 차량의 최대 탑승인원
	public String getCurrentCountOfCar(String m_id); // 현재 차량의 탑승인원
	public String getCarCodeByM_Id(String m_id); // 회원 이메일로 자동차 코드 얻기
	public void decreaseCount(String m_id); // 현재 차량의 탑승인원 감소
	public void deleteCar(String m_id); //운전자 등록 취소할 경우 car 테이블 내용 삭제
}
