package com.kh.team.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.DriverVo;
import com.kh.team.vo.MemberUpdateVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

public interface MemberService {
	public void insertMember(MemberVo memberVo); // 회원 추가
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
	public List<Map<String, Object>> getDriverList(String m_company, PagingDto pagingDto); // 예약하기 페이지 - 운전자 리스트 가져오기 위한 메서드
	public List<MemberVo> admingetMemberList(PagingDto pagingDto); // 멤버 리스트
	public int adminGetCount(PagingDto pagingDto); // 관리자 회원관리 페이지 회원명 수 확인
	public Map<String, Object> getDriverById(String m_id, String m_company); // 예약하기 페이지 - 운전자 정보 가져오기 위한 메서드
	public boolean submitDriverLicense(String m_id, String ad_license_img); // 운전자 등록
	public boolean addPassengerInfo(String m_id, String boardLoct, String boardTime, String driver_seq); // 탑승자 정보 추가
	public String getMemberLocation(String m_id); // 회원 주소 얻어오기
	public Map<String, String> getCount(String m_id); // 차량 최대 탑승인원 및 현재 탑승인원 얻어오기
	public String getDriverSeqFromPassenger(String m_id); // 운전자 번호 얻어오기 (회원이 탑승신청을 하였을 경우 신청상태를 '승인 대기'로 변경하기 위해)
	public String getDriverId(String driver_seq); // 운전자 아이디 얻어오기
	public boolean adminUpdateMemberInfo(MemberVo memberVo, MemberUpdateVo memberUpdateVo); // 관리자 페이지에서 회원 정보 수정 및 수정 테이블에 내용 기입
	public List<MemberVo> getTop5EvlMembers (); // 관리자 페이지에서 평점 top5 회원 정보 가져오기 
	public boolean isApplication(String m_id);// 탑승신청하기가 되어 있는지 여부
	public boolean deletePassenger(String m_id, String driver_seq); // 탑승객테이블의 is_deletion을 'Y'로 바꾸는 메서드
	public List<Map<String, Object>> adminNotApprovedDriver(); // 관리자 페이지에서 미승인 운전자 확인
	public void approveDriver(String m_id); // 관리자 페이지에서 미승인 운전자 승인
	public int getTotalDriverCount(String m_company); // 각 회사별 운전자 수 확인

	public int getCountByApplyDate(String str_date);//하루 확정 예약자수 찾기

	public List<Map<String, Object>> getPassengerList(String driver_seq, String m_company); // 탑승객 리스트 확인
	public String getDriverSeqFromDriver(String m_id); // 운전자 번호 확인
	public boolean approvePassenger(String m_id); // 탑승자 승인
	public boolean rejectPassenger(String m_id); // 탑승자 거절
	public String getApproveState(String m_id); // 탑승자의 현재 신청상태 확인
	public boolean addDriver(DriverVo driverVo); // 회원이 운전하기페이지에서 운전정보 등록
	public boolean isDriver(String m_id); // 운전하기에 등록이 되어있는지 여부 확인
	public boolean updateDriver(DriverVo driverVo); // 운전하기등록 수정
	public boolean deleteDriver(int driver_seq); // 운전하기에서 삭제
}
