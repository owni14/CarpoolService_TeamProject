package team_project;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.EventDao;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.PagingDto;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class EventTest {
	@Autowired
	EventDao eventDao;
	
	@Test
	public void eventInsertTest() {
		EventVo eventVo=new EventVo(0, "test2", null, null, "테스트2", "Y", null, 60, 95);	
		boolean result=eventDao.insertEvent(eventVo);
		System.out.println("EventTest eventInsertTest result "+result);
		//test ok
	}

	@Test
	public void eventGetList() {
		List<EventVo> list=eventDao.getEventList();
		System.out.println("EventTest eventGetList list "+list);
		//성공
	}
	@Test
	public void eventUpdate() {
		EventVo eventVo=new EventVo(2, "test4-수정", null, null, "테스트3수정", "N", null, 60, 95);
		boolean result=eventDao.updateEvent(eventVo);
		System.out.println("EventTest eventUpdate result "+result);
		//성공 12
	}
	@Test
	public void testIsEndEvent() {
		System.out.println("EventTest testIsEvent result "+eventDao.isEndEventList("Y"));
		
	}
	
	@Test
	public void testEventBySeq() {
		System.out.println("EventTest testEventBySeq result "+eventDao.getEventByEseq(49));
		
	}
	@Test
	public void testEventGetContent() {
		System.out.println("EventTest testEventGetContent result "+eventDao.getContent(49));
		
	}
	@Test
	public void testEventParticipaton() {
		eventDao.createTableEvnet(49);
		//testOk
	}
	@Test
	public void testSeqParticipaton() {
		eventDao.createSeqParticipation(49);
		//testOk
	}
	
	@Test
	public void testinsertParticipaton() {
		int event_seq=52;
		for(int i=1; i<=40; i++) {
			String m_id="user0"+i+"@gmail.com";	
			
			eventDao.insertParticipation(m_id, event_seq);
		}
//		System.out.println(eventDao.insertParticipation(m_id, event_seq));
		//testOk
	}
	//당첨으로 바꾸기
	@Test
	public void testUpdateParticipaton() {
//		String m_id="user03@gmail.com";
		int event_seq=52;
		for(int i=1; i<=8; i++) {
			String m_id="user0"+i*5+"@gmail.com";	
			eventDao.updateParticipation(m_id, event_seq);
		}
		//testOk
	}
	@Test
	public void testSelectParticipation() {
		//int event_seq=eventDao.getMaxNoFinishEventSeq();
		System.out.println(eventDao.getListParticipationByEventSeq(21));
	}//testOk
	
	@Test
	public void testSelectMaxNoFinishSeq() {
		System.out.println(eventDao.getMaxNoFinishEventSeq());
	}//testOk
	
	@Test
	public void testSelectJoinEvent() {
		int event_seq=eventDao.getMaxNoFinishEventSeq();
		List<Map<String, Object>> eventAllList=eventDao.getJoinEventData(event_seq);
		for(Map<String, Object> eventList:eventAllList) {
			System.out.println(eventList.get("EVENT_NAME"));
		}
	}
	@Test
	public void testEventIsWinnerByM_id() {
		System.out.println(eventDao.updateEventWinnerToParticipation(52, "user021@gmail.com"));
		
	}
	
	@Test
	public void testEventWinnerPoint() {
		System.out.println(eventDao.updateEventWinnerPoint("user021@gmail.com", "1001"));
		
	}
}
