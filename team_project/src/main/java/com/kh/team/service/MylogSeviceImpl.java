package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MylogDao;
import com.kh.team.vo.DriverVo;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.PassengerVo;
import com.kh.team.vo.Passenger_EvlVo;

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
	public List<PassengerVo> driver_passengerlogListBySeq(int driver_seq) {
		List<PassengerVo> driver_passengerlogList = mylogDao.driver_passengerlogListBySeq(driver_seq);
		return driver_passengerlogList;
	}

	@Override
	public boolean putStar(String driver_m_id, int rating) {
		boolean result = mylogDao.putStar(driver_m_id, rating);
		return result;
	}

	@Override
	public boolean evl_finish(String m_id, int driver_seq) {
		boolean result = mylogDao.evl_finish(m_id, driver_seq);
		return result;
	}

	@Override
	public Driver_EvlVo driver_evlListById(String m_id) {
		return mylogDao.driver_evlListById(m_id);
	}

	@Override
	public Passenger_EvlVo passenger_evlListById(String m_id) {
		return mylogDao.passenger_evlListById(m_id);
	}

	@Override
	public Map<String, Object> nextPoint(String m_id) {
		return mylogDao.nextPoint(m_id);
	}

	@Override
	public boolean isDriver(String m_id) {
		return mylogDao.isDriver(m_id);
	}

}