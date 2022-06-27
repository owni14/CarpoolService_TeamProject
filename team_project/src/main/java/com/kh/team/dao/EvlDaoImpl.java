package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Is_Update_PointVo;
import com.kh.team.vo.Passenger_EvlVo;
@Repository
public class EvlDaoImpl implements EvlDao{
@Autowired
private SqlSession sqlSession;

private final String NAMESPACE="com.kh.team.mappers.evl.";
	@Override
	public boolean insertDriverEvl(Driver_EvlVo driver_EvlVo) {
		int count=sqlSession.insert(NAMESPACE + "insertDriverEvl", driver_EvlVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertPassengerEvl(String m_id) {
		int count=sqlSession.insert(NAMESPACE + "insertPassengerEvl", m_id);
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
	@Override
		public int selectCountIsUpdate(String formattedToday, String iup_what) 
		{
		Map<String, Object> parameter=new HashMap<String, Object>();
		parameter.put("formattedToday",formattedToday);
		parameter.put("iup_what",iup_what);
			return sqlSession.selectOne(NAMESPACE+"selectCountIsUpdate",parameter );
		}
	@Override
		public boolean insertEvlUpdate(Is_Update_PointVo is_Update_PointVo) {
		int count=sqlSession.insert(NAMESPACE+"insertEvlUpdate",is_Update_PointVo);
		if(count >0) {
			return true;
		}
		return false; 
		}

	@Override
	public boolean updatePointPassengerByEvl() {
		int count=sqlSession.update(NAMESPACE+"updatePointPassengerByEvl");
		if(count >0) {
			return true;
		}
		return false;
	}

	@Override
	public int countvvipDriver() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countvvipDriver");
		return count;
	}

	@Override
	public int countvipDriver() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countvipDriver");
		return count;
	}

	@Override
	public int countgoldDriver() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countgoldDriver");
		return count;
	}

	@Override
	public int countsilverDriver() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countsilverDriver");
		return count;
	}

	@Override
	public int countwhiteDriver() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countwhiteDriver");
		return count;
	}

	@Override
	public int countvvipPassenger() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countvvipPassenger");
		return count;
	}

	@Override
	public int countvipPassenger() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countvipPassenger");
		return count;
	}

	@Override
	public int countgoldPassenger() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countgoldPassenger");
		return count;
	}

	@Override
	public int countsilverPassenger() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countsilverPassenger");
		return count;
	}

	@Override
	public int countwhitePassenger() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "countwhitePassenger");
		return count;
	}

	
}
