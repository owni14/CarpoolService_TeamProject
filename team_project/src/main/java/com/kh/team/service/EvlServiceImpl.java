package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.EvlDao;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Passenger_EvlVo;
@Service
public class EvlServiceImpl implements EvlService{
@Autowired
private EvlDao evlDao;
	@Override
	public boolean insertDriverEvl(Driver_EvlVo driver_EvlVo) {
		return evlDao.insertDriverEvl(driver_EvlVo);
	}

	@Override
	public boolean insertPassengerEvl(Passenger_EvlVo passenger_Evl) {
		return evlDao.insertPassengerEvl(passenger_Evl);
	}

	@Override
	public List<String> selectEvlCodeList() {
		return evlDao.selectEvlCodeList();
	}

	@Override
		public boolean updatePointByEvl() {
			return evlDao.updatePointByEvl();
		}
}
