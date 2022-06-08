package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

public interface MemberDao {
	public void insertMember(MemberVo memberVo); // 회원 추가
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
	public List<MemberVo> getMemberList();
	public List<MemberVo> admingetMemberList(PagingDto pagingDto); // 관리자 회원관리 페이지 pagination을 위한 query
	public MemberVo getMemberPointById(String m_id);
	public int adminGetCount(PagingDto pagingDto); // 관리자 회원관리 페이지 회원명 수 확인
}
