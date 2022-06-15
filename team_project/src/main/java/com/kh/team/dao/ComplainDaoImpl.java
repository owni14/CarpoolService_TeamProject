package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.ComplainVo;
import com.kh.team.vo.PagingDto;

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
	public List<ComplainVo> getAllNotFinishList(String admin_code,PagingDto pagingDto) {
		Map<String, Object> parameter =new HashMap<String, Object>();
		parameter.put("admin_code", admin_code);
		parameter.put("pagingDto", pagingDto);
		return sqlSession.selectList(NAMESPACE+"getAllNotFinishList", parameter);
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
	public List<ComplainVo> getAllFinishList(PagingDto pagingDto) {
		return sqlSession.selectList(NAMESPACE+"getAllFinishList",pagingDto);
	}

	@Override
	public List<ComplainVo> getAllNotFinishListNoCode(PagingDto pagingDto) {
		return sqlSession.selectList(NAMESPACE+"getAllNotFinishListNoCode",pagingDto);
	}

	@Override
	public int getNotFinishCountNoCode() {
		return sqlSession.selectOne(NAMESPACE+"getNotFinishCountNoCode");
	}
	
	@Override
	public List<ComplainVo> getAllFinishListByCode(String admin_code,PagingDto pagingDto) {
		Map<String, Object> parameter =new HashMap<String, Object>();
		parameter.put("admin_code", admin_code);
		parameter.put("pagingDto", pagingDto);
		return sqlSession.selectList(NAMESPACE+"getAllFinishListByCode",parameter);
	}
}
