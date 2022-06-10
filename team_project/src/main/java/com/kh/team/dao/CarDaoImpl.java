package com.kh.team.dao;

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
	public void insertCarInfoInMemberInfo(String m_id, String c_code) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getCarCode(String ci_name) {
		String ci_code = sqlSession.selectOne(NAMESPACE + "getCarCode", ci_name);
		return ci_code;
	}

}
