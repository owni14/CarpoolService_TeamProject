package com.kh.team.service;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

public interface MemberService {
	public void insertMember(MemberVo memberVo); // 회원 추가
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
	public List<Map<String, Object>> getDriverList(String m_company); // 예약하기 페이지 - 운전자 리스트 가져오기 위한 메서드
	public List<MemberVo> admingetMemberList(PagingDto pagingDto); // 멤버 리스트
	public int adminGetCount(PagingDto pagingDto); // 관리자 회원관리 페이지 회원명 수 확인
	public Map<String, Object> getDriverById(String m_id, String m_company); // 예약하기 페이지 - 운전자 정보 가져오기 위한 메서드
	public boolean submitDriverLicense(String m_id, String ad_license_img); // 운전자 등록
	public boolean addPassengerInfo(String m_id, String boardLoct, String boardTime, String driver_seq); // 탑승자 정보 추가
	public String getMemberLocation(String m_id); // 회원 주소 얻어오기
	public Map<String, String> getCount(String m_id); // 차량 최대 탑승인원 및 현재 탑승인원 얻어오기
	public String getDriverSeq(String m_id); // 운전자 번호 얻어오기 (회원이 탑승신청을 하였을 경우 신청상태를 '승인 대기'로 변경하기 위해)
	public String getDriverId(String driver_seq); // 운전자 아이디 얻어오기
	public boolean isApplication(String m_id);// 탑승신청하기가 되어 있는지 여부
	public boolean deletePassenger(String m_id, String driver_seq); // 탑승객테이블의 is_deletion을 'Y'로 바꾸는 메서드
}
