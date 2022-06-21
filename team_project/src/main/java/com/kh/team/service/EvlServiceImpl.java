package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.EvlDao;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Is_Update_PointVo;
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
	@Override
		public int selectCountIsUpdate(String formattedToday, String iup_what) {
			return evlDao.selectCountIsUpdate(formattedToday, iup_what);
		}
	@Override
		public boolean insertEvlUpdate(Is_Update_PointVo is_Update_PointVo) {
			return evlDao.insertEvlUpdate(is_Update_PointVo);
		}
	
	@Transactional
	@Override
		public boolean transactionGivingPoint(Is_Update_PointVo is_Update_PointVo) {
		boolean isgive=evlDao.updatePointByEvl();//모든 포인트 업데이트
		boolean isInsert=evlDao.insertEvlUpdate(is_Update_PointVo);
		System.out.println("서비스 실행중 isInsert "+isInsert);
		if(isgive && isInsert) {
			return true;
		}
		return false;
		}
	
	@Override
		public boolean transactionGivingSixPoint(Is_Update_PointVo is_Update_PointVo) {
		boolean isgive=evlDao.updatePointPassengerByEvl();//모든 승객 포인트 업데이트
		boolean isInsert=evlDao.insertEvlUpdate(is_Update_PointVo);
		System.out.println("서비스 실행중 isInsert "+isInsert);
		if(isgive && isInsert) {
			System.out.println("서비스 트랜잭션 완료 ");
			return true;
		}
		return false;
		}
}
