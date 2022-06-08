package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.PointDao;
import com.kh.team.vo.PointHistoryVo;

@Service
public class PointServiceImpl implements PointService {
	
	@Autowired
	private PointDao pointDao;
	
	@Override
	public List<Map<String, Object>> getPointListById(String m_id) {
		List<Map<String, Object>> pointList = pointDao.getPointListById(m_id);
		return pointList;
	}

}
