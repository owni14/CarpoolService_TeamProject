package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MylogDao;

@Service
public class MylogSeviceImpl implements MylogService {
	
	@Autowired
	private MylogDao mylogDao;

	@Override
	public List<Map<String, Object>> mylogListById(String m_id, int startRow, int endRow) {
		List<Map<String, Object>> mylogList = mylogDao.mylogListById(m_id, startRow, endRow);
		return mylogList;
	}
}
