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
		String c_code = carDao.getCarCode(ci_name);
		return c_code;
	}

	@Override
	public void addCarByMember(String c_no, String c_code, String m_id) {
		carDao.insertCar(c_no, c_code, m_id);
	}

}
