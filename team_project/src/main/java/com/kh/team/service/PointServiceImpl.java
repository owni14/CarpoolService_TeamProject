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
	public List<Map<String, Object>> getPointListById(String m_id, PagingDto pagingDto) {
		List<Map<String, Object>> pointList = pointDao.getPointListById(m_id, pagingDto);
		return pointList;
	}

	@Override
	public int getCountPointById(PagingDto pagingDto) {
		int count = pointDao.getCountPointById(pagingDto);
		return count;
	}

}
