package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	private final String NAMESPACE = "com.kh.team.mappers.member.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVo memberVo) {
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
		
	}

	@Override
	public MemberVo getMemberByIdAndPw(String m_id, String m_pw) {
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("m_id", m_id);
		parameter.put("m_pw", m_pw);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMemberByIdAndPw", parameter);
		return memberVo;
	}

	@Override
	public List<MemberVo> admingetMemberList(PagingDto pagingDto) {
		List<MemberVo> memberList = sqlSession.selectList(NAMESPACE + "admingetMemberList", pagingDto);
		return memberList;
	}

	@Override
	public List<MemberVo> getMemberList() {
		List<MemberVo> memberList = sqlSession.selectList(NAMESPACE + "getMemberList");
		return memberList;
	}

	@Override
	public int adminGetCount(PagingDto pagingDto) {
		int count = (int)sqlSession.selectOne(NAMESPACE + "adminGetCount", pagingDto); 
		return count;
	}

	@Override
	public MemberVo getMemberById(String m_id) {
		MemberVo driverInfo = sqlSession.selectOne(NAMESPACE + "getMemberById", m_id);
//		System.out.println("driverInfo:" + driverInfo);
		return driverInfo;
	}

}
