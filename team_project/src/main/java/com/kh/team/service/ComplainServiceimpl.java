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
	public boolean insertComplain() {
		boolean result = complainDao.insertComplain();
		return result;
	}

	@Override
	public List<ComplainVo> getComplainList(String m_id) {
		List<ComplainVo> complainList = complainDao.getComplainListById(m_id);
		return complainList;
	}

}
