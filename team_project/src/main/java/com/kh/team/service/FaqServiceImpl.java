package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.FaqDao;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqService faqService;

	@Override
	public List<FaqDao> getFaqList() {
		List<FaqDao> faqList = faqService.getFaqList();
		return faqList;
	}
}
