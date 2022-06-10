package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.FaqVo;

@Repository
public class FaqDaoImpl implements FaqDao {
	private final String NAMESPACE = "com.kh.team.mappers.faq.";
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<FaqVo> getFaqList() {
		List<FaqVo> faqList = sqlsession.selectList(NAMESPACE + "getFaqList");
		return faqList;
	}

}

