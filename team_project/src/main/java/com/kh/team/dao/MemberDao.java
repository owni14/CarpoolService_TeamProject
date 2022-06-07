package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.MemberVo;

public interface MemberDao {
	public void insertMember(MemberVo memberVo); // 회원 추가
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
}
