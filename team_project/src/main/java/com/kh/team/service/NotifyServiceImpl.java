package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.NotifyDao;
import com.kh.team.vo.BlackListVo;

@Service
public class NotifyServiceImpl implements NotifyService{
	@Autowired
	NotifyDao notifyDao;
	@Autowired
	MemberDao memberDao;
	
	@Override
	public void insertNotification(BlackListVo blackListVo) {
		notifyDao.insertNotification(blackListVo);
		
	}

	@Override
	public List<BlackListVo> notifyList() {
		List<BlackListVo> notifyList = notifyDao.notifyList();
		return notifyList;
	}

	@Override
	public int notifyCount() {
		int nNotifyCount = notifyDao.notifyCount();
		return nNotifyCount;
	}

	@Override
	public int totalNotifyCount() {
		int totalNotifyCount = notifyDao.totalNotifyCount();
		return totalNotifyCount;
	}

	@Override
	public List<BlackListVo> yNotifyList() {
		List<BlackListVo> yNotifyList = notifyDao.yNotifyList();
		return yNotifyList;
	}

	@Override
	public List<BlackListVo> nNotifyList() {
		List<BlackListVo> nNotifyList = notifyDao.nNotifyList();
		return nNotifyList;
	}

	@Override
	public List<BlackListVo> dayNotifyList() {
		List<BlackListVo> dayNotifyList = notifyDao.dayNotifyList();
		return dayNotifyList;
	}

	@Override
	public int dayNotifyCount() {
		int dayNotifyCount = notifyDao.dayNotifyCount();
		return dayNotifyCount;
	}

	@Transactional
	@Override
	public void modifyApprovement(BlackListVo blackListVo) {
		memberDao.adminupdateBlackScore(blackListVo);
		notifyDao.modifyApprovement(blackListVo);
		
	}

	@Override
	public List<BlackListVo> cNotifyList() {
		List<BlackListVo> cNotifyList = notifyDao.cNotifyList();
		return cNotifyList;
	}

	@Override
	public int cNotifyCount() {
		int cNotifyCount = notifyDao.cNotifyCount();
		return cNotifyCount;
	}

}

