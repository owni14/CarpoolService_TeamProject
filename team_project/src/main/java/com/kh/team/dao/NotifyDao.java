package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.PagingDto;

public interface NotifyDao {
	public boolean insertNotification(BlackListVo blackListVo); // 신고 회원 입력
	public List<BlackListVo> notifyList(); // 전체 신고 리스트 확인
	public List<BlackListVo> yNotifyList(); // 신고 처리 완료 리스트 확인
	public List<BlackListVo> nNotifyList(PagingDto pagingDto); // 신고 미처리 리스트 확인
	public List<BlackListVo> dayNotifyList(); // 10일이 지난 미처리 리스트
	public List<BlackListVo> cNotifyList(); // 반려 리스트 확인
	public int dayNotifyCount(); // 10일 지난 미처리 리스트 갯수 확인
	public int notifyCount(); // 미처리 신고 갯수 확인
	public int cNotifyCount(); // 반려 신고 갯수 확인
	public int totalNotifyCount(); // 전체 신고 갯수 확인
	public void modifyApprovement(BlackListVo blackListVo); // 미승인 리스트 승인으로 바꾸기
	public void updateBlackPoint(BlackListVo blackListVo); // blackList 테이블 벌점 수정하기
	public List<BlackListVo> getReportList(String m_id);
	public List<BlackListVo> getReportedList(String m_id);
}
