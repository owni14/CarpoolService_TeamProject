package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.BlackListVo;

@Repository
public class NotifyDaoImpl implements NotifyDao{
	private final String NAMESPACE = "com.kh.team.mappers.notify.";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertNotification(BlackListVo blackListVo) {
		sqlSession.insert(NAMESPACE + "insertNotification", blackListVo);
	}

	@Override
	public List<BlackListVo> notifyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int notifyCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int totalNotifyCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
