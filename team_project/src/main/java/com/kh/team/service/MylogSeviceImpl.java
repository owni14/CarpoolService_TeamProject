package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MylogDao;
import com.kh.team.vo.DriverVo;

@Service
public class MylogSeviceImpl implements MylogService {
	
	@Autowired
	private MylogDao mylogDao;

	@Override
	public List<Map<String, Object>> passengerlogListById(String m_id, int startRow, int endRow) {
		List<Map<String, Object>> passengerlogList = mylogDao.passengerlogListById(m_id, startRow, endRow);
		return passengerlogList;
	}

	@Override
	public List<DriverVo> driverlogListById(String m_id, int startRow, int endRow) {
		List<DriverVo> driverlogList = mylogDao.driverlogListById(m_id, startRow, endRow);
		return driverlogList;
	}
	
	@Override
	public List<Map<String, Object>> driver_passengerlogListById(String m_id) {
		List<Map<String, Object>> driver_passengerlogList = mylogDao.driver_passengerlogListById(m_id);
		return driver_passengerlogList;
	}
}
