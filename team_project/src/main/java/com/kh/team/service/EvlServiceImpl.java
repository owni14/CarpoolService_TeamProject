package com.kh.team.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.EvlDao;
import com.kh.team.dao.MessageDao;
import com.kh.team.dao.PointDao;
import com.kh.team.util.CodeEnum;
import com.kh.team.vo.Driver_EvlVo;
import com.kh.team.vo.Is_Update_PointVo;
import com.kh.team.vo.MessageVo;
import com.kh.team.vo.Passenger_EvlVo;
import com.kh.team.vo.PointHistoryVo;
@Service
public class EvlServiceImpl implements EvlService{
@Autowired
private EvlDao evlDao;
@Autowired
private PointDao pointDao;
@Autowired
private MessageDao messageDao;
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
	@Transactional
	@Override
		public boolean transactionGivingSixPoint(Is_Update_PointVo is_Update_PointVo
			) {
		boolean isgive=evlDao.updatePointPassengerByEvl();//모든 승객 포인트 업데이트
		boolean isInsert=evlDao.insertEvlUpdate(is_Update_PointVo);
		
		System.out.println("서비스 실행중 isInsert "+isInsert);
		if(isgive && isInsert) {
			System.out.println("서비스 트랜잭션 완료 ");
			return true;
		}
		return false;
		}
	@Transactional
	@Override
		public void transactionPointHistoryNMessage(String m_id, String pc_code) {
	
		PointHistoryVo pointHistoryVo=new PointHistoryVo(0, m_id, pc_code);
		pointDao.insertPointHistory(pointHistoryVo);
		String admin_code=CodeEnum.CM.getCode();
		MessageVo messageVo= new MessageVo(m_id, null, null, admin_code, 
				"시스템 일괄지급 포인트 포인트를 확인해주세요");
		messageDao.insertNoBlackMessage(messageVo);
		System.out.println("서비스 실행중 메세지 히스토리 입력 성공");
		
		}

	@Override
	public List<Integer> countEvl() {
		int vvipDriver = evlDao.countvvipDriver();
		int vvipPassenger = evlDao.countvvipPassenger();
		int vipDriver = evlDao.countvipDriver();
		int vipPassenger = evlDao.countvipPassenger();
		int goldDriver = evlDao.countgoldDriver();
		int goldPassenger = evlDao.countgoldPassenger();
		int silverDriver = evlDao.countsilverDriver();
		int silverPassenger = evlDao.countsilverPassenger();
		int whiteDriver = evlDao.countwhiteDriver();
		int whitePassenger = evlDao.countwhitePassenger();
		List<Integer> list = new ArrayList<Integer>();
		list.add(vvipDriver);
		list.add(vipDriver);
		list.add(goldDriver);
		list.add(silverDriver);
		list.add(whiteDriver);
		list.add(vvipPassenger);
		list.add(vipPassenger);
		list.add(goldPassenger);
		list.add(silverPassenger);
		list.add(whitePassenger);
		return list;
	}
}
