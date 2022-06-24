package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.NotifyDao;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.PagingDto;

@Service
public class NotifyServiceImpl implements NotifyService{
	@Autowired
	NotifyDao notifyDao;
	@Autowired
	MemberDao memberDao;
	
	@Override
	public boolean insertNotification(BlackListVo blackListVo) {
		boolean result = notifyDao.insertNotification(blackListVo);
		return result;
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
	public List<BlackListVo> nNotifyList(PagingDto pagingDto) {
		List<BlackListVo> nNotifyList = notifyDao.nNotifyList(pagingDto);
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
		if (blackListVo.getBlack_m_id() != null && blackListVo.getBlack_score() != 0) {
			memberDao.adminupdateBlackScore(blackListVo);
			notifyDao.updateBlackPoint(blackListVo);
		}
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

	@Override
	public List<BlackListVo> getReportList(String m_id) {
		List<BlackListVo> reportList = notifyDao.getReportList(m_id);
		return reportList;
	}

	@Override
	public List<BlackListVo> getReportedList(String m_id) {
		List<BlackListVo> reportedList = notifyDao.getReportedList(m_id);
		return reportedList;
	}

	@Override
	public boolean insertBlockPeople(String m_id) {
		boolean result = notifyDao.insertBlockPeople(m_id);
		return result;
	}

	@Override
	public boolean isBlockPeople(String m_id) {
		boolean result = notifyDao.isBlockPeople(m_id);
		return result;
	}

}

