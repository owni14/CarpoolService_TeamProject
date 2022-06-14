package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.MemberUpdateDao;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.MemberUpdateVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Service
public class MemberUpdateServiceImpl implements MemberUpdateService {
	
	@Autowired
	private MemberUpdateDao memberUpdateDao;

	@Override
	public boolean insertMemberUpdate(MemberUpdateVo memberUpdateVo) {
		boolean result = memberUpdateDao.insertMemberUpdate(memberUpdateVo);
		return result;
	}

	@Override
	public List<MemberUpdateVo> memberUpdateList() {
		List<MemberUpdateVo> memberUpdateList = memberUpdateDao.memberUpdateList();
		return memberUpdateList;
	}

	

}
