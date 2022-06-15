package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.ComplainDao;
import com.kh.team.vo.ComplainVo;

@Service
public class ComplainServiceimpl implements ComplainService {
	
	@Autowired
	private ComplainDao complainDao;

	@Override
	public boolean insertComplain(ComplainVo complainVo) {
		boolean result = complainDao.insertComplain(complainVo);
		return result;
	}

	@Override
	public List<Map<String, Object>> getFinishListById(String m_id) {
		List<Map<String, Object>> complainList = complainDao.getFinishListById(m_id);
		return complainList;
	}
	
	@Override
	public List<ComplainVo> getNotFinishListById(String m_id) {
		List<ComplainVo> complainList = complainDao.getNotFinishListById(m_id);
		return complainList;
	}

	@Override
	public List<ComplainVo> getAllNotFinishList(String admin_code) {
		return complainDao.getAllNotFinishList(admin_code);
	}
	@Override
	public int getNotFinishCount(String admin_code) {
		return complainDao.getNotFinishCount(admin_code);
	}

	@Override
	public boolean updateComplain(ComplainVo complainVo) {
		return complainDao.updateComplain(complainVo);
	}
	@Override
	public List<ComplainVo> getAllFinishList() {
		return complainDao.getAllFinishList();
	}

	@Override
	public List<ComplainVo> getAllNotFinishListNoCode() {
		return complainDao.getAllNotFinishListNoCode();
	}

	@Override
	public int getNotFinishCountNoCode() {
		// TODO Auto-generated method stub
		return complainDao.getNotFinishCountNoCode();
	}

}
