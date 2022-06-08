package com.kh.team.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.PointCodeVo;
import com.kh.team.vo.PointHistoryVo;

@Repository
public class PointDaoImpl implements PointDao {
	private final String NAMESPACE = "com.kh.team.mappers.point.";

	@Autowired
	private SqlSession sqlSession;
	
	// 임의의 포인트 코드 입력
	@Override
	public void insertPointCode(PointCodeVo pointCodeVo) {
		sqlSession.insert(NAMESPACE + "insertPointCode", pointCodeVo);
		
	}

	@Override
	public void insertPointHistory(PointHistoryVo pointHistoryVo) {
		sqlSession.insert(NAMESPACE + "insertPointHistory", pointHistoryVo);
	}

	@Override
	public PointHistoryVo getPointHistoryById(String m_id) {
		PointHistoryVo pointHistoryVo = sqlSession.selectOne(NAMESPACE + "getPointHistoryById", m_id);
		return pointHistoryVo;
	}

	

}
