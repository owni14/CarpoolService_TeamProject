package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.ComplainVo;

public interface ComplainService {
	public boolean insertComplain();
	public List<ComplainVo> getComplainList(String m_id);
}
