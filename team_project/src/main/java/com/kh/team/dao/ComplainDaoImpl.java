package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.ComplainVo;

@Repository
public class ComplainDaoImpl implements ComplainDao {
	private final String NAMESPACE="com.kh.team.mappers.complain.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertComplain() {
		int count = sqlSession.insert(NAMESPACE + "insertComplain");
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<ComplainVo> getComplainListById(String m_id) {
		List<ComplainVo> complainList = sqlSession.selectList(NAMESPACE + "getComplainListById", m_id);
		return complainList;
	}

}
