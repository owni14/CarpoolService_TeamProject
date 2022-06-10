package com.kh.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.CarDao;
import com.kh.team.vo.CarInfoVo;

@Service
public class CarServiceImpl implements CarService{

	@Autowired
	private CarDao carDao;
	
	@Override
	public void insertCarInfoInMemberInfo(String m_id, String c_code) {
		carDao.insertCarInfoInMemberInfo(m_id, c_code);
		
	}

	@Override
	public String getCarCode(String ci_name) {
		String c_code = carDao.getCarCode(ci_name);
		return c_code;
	}

}
