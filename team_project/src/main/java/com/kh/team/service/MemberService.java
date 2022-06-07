package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

public interface MemberService {
	public void insertMember(MemberVo memberVo); // 회원 추가
	public MemberVo getMemberByIdAndPw(String userid, String userpw);

	public List<MemberVo> getMemberList(PagingDto pagingDto); // 멤버 리스트

}
