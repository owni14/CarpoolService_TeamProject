package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.FaqDao;
import com.kh.team.vo.FaqVo;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDao faqDao;

	@Override
	public List<FaqVo> getFaqList() {
		List<FaqVo> faqList = faqDao.getFaqList();
		return faqList;
	}
}
