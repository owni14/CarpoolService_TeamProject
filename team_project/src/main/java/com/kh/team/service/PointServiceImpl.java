package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.PointDao;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointHistoryVo;

@Service
public class PointServiceImpl implements PointService {
	
	@Autowired
	private PointDao pointDao;
	
	@Override
	public List<Map<String, Object>> getPointListById(String m_id, int startRow, int endRow) {
		List<Map<String, Object>> pointList = pointDao.getPointListById(m_id, startRow, endRow);
		return pointList;
	}

	@Override
	public int getCountPointById(String m_id) {
		int count = pointDao.getCountPointById(m_id);
		return count;
	}

	@Override
	public boolean paymet(String m_id, int m_point) {
		return pointDao.paymet(m_id, m_point);
	}

	@Override
	public void insertPointHistory(PointHistoryVo pointHistoryVo) {
		pointDao.insertPointHistory(pointHistoryVo);
		
	}

}
