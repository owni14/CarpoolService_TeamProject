package com.kh.team.dao;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.w3c.dom.ls.LSInput;

import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.ComplainVo;
import com.kh.team.vo.DriverVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	private final String NAMESPACE = "com.kh.team.mappers.member.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVo memberVo) {
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
		
	}

	@Override
	public MemberVo getMemberByIdAndPw(String m_id, String m_pw) {
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("m_id", m_id);
		parameter.put("m_pw", m_pw);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMemberByIdAndPw", parameter);
		return memberVo;
	}

	@Override
	public List<MemberVo> admingetMemberList(PagingDto pagingDto) {
		List<MemberVo> memberList = sqlSession.selectList(NAMESPACE + "admingetMemberList", pagingDto);
		return memberList;
	}

	@Override
	public List<Map<String, Object>> getDriverList(String m_company, PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_company", m_company);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		map.put("formattedToday", formattedToday);
		List<Map<String, Object>> list = sqlSession.selectList(NAMESPACE + "getDriverList", map);
		return list;
	}

	@Override
	public int adminGetCount(PagingDto pagingDto) {
		int count = (int)sqlSession.selectOne(NAMESPACE + "adminGetCount", pagingDto); 
		return count;
	}

	@Override
	public Map<String, Object> getDriverById(String m_id, String m_company, String ci_code) {
		Map<String, String> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("m_company", m_company);
		map.put("ci_code", ci_code);
		map.put("formattedToday", formattedToday);
		Map<String, Object> mapDriverInfo = sqlSession.selectOne(NAMESPACE + "getDriverById", map);
		return mapDriverInfo;
	}
	
	@Override
	public MemberVo getMemberPointById(String m_id) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMemberPointById");
		return memberVo;
	}

	// 운전자 등록을 위한 메서드
	@Override
	public boolean insertDriverLicense(String m_id, String ad_license_img) {
		Map<String, String> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("ad_license_img", ad_license_img);
		int result = sqlSession.insert(NAMESPACE + "insertDriverLicense", map);
		if (result > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void adminupdateBlackScore(BlackListVo blackListVo) {
		sqlSession.update(NAMESPACE + "adminupdateBlackScore", blackListVo);
		
	}

	// 탑승자 정보를 입력
	@Override
	public boolean insertPassenger(String m_id, String boardLoct, String boardTime, String driver_seq) {
		Map<String, String> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("boardLoct", boardLoct);
		map.put("boardTime", boardTime);
		map.put("driver_seq", driver_seq);
		int count = sqlSession.insert(NAMESPACE + "insertPassenger", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public String getMemberLocation(String m_id) {
		String memberLocation = sqlSession.selectOne(NAMESPACE + "getMemberLocation", m_id);
		return memberLocation;
	}

	@Override
	public String getDriverSeqFromPassenger(String m_id) {
		Map<String, String> map = new HashMap<>();
		
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("formattedToday", formattedToday);
//		System.out.println("MemberDaoImpl getDriverSeq, m_id:" + m_id);
		String driver_seq = sqlSession.selectOne(NAMESPACE + "getDriverSeqFromPassenger", map);
//		System.out.println("MemberDaoImpl getDriverSeq, driver_seq:" + driver_seq);
		return driver_seq;
	}

	@Override
	public String getDriverId(String driver_seq) {
		System.out.println("driver_seq:" + driver_seq);
		String driverId = sqlSession.selectOne(NAMESPACE + "getDriverId", driver_seq);
		return driverId;
	}

	@Override

	public boolean adminUpdateMemberInfo(MemberVo memberVo) {
		int count = sqlSession.update(NAMESPACE + "adminUpdateMemberInfo", memberVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<MemberVo> getTop5EvlMembers() {
		List<MemberVo> top5EvlMembersList = sqlSession.selectList(NAMESPACE + "getTop5EvlMembers");
		return top5EvlMembersList;
	}
	
	@Override
	public boolean isApplication(String m_id) {
		Map<String, String> map = new HashMap<>();
		
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("formattedToday", formattedToday);
		System.out.println(map);
//		System.out.println("MemberDaoImpl isApplication, m_id: " + m_id);
		int result = sqlSession.selectOne(NAMESPACE + "isApplication", map);
//		System.out.println("MemberDaoImpl isApplication, count:" + count);
		if (result > 0)	 {
			return true;
		}
		return false;
	}

	@Override
	public boolean deletePassenger(String m_id, String driver_seq) {
		Map<String, String> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("driver_seq", driver_seq);
		map.put("formattedToday", formattedToday);
		int count = sqlSession.update(NAMESPACE + "deletePassenger", map);
		if (count > 0) {
			return true;
		}
		return false;

	}

	@Override
	public List<Map<String, Object>> adminNotApprovedDriver() {
		List<Map<String, Object>> adminNotApprovedList = sqlSession.selectList(NAMESPACE + "adminNotApprovedDriver");
		return adminNotApprovedList;
	}

	@Override

	public void approveDriver(String m_id) {
		sqlSession.update(NAMESPACE + "approveDriver", m_id);
	}
	

	public int getTotalDriverCount(String m_company) {
		Map<String, Object> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_company", m_company);
		map.put("formattedToday", formattedToday);
		int count = sqlSession.selectOne(NAMESPACE + "getTotalDriverCount", map);
		return count;
	}

	@Override

	public int getCountByApplyDate(String str_date) {
		return sqlSession.selectOne(NAMESPACE+"getCountByApplyDate",str_date);
	}

	public List<Map<String, Object>> getPassengerList(String driver_seq, String m_company) {
		Map<String, Object> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("driver_seq", driver_seq);
		map.put("m_company", m_company);
		map.put("formattedToday", formattedToday);
		List<Map<String, Object>> passengerList = sqlSession.selectList(NAMESPACE + "getPassengerList", map);
		return passengerList;
	}

	@Override
	public String getDriverSeqFromDriver(String m_id) {
		Map<String, String> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("formattedToday", formattedToday);
		map.put("m_id", m_id);
		String driver_seq = sqlSession.selectOne(NAMESPACE + "getDriverSeqFromDriver", map);
		return driver_seq;
	}


	@Override
	public boolean approvePassenger(String m_id) {
		Map<String, String> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("formattedToday", formattedToday);
		int count = sqlSession.update(NAMESPACE + "approvePassenger", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean rejectPassenger(String m_id) {
		Map<String, String> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("formattedToday", formattedToday);
		int count = sqlSession.update(NAMESPACE + "rejectPassenger", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

	// 로그인된 회원의 파라미터를 받아, 오늘날짜와 함께 map에 담아 신청되어있는 운전자가 승인했는지 여부를 확인
	@Override
	public String getApproveState(String m_id) {
		Map<String, String> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("formattedToday", formattedToday);
		String approveState = sqlSession.selectOne(NAMESPACE + "getApproveState", map);
		return approveState;
	}

	@Override
	public boolean changeDeletionState(String m_id, String boardLoct, String boardTime, String driver_seq) {
		Map<String, String> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("formattedToday", formattedToday);
		map.put("boardLoct", boardLoct);
		map.put("boardTime", boardTime);
		map.put("driver_seq", driver_seq);
		int count = sqlSession.update(NAMESPACE + "changeDeletionState", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isClick(String m_id) {
		Map<String, String> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("formattedToday", formattedToday);
		String result = sqlSession.selectOne(NAMESPACE + "isClick", map);
		System.out.println("is_click:" + result);
		if (result.equals("Y")) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertDriver(DriverVo driverVo) {
		System.out.println("MemberDaoImpl insertDriver, driverVo:" + driverVo);
		int count = sqlSession.insert(NAMESPACE + "insertDriver", driverVo);
		System.out.println("MemberDaoImpl insertDriver, count:" + count);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isDriver(String m_id) {
		Map<String, String> map = new HashMap<>();
		String formattedToday = todayDate();
		map.put("m_id", m_id);
		map.put("formattedToday", formattedToday);
		int count = sqlSession.selectOne(NAMESPACE + "isDriver", map);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateDriver(DriverVo driverVo) {
		int count = sqlSession.update(NAMESPACE + "updateDriver", driverVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteDriver(int driver_seq) {
		int count = sqlSession.delete(NAMESPACE + "deleteDriver", driver_seq);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public DriverVo getDriverInfo(int driver_seq) {
		DriverVo driverVo = sqlSession.selectOne(NAMESPACE + "getDriverInfo", driver_seq);
		return driverVo;
	}
	
	@Override
	public List<MemberVo> selectM_idList() {
		return sqlSession.selectList(NAMESPACE+"selectM_idList");
	}
	@Override
	public int selectApproveCount() {
		return sqlSession.selectOne(NAMESPACE+"selectApproveCount");
	}
	
	// 오늘 날짜를 얻어오는 메서드
	private String todayDate() {
		// 오늘 날짜를 얻어와서 db에 오늘 날짜에 탑승신청하기가 된 아이디를 찾아 is_approve를 'Y'로 업데이트
		LocalDate today = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String formattedToday = today.format(formatter);
		return formattedToday;
	}

	@Override
	public String getMemberId(MemberVo memberVo) {
		String m_id = sqlSession.selectOne(NAMESPACE + "getMemberId", memberVo);
		return m_id;
	}

	@Override
	public String getMemberPw(MemberVo memberVo) {
		String m_pw = sqlSession.selectOne(NAMESPACE + "getMemberPw", memberVo);
		return m_pw;
	}

	@Override
	public boolean isApproveDriver(String m_id) {
		String approveState = sqlSession.selectOne(NAMESPACE + "isApproveDriver", m_id);
		if (approveState.equals("Y")) {
			return true;
		}
		return false;
	}

	@Override
	public List<String> getDeletingPassengerList(int driver_seq) {
		System.out.println("driver_seq:" + driver_seq);
		List<String> list = sqlSession.selectList(NAMESPACE + "getDeletingPassengerList", driver_seq);
		System.out.println("daoimpl" + list);
		return list;
	}

}