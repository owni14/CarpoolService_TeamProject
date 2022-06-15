package com.kh.team.dao;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.AdminVo;
import com.kh.team.vo.ComplainVo;
import com.kh.team.vo.PagingDto;

public interface ComplainDao {
	public boolean insertComplain(ComplainVo complainVo);
	public List<Map<String, Object>> getFinishListById(String m_id);
	public List<ComplainVo> getNotFinishListById(String m_id);
	public List<ComplainVo> getAllNotFinishList(String admin_code,PagingDto pagingDto);
	public int getNotFinishCount(String admin_code);
	public boolean updateComplain(ComplainVo complainVo);
	public List<ComplainVo> getAllFinishList(PagingDto pagingDto,AdminVo adminVo,ComplainVo complainVo);//
	public List<ComplainVo> getAllNotFinishListNoCode(PagingDto pagingDto);
	public int getNotFinishCountNoCode();
	public List<ComplainVo> getAllFinishListByCode(String admin_code,PagingDto pagingDto);
}
