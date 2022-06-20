package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Passenger_EvlVo;
@Repository
public class EvlDaoImpl implements EvlDao{
@Autowired
private SqlSession sqlSession;

private final String NAMESPACE="com.kh.team.mappers.evl.";
	@Override
	public boolean insertDriverEvl(Driver_EvlVo driver_EvlVo) {
		int count=sqlSession.insert(NAMESPACE+"insertDriverEvl", driver_EvlVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertPassengerEvl(Passenger_EvlVo passenger_Evl) {
		int count=sqlSession.insert(NAMESPACE+"insertPassengerEvl", passenger_Evl);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<String> selectEvlCodeList() {
		return sqlSession.selectList(NAMESPACE+"selectEvlCodeList");
	}

	@Override
	public boolean updatePointByEvl() {
		int count=sqlSession.update(NAMESPACE+"updatePointByEvl");
		if(count>0) {
			System.out.println("EvlDaoImpl 유저 업데이트 결과 갯수"+count);
			return true;
		}
		return false;
	}

}
