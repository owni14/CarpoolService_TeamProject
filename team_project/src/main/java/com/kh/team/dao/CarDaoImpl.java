package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.CarInfoVo;

@Repository
public class CarDaoImpl implements CarDao{

	private final String NAMESPACE = "com.kh.team.mappers.car.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertCarInfo(CarInfoVo carInfoVo) {
		sqlSession.insert(NAMESPACE + "insertCarInfo", carInfoVo);
	}
	
	@Override
	public String getCarCodeByCi_Name(String ci_name) {
		String ci_code = sqlSession.selectOne(NAMESPACE + "getCarCodeByCi_Name", ci_name);
		return ci_code;
	}

	@Override
	public boolean insertCar(String c_no, String c_code, String m_id) {
		Map<String, String> map = new HashMap<>();
		map.put("c_no", c_no);
		map.put("c_code", c_code);
		map.put("m_id", m_id);
		int count = sqlSession.insert(NAMESPACE + "insertCar", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void resetCount(String m_id) {
		sqlSession.update(NAMESPACE + "resetCount", m_id);
	}

	@Override
	public boolean increaseCount(String m_id) {
		int count = sqlSession.update(NAMESPACE + "increaseCount", m_id);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public String getMaxPeopleCountOfCar(String ci_code) {
		String count = sqlSession.selectOne(NAMESPACE + "getMaxPeopleCountOfCar", ci_code);
		return count;
	}

	@Override
	public String getCurrentCountOfCar(String m_id) {
		String count = sqlSession.selectOne(NAMESPACE + "getCurrentCountOfCar", m_id);
		return count;
	}

	@Override
	public String getCarCodeByM_Id(String m_id) {
		String ci_code = sqlSession.selectOne(NAMESPACE + "getCarCodeByM_Id", m_id);
		return ci_code;
	}

	@Override
	public void decreaseCount(String m_id) {
		sqlSession.update(NAMESPACE + "decreaseCount", m_id);
	}

}
