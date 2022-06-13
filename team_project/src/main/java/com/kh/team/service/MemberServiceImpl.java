package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MemberDao;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

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
	public List<Map<String, Object>> getDriverList(String m_company) {
		List<Map<String, Object>> driverList = memberDao.getDriverList(m_company);
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
	public void addPassengerInfo(String m_id, String boardLoct, String boardTime, String driver_seq) {
		memberDao.insertPassenger(m_id, boardLoct, boardTime, driver_seq);
	}

	@Override
	public String getMemberLocation(String m_id) {
		String memberLocation = memberDao.getMemberLocation(m_id);
		return memberLocation;
	}

}
