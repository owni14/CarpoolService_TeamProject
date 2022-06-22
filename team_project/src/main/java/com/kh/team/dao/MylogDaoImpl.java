package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.DriverVo;
import com.kh.team.vo.PassengerVo;

@Repository
public class MylogDaoImpl implements MylogDao {
	
	private final String NAMESPACE = "com.kh.team.mappers.mylog.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertPassenger(PassengerVo passengerVo) {
		sqlSession.insert(NAMESPACE + "insertPassenger", passengerVo);
	}

	@Override
	public List<Map<String, Object>> passengerlogListById(String m_id, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("startRow", String.valueOf(startRow));
		map.put("endRow", String.valueOf(endRow));
		List<Map<String, Object>> passengerlogList = sqlSession.selectList(NAMESPACE + "passengerlogListById", map);
		return passengerlogList;
	}

	@Override
	public List<PassengerVo> driver_passengerlogListBySeq(int driver_seq) {
		List<PassengerVo> driver_passengerlogList = sqlSession.selectList(NAMESPACE + "driver_passengerlogListBySeq", driver_seq);
		return driver_passengerlogList;
	}
	
	@Override
	public List<DriverVo> driverlogListById(String m_id, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("startRow", String.valueOf(startRow));
		map.put("endRow", String.valueOf(endRow));
		List<DriverVo> driverlogList = sqlSession.selectList(NAMESPACE + "driverlogListById", map);
		return driverlogList;
	}

	@Override
	public boolean putStar(String m_id, int rating) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("m_id", m_id);
		parameter.put("rating", rating);
		int count = sqlSession.update(NAMESPACE + "putStar", parameter);
		if (count > 0) {
			return true;
		}
		return false;
	}


}
