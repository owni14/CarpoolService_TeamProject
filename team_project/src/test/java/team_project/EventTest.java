package team_project;

import java.util.List;

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
		System.out.println("EventTest testEventBySeq result "+eventDao.getEventByEseq(2));
		
	}

}
