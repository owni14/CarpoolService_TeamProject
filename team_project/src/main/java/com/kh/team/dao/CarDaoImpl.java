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
	public String getCarCode(String ci_name) {
		String ci_code = sqlSession.selectOne(NAMESPACE + "getCarCode", ci_name);
		return ci_code;
	}

	@Override
	public void insertCar(String c_no, String c_code, String m_id) {
		Map<String, String> map = new HashMap<>();
		map.put("c_no", c_no);
		map.put("c_code", c_code);
		map.put("m_id", m_id);
		sqlSession.insert(NAMESPACE + "insertCar", map);
	}

}
