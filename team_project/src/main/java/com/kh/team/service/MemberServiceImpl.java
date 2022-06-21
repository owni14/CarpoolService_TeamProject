package com.kh.team.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.CarDao;
import com.kh.team.dao.MemberDao;
import com.kh.team.dao.MemberUpdateDao;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.DriverVo;
import com.kh.team.vo.MemberUpdateVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CarDao carDao;
	@Autowired
	private MemberUpdateDao memberUpdateDao;

	@Override
	public void insertMember(MemberVo memberVo) {
		memberDao.insertMember(memberVo);
	}

	@Override
	public MemberVo getMemberByIdAndPw(String userid, String userpw) {
		MemberVo memberVo = memberDao.getMemberByIdAndPw(userid, userpw);
		return memberVo;
	}

	@Override
	public List<MemberVo> admingetMemberList(PagingDto pagingDto) {
		List<MemberVo> memberList = memberDao.admingetMemberList(pagingDto);
		return memberList;
	}

	@Override
	public List<Map<String, Object>> getDriverList(String m_company, PagingDto pagingDto) {
		List<Map<String, Object>> driverList = memberDao.getDriverList(m_company, pagingDto);
		return driverList;
	}

	@Override
	public int adminGetCount(PagingDto pagingDto) {
		int count = memberDao.adminGetCount(pagingDto);
		return count;
	}

	@Override
	public Map<String, Object> getDriverById(String m_id, String m_company) {
		Map<String, Object> mapDriverInfo = memberDao.getDriverById(m_id, m_company);
		return mapDriverInfo;
	}

	// 운전자 등록하기 위한 메서드
	@Override
	public boolean submitDriverLicense(String m_id, String ad_license_img) {
		boolean result = memberDao.insertDriverLicense(m_id, ad_license_img);
		return result;
	}

	@Override
	@Transactional
	public boolean addPassengerInfo(String m_id, String boardLoct, String boardTime, String driver_seq) {
		boolean result = memberDao.isApplication(m_id); // 현재 탑승신청을 한번이라도 했는지 여부 확인
		System.out.println("MemberServiceImpl addPassengerInfo, result: ");
		if (result) {
			result = memberDao.changeDeletionState(m_id, boardLoct, boardTime, driver_seq); // 한번이라도 탑승 신청을 했다면 따로 데이터를 삽입하는게 아니라 is_deletion을 'N'으로 변경
		} else {
			result = memberDao.insertPassenger(m_id, boardLoct, boardTime, driver_seq); // 탑승 신청을 한적이 없으면 새로운 데이터를 삽입
		}
		return result;
	}

	@Override
	public String getMemberLocation(String m_id) {
		String memberLocation = memberDao.getMemberLocation(m_id);
		return memberLocation;
	}

	@Override
	@Transactional
	public Map<String, String> getCount(String m_id) {
		String ci_code = carDao.getCarCodeByM_Id(m_id);
		String maxCount = carDao.getMaxPeopleCountOfCar(ci_code);
		String currentCount = carDao.getCurrentCountOfCar(m_id);
		String driver_seq = memberDao.getDriverSeqFromPassenger(m_id);
		Map<String, String> map = new HashMap<>();
		map.put("maxCount", maxCount);
		map.put("currentCount", currentCount);
		return map;
	}

	@Override
	public String getDriverSeqFromPassenger(String m_id) {
		String driver_seq = memberDao.getDriverSeqFromPassenger(m_id);
		return driver_seq;
	}

	@Override
	public String getDriverId(String driver_seq) {
		String driverId = memberDao.getDriverId(driver_seq);
		return driverId;
	}

	@Override

	@Transactional
	public boolean adminUpdateMemberInfo(MemberVo memberVo, MemberUpdateVo memberUpdateVo) {
		boolean result = false;
		boolean result1 = memberDao.adminUpdateMemberInfo(memberVo);
		boolean result2 = memberUpdateDao.insertMemberUpdate(memberUpdateVo);
		if (result1 == true && result2 == true) {
			result = true;
		}
		return result;
	}

	@Override
	public List<MemberVo> getTop5EvlMembers() {
		List<MemberVo> top5List = memberDao.getTop5EvlMembers();
		return top5List;
	}



	public boolean isApplication(String m_id) {
		boolean result = memberDao.isApplication(m_id);
		if (result) {
			result = memberDao.isClick(m_id);
			return result;
		}
		return result;
	}

	@Override
	public boolean deletePassenger(String m_id, String driver_seq) {
		boolean result = memberDao.deletePassenger(m_id, driver_seq);
		return result;
	}

	@Override
	public List<Map<String, Object>> adminNotApprovedDriver() {
		List<Map<String, Object>> list = memberDao.adminNotApprovedDriver();
		return list;
	}

	@Override
	public void approveDriver(String m_id) {
		memberDao.approveDriver(m_id);
	}

	public int getTotalDriverCount(String m_company) {
		int count = memberDao.getTotalDriverCount(m_company);
		return count;

	}

	@Override

	public int getCountByApplyDate(String str_date) {
		return memberDao.getCountByApplyDate(str_date);
	}

	public List<Map<String, Object>> getPassengerList(String driver_seq, String m_company) {
		List<Map<String, Object>> passengerList = memberDao.getPassengerList(driver_seq, m_company);
		return passengerList;
	}

	@Override
	public String getDriverSeqFromDriver(String m_id) {
		String driver_seq = memberDao.getDriverSeqFromDriver(m_id);
		return driver_seq;
	}

	@Override
	public boolean approvePassenger(String m_id) {
		boolean result = memberDao.approvePassenger(m_id);
		return result;
	}

	@Override
	public boolean rejectPassenger(String m_id) {
		boolean result = memberDao.rejectPassenger(m_id);
		return result;
	}

	@Override
	public String getApproveState(String m_id) {
		String approveState = memberDao.getApproveState(m_id);
		return approveState;
	}

	@Override
	public boolean addDriver(DriverVo driverVo) {
		boolean result = memberDao.insertDriver(driverVo);
		return result;
	}

	@Override
	public boolean isDriver(String m_id) {
		boolean result = memberDao.isDriver(m_id);
		return result;
	}

	@Override
	public boolean updateDriver(DriverVo driverVo) {
		boolean result = memberDao.updateDriver(driverVo);
		return result;
	}

	@Override
	public boolean deleteDriver(int driver_seq) {
		boolean result = memberDao.deleteDriver(driver_seq);
		return result;
	}

	@Override
	public DriverVo getDriverInfo(int driver_seq) {
		DriverVo driverVo = memberDao.getDriverInfo(driver_seq);
		return driverVo;
	}
	@Override
	public List<MemberVo> selectM_idList() {
		return memberDao.selectM_idList();
	}

	@Override
	public String getMemberId(MemberVo memberVo) {
		String m_id = memberDao.getMemberId(memberVo);
		return m_id;
	}

	@Override
	public String getMemberPw(MemberVo memberVo) {
		String m_pw = memberDao.getMemberPw(memberVo);
		return m_pw;
	}
}