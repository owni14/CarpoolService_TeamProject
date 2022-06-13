package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.MessageVo;

public interface MessageDao {
	public boolean insertMessage(MessageVo messageVo); // 쪽지 추가 sequence 사용하므로 새로 만들지 말고 모두 해당 method 사용해 주세요
	public List<Integer> adminCheckSendedMessage();
}
