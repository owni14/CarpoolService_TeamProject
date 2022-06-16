package com.kh.team.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.w3c.dom.ls.LSInput;

import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.ComplainVo;
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
		map.put("m_company", m_company);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		List<Map<String, Object>> list = sqlSession.selectList(NAMESPACE + "getDriverList", map);
		return list;
	}

	@Override
	public int adminGetCount(PagingDto pagingDto) {
		int count = (int)sqlSession.selectOne(NAMESPACE + "adminGetCount", pagingDto); 
		return count;
	}

	@Override
	public Map<String, Object> getDriverById(String m_id, String m_company) {
		Map<String, String> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("m_company", m_company);
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
	public String getDriverSeq(String m_id) {
//		System.out.println("MemberDaoImpl getDriverSeq, m_id:" + m_id);
		String driver_seq = sqlSession.selectOne(NAMESPACE + "getDriverSeq", m_id);
//		System.out.println("MemberDaoImpl getDriverSeq, driver_seq:" + driver_seq);
		return driver_seq;
	}

	@Override
	public String getDriverId(String driver_seq) {
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
	public boolean isApplication(String m_id) {
//		System.out.println("MemberDaoImpl isApplication, m_id: " + m_id);
		int count = sqlSession.selectOne(NAMESPACE + "isApplication", m_id);
//		System.out.println("MemberDaoImpl isApplication, count:" + count);
		if (count == 1)	 {
			return true;
		}
		return false;
	}

	@Override
	public boolean deletePassenger(String m_id, String driver_seq) {
		Map<String, String> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("driver_seq", driver_seq);
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
		int count = sqlSession.selectOne(NAMESPACE + "getTotalDriverCount", m_company);
		return count;
	}

	@Override
	public int getCountByApplyDate(String str_date) {
		return sqlSession.selectOne(NAMESPACE+"getCountByApplyDate",str_date);
	}


}