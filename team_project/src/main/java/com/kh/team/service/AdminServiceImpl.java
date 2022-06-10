package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.AdminDao;
import com.kh.team.dao.MemberDao;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public boolean checkAdminId(AdminVo adminVo) {
		boolean result = adminDao.checkAdminId(adminVo);
		return result;
	}

	


}
