package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.BlackListVo;

public interface NotifyDao {
	public void insertNotification(BlackListVo blackListVo); // 신고 회원 입력
	public List<BlackListVo> notifyList();
	public int notifyCount(); // 미처리 신고 갯수 확인
	public int totalNotifyCount(); // 전체 신고 갯수 확인
}
