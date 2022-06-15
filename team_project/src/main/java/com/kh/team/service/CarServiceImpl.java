package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.CarDao;
import com.kh.team.vo.CarInfoVo;

@Service
public class CarServiceImpl implements CarService{

	@Autowired
	private CarDao carDao;
	
	@Override
	public String getCarCode(String ci_name) {
		String c_code = carDao.getCarCodeByCi_Name(ci_name);
		return c_code;
	}

	@Override
	public boolean addCarByMember(String c_no, String c_code, String m_id) {
		boolean result = carDao.insertCar(c_no, c_code, m_id);
		return result;
	}

	@Override
	public boolean increaseCount(String m_id) {
		boolean result = carDao.increaseCount(m_id);
		return result;
	}

	@Override
	public void decreaseCount(String m_id) {
		carDao.decreaseCount(m_id);
	}

}
