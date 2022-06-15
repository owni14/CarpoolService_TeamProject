package com.kh.team.dao;



import java.util.List;

import com.kh.team.vo.AdminVo;


public interface AdminDao {
	public boolean checkAdminId(AdminVo adminVo); // 관리자 아이디 확인
	public List<String> getAllAdminCode(); //관리자 코드 
}
