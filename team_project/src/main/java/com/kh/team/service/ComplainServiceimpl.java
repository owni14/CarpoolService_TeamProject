package com.kh.team.service;

import java.util.List;

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
	public List<ComplainVo> getFinishListById(String m_id) {
		List<ComplainVo> complainList = complainDao.getFinishListById(m_id);
		return complainList;
	}
	
	@Override
	public List<ComplainVo> getNotFinishListById(String m_id) {
		List<ComplainVo> complainList = complainDao.getFinishListById(m_id);
		return complainList;
	}

}