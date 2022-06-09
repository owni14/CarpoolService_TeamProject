package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.BlackListVo;

public interface NotifyDao {
	public void insertNotification(BlackListVo blackListVo); // 신고 회원 입력
	public List<BlackListVo> notifyList(); // 전체 신고 리스트 확인
	public List<BlackListVo> yNotifyList(); // 신고 처리 완료 리스트 확인
	public List<BlackListVo> nNotifyList(); // 신고 미처리 리스트 확인
	public List<BlackListVo> dayNotifyList(); // 10일이 지난 리스트
	public int notifyCount(); // 미처리 신고 갯수 확인
	public int totalNotifyCount(); // 전체 신고 갯수 확인
}
