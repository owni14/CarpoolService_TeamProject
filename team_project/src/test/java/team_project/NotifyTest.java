package team_project;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.NotifyDao;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class NotifyTest {
	
	@Autowired
	NotifyDao notifyDao;
	
	@Test
	public void insertNotification() {
		BlackListVo blackListVo = new BlackListVo("user04@gmail.com", "user09@gmail.com", "차 운전을 난 폭하게 함");
		notifyDao.insertNotification(blackListVo);
	}
	// test ok, 
	
	@Test
	public void notifyList() {
		List<BlackListVo> list = notifyDao.notifyList();
		System.out.println("NotifyTest List : " + list);
	}
	// test ok, 
	
	@Test
	public void notifyCount() {
		int count = notifyDao.notifyCount();
		System.out.println("NotifyTest count : " + count);
	}
	// test ok, 
	
	@Test
	public void totalNotifyCount() {
		int totalCount = notifyDao.totalNotifyCount();
		System.out.println("NotifyTest totalCount : " + totalCount);
	}
	// test ok, 
	
	@Test
	public void dayNotifyList() {
		List<BlackListVo> dayNotifyList = notifyDao.dayNotifyList();
		System.out.println("NotifyTest dayNotifyList : " + dayNotifyList);
	}
	// test ok, 
	
	@Test
	public void dayNotifyCount() {
		int dayNotifyCount = notifyDao.dayNotifyCount();
		System.out.println("NotifyTest dayNotifyCount : " + dayNotifyCount);
	}
	// test ok, 
	
	@Test
	public void cNotifyCount() {
		int cNotifyCount = notifyDao.cNotifyCount();
		System.out.println("NotifyTest cNotifyCount : " + cNotifyCount);
	}
	// test ok, 
	
	@Test
	public void modifyApprovement() {
		BlackListVo blackListVo = new BlackListVo();
		blackListVo.setBlacklist_seq(1);
		notifyDao.modifyApprovement(blackListVo);
	}
	// test ok, 
	@Test
	public void cNotifyList() {
		List<BlackListVo> list = notifyDao.cNotifyList();
		System.out.println("list : " + list );
	}
	// test ok,
	
	@Test
	public void nNotifyList() {
		PagingDto pagingDto = new PagingDto();
		pagingDto.setSearchType("ni");
		pagingDto.setKeyword("user04");
		List<BlackListVo> list = notifyDao.nNotifyList(pagingDto);
		System.out.println("list : " + list );
	}
	// test ok,
	
	
}


