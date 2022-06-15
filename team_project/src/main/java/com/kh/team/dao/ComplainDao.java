package com.kh.team.dao;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.ComplainVo;

public interface ComplainDao {
	public boolean insertComplain(ComplainVo complainVo);
	public List<Map<String, Object>> getFinishListById(String m_id);
	public List<ComplainVo> getNotFinishListById(String m_id);
	public List<ComplainVo> getAllNotFinishList(String admin_code);
	public int getNotFinishCount(String admin_code);
	public boolean updateComplain(ComplainVo complainVo);
	public List<ComplainVo> getAllFinishList();
	public List<ComplainVo> getAllNotFinishListNoCode();
	public int getNotFinishCountNoCode();
}
