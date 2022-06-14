package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ComplainVo;

public interface ComplainDao {
	public boolean insertComplain(ComplainVo complainVo);
	public List<ComplainVo> getFinishListById(String m_id);
	public List<ComplainVo> getNotFinishListById(String m_id);
	public List<ComplainVo> getAllNotFinishList();
	public int getNotFinishCount();
}
