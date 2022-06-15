package com.kh.team.dao;

import java.util.List;
import java.util.Map;

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
	public boolean insertComplain(ComplainVo complainVo) {
//		System.out.println("complainVo : " + complainVo);
		int count = sqlSession.insert(NAMESPACE + "insertComplain", complainVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Map<String, Object>> getFinishListById(String m_id) {
		List<Map<String, Object>> complainList = sqlSession.selectList(NAMESPACE + "getFinishListById", m_id);
		return complainList;
	}
	
	@Override
	public List<ComplainVo> getNotFinishListById(String m_id) {
		List<ComplainVo> complainList = sqlSession.selectList(NAMESPACE + "getNotFinishListById", m_id);
		return complainList;
	}

	@Override
	public List<ComplainVo> getAllNotFinishList(String admin_code) {
		return sqlSession.selectList(NAMESPACE+"getAllNotFinishList", admin_code);
	}

	@Override
	public int getNotFinishCount(String admin_code) {
		return sqlSession.selectOne(NAMESPACE+"getNotFinishCount",admin_code);
	}

	@Override
	public boolean updateComplain(ComplainVo complainVo) {
		int count =sqlSession.update(NAMESPACE+"updateComplain",complainVo);
		if (count > 0) {
			return true;
		}
		return false;
	
	}
	@Override
	public List<ComplainVo> getAllFinishList() {
		return sqlSession.selectList(NAMESPACE+"getAllFinishList");
	}

	@Override
	public List<ComplainVo> getAllNotFinishListNoCode() {
		return sqlSession.selectList(NAMESPACE+"getAllNotFinishListNoCode");
	}

	@Override
	public int getNotFinishCountNoCode() {
		return sqlSession.selectOne(NAMESPACE+"getNotFinishCountNoCode");
	}
}
