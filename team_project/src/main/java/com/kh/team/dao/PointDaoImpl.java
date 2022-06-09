package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.PagingDto;
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
	public List<PointHistoryVo> getPointHistoryById(String m_id) {
		List<PointHistoryVo> pointHistoryList = sqlSession.selectList(NAMESPACE + "getPointHistoryById", m_id);
		return pointHistoryList;
	}

	@Override
	public List<Map<String, Object>> getPointListById(String m_id, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		System.out.println("startRow" + startRow);
		System.out.println("endRow" + endRow);
		map.put("m_id", m_id);
		map.put("startRow", String.valueOf(startRow));
		map.put("endRow", String.valueOf(endRow));
		System.out.println("map : " + map);
		List<Map<String, Object>> pointList = sqlSession.selectList(NAMESPACE + "getPointListById",map);
		return pointList;
	}

	@Override
	public int getCountPointById(String m_id) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountPointById", m_id);
		return count;
	}

	

}
