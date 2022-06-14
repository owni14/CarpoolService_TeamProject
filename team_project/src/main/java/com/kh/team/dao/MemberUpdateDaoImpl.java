package com.kh.team.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.AdminVo;
import com.kh.team.vo.MemberUpdateVo;

@Repository
public class MemberUpdateDaoImpl implements MemberUpdateDao{
	private final String NAMESPACE="com.kh.team.mappers.memberUpdate.";
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public boolean insertMemberUpdate(MemberUpdateVo memberUpdateVo) {
		int count = sqlSession.insert(NAMESPACE + "insertMemberUpdate", memberUpdateVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	@Override
	public List<MemberUpdateVo> memberUpdateList() {
		List<MemberUpdateVo> memberUpdateList = sqlSession.selectList(NAMESPACE + "memberUpdateList");
		return memberUpdateList;
	}
	
}
