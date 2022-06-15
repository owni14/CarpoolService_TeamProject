package com.kh.team.dao;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.ComplainVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

public interface MemberDao {
	public void insertMember(MemberVo memberVo); // 회원 추가
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
	public List<Map<String, Object>> getDriverList(String m_company, PagingDto pagingDto); // 예약하기 페이지 - 운전자 리스트 가져오기 위한 메서드
	public List<MemberVo> admingetMemberList(PagingDto pagingDto); // 관리자 회원관리 페이지 pagination을 위한 query
	public MemberVo getMemberPointById(String m_id);
	public int adminGetCount(PagingDto pagingDto); // 관리자 회원관리 페이지 회원명 수 확인
	public Map<String, Object> getDriverById(String m_id, String m_company); // 예약하기 페이지 - 운전자 정보 가져오기 위한 메서드 
	public boolean insertDriverLicense(String m_id, String ad_license_img); // 운전자 등록
	public void adminupdateBlackScore(BlackListVo blackListVo); // 관리자 신고 회원 관리 블랙포인트 변경
	public boolean insertPassenger(String m_id, String boardLoct, String boardTime, String driver_seq); // 탑승자 정보 추가
	public String getMemberLocation(String m_id); // 회원 주소 얻어오기
	public String getDriverSeq(String m_id); // 운전자 번호 얻어오기
	public String getDriverId(String driver_seq); // 운전자 아이디 얻어오기
	public boolean adminUpdateMemberInfo(MemberVo memberVo); // 관리자 페이지에서 회원 정보 수정 수정할 정보 1.주소 2.번호 3.회원탈퇴 여부
	public List<MemberVo> getTop5EvlMembers (); // 관리자 페이지에서 평점 top5 회원 정보 가져오기 
	public boolean isApplication(String m_id); // 회원이 탑승하기를 두번 이상 했을경우 기존에 탑승하기가 되어 있는지 확인하기 위한 메서드
	public boolean deletePassenger(String m_id, String driver_seq); // 탑승객테이블의 is_deletion을 'Y'로 바꾸는 메서드
	public List<Map<String, Object>> adminNotApprovedDriver(); // 관리자 페이지에서 미승인 운전자 확인
	public int getTotalDriverCount(String m_company); // 각 회사별 운전자 수 확인
}
