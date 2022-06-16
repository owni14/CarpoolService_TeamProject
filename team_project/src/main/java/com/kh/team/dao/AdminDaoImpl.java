package com.kh.team.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.AdminVo;

@Repository
public class AdminDaoImpl implements AdminDao{
	private final String NAMESPACE="com.kh.team.mappers.admin.";
	@Autowired
	SqlSession sqlSession;
	@Override
	public boolean checkAdminId(AdminVo adminVo) {
		int count = (int)sqlSession.selectOne(NAMESPACE + "checkAdminId",adminVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	@Override
	public List<String> getAllAdminCode() {
		return sqlSession.selectList(NAMESPACE+"getAllAdminCode");
	}
}
