package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.NotifyDao;
import com.kh.team.vo.BlackListVo;

@Service
public class NotifyServiceImpl implements NotifyService{
	@Autowired
	NotifyDao notifyDao;
	
	@Override
	public void insertNotification(BlackListVo blackListVo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BlackListVo> notifyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int notifyCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int totalNotifyCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
