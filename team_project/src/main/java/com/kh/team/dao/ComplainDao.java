package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ComplainVo;

public interface ComplainDao {
	public boolean insertComplain();
	public List<ComplainVo> getComplainListById(String m_id);
}
