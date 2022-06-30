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
		BlackListVo blackListVo = new BlackListVo("user053@email.com", "hong@naver.com", "마스크 착용을 안하고 계속 대화를 함");
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
	
	@Test
	public void updateBlackPoint() {
		BlackListVo blackListVo = new BlackListVo();
		blackListVo.setBlack_score(3);
		blackListVo.setBlacklist_seq(5);
		notifyDao.updateBlackPoint(blackListVo);
	}
	// test ok,
	
	@Test
	public void insertBlockPeople() {
		String m_id = "user09@gmail.com";
		boolean result = notifyDao.insertBlockPeople(m_id);
		System.out.println("result : " + result);
	}
	// test ok,
	
	@Test
	public void Blockscore1() {
		String m_id = "hong@naver.com";
		int count = notifyDao.Blockscore1(m_id);
		System.out.println("count : " + count);
	}
	// test ok,
	
	@Test
	public void ListBlockPeople() {
		List<String> m_ids = notifyDao.ListBlockPeople();
//		for (String m_id : m_ids) {
//			System.out.println("m_id : " + m_id);
//		}
		for (int i = 0; i < m_ids.size(); i++) {
			System.out.println("m_id : " + m_ids.get(0));
		}
	}
	// test ok,
	
	@Test
	public void Blockscore2() {
		String m_id = "hong@naver.com";
		int count = notifyDao.Blockscore2(m_id);
		System.out.println("count : " + count);
	}
	// test ok,
	
	@Test
	public void Blockscore3() {
		String m_id = "hong@naver.com";
		int count = notifyDao.Blockscore3(m_id);
		System.out.println("count : " + count);
	}
	// test ok,
	@Test
	
	public void Blockscore4() {
		String m_id = "hong@naver.com";
		int count = notifyDao.Blockscore4(m_id);
		System.out.println("count : " + count);
	}
	// test ok,
	
	@Test
	public void Blockscore5() {
		String m_id = "hong@naver.com";
		int count = notifyDao.Blockscore5(m_id);
		System.out.println("count : " + count);
	}
	// test ok,
	
	@Test
	public void isBlockPeople() {
		String m_id = "hong@naver.com";
		boolean result = notifyDao.isBlockPeople(m_id);
		System.out.println("result : " + result);
	}
	// test ok,
	
	
}


