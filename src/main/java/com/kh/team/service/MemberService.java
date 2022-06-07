package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.MemberVo;

public interface MemberService {
	public void insertMember(MemberVo memberVo); // 회원 추가
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
}
