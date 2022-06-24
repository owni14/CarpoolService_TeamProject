package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.PagingDto;

@Repository
public class NotifyDaoImpl implements NotifyDao{
	private final String NAMESPACE = "com.kh.team.mappers.notify.";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public boolean insertNotification(BlackListVo blackListVo) {
		int count = sqlSession.insert(NAMESPACE + "insertNotification", blackListVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<BlackListVo> notifyList() {
		List<BlackListVo> list = sqlSession.selectList(NAMESPACE + "notifyList");
		return list;
	}

	@Override
	public int notifyCount() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "notifyCount");
		return count;
	}

	@Override
	public int totalNotifyCount() {
		int totalCount = (int)sqlSession.selectOne(NAMESPACE + "totalNotifyCount");
		return totalCount;
	}

	@Override
	public List<BlackListVo> yNotifyList() {
		List<BlackListVo> yNotifyList = sqlSession.selectList(NAMESPACE + "yNotifyList");
		return yNotifyList;
	}

	@Override
	public List<BlackListVo> nNotifyList(PagingDto pagingDto) {
		List<BlackListVo> nNotifyList = sqlSession.selectList(NAMESPACE + "nNotifyList",pagingDto);
		return nNotifyList;
	}

	@Override
	public List<BlackListVo> dayNotifyList() {
		List<BlackListVo> dayNotifyList = sqlSession.selectList(NAMESPACE + "dayNotifyList");
		return dayNotifyList;
	}

	@Override
	public int dayNotifyCount() {
		int dayNotifyCount = (int)sqlSession.selectOne(NAMESPACE + "dayNotifyCount");
		return dayNotifyCount;
	}

	@Override
	public void modifyApprovement(BlackListVo blackListVo) {
		sqlSession.update(NAMESPACE + "modifyApprovement", blackListVo);
	}

	@Override
	public List<BlackListVo> cNotifyList() {
		List<BlackListVo> cNotifyList = sqlSession.selectList(NAMESPACE + "cNotifyList");
		return cNotifyList;
	}

	@Override
	public int cNotifyCount() {
		int cNotifyCount = (int)sqlSession.selectOne(NAMESPACE + "cNotifyCount");
		return cNotifyCount;
	}

	@Override
	public void updateBlackPoint(BlackListVo blackListVo) {
		sqlSession.update(NAMESPACE + "updateBlackPoint", blackListVo);
	}

	@Override
	public List<BlackListVo> getReportList(String m_id) {
		List<BlackListVo> reportList = sqlSession.selectList(NAMESPACE + "getReportList", m_id);
		return reportList;
	}

	@Override
	public List<BlackListVo> getReportedList(String m_id) {
		List<BlackListVo> reportedList = sqlSession.selectList(NAMESPACE + "getReportedList", m_id);
		return reportedList;
	}

	@Override
	public boolean insertBlockPeople(String m_id) {
		int count = sqlSession.insert(NAMESPACE + "insertBlockPeople", m_id);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isBlockPeople(String m_id) {
		int count = sqlSession.insert(NAMESPACE + "isBlockPeople", m_id);
		if (count > 0) {
			return true;
		}
		return false;
	}

}

