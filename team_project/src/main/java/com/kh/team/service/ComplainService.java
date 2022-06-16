package com.kh.team.service;

import java.util.List;
import java.util.Map;

import com.kh.team.vo.AdminVo;
import com.kh.team.vo.ComplainVo;
import com.kh.team.vo.PagingDto;

public interface ComplainService {
	public boolean insertComplain(ComplainVo complainVo);
	public List<Map<String, Object>> getFinishListById(String m_id);
	public List<ComplainVo> getNotFinishListById(String m_id);
	public boolean updateComplain(ComplainVo complainVo);
	//문의 리스트 조회
	public List<ComplainVo> getAllNotFinishList(String admin_code,PagingDto pagingDto);
	public List<ComplainVo> getAllNotFinishListNoCode(PagingDto pagingDto);
	public List<ComplainVo> getAllFinishList(PagingDto pagingDto,AdminVo adminVo,ComplainVo complainVo);//
	public int getNotFinishCountNoCode();
	public int getNotFinishCount(String admin_code);
	public List<ComplainVo> getAllFinishListByCode(String admin_code,PagingDto pagingDto,ComplainVo complainVo);// 개별관리자
}
