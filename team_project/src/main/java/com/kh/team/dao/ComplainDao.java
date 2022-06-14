package com.kh.team.dao;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.ComplainVo;

public interface ComplainDao {
	public boolean insertComplain(ComplainVo complainVo);
	public List<Map<String, Object>> getFinishListById(String m_id);
	public List<ComplainVo> getNotFinishListById(String m_id);
	public List<ComplainVo> getAllNotFinishList();
	public int getNotFinishCount();
	public boolean updateComplain(ComplainVo complainVo);
}
