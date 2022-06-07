package team_project;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.EventDao;
import com.kh.team.vo.EventVo;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class EventTest {
	@Autowired
	EventDao eventDao;
	
	@Test
	public void eventInsertTest() {
		EventVo eventVo=new EventVo(0, "test2", null, null, "이벤트내용2", "Y", null, 60, 95);	
		boolean result=eventDao.insertEvent(eventVo);
		System.out.println("EventTest eventInsertTest result "+result);
		//test ok
	}

	@Test
	public void eventGetList() {
		List<EventVo> list=eventDao.getEventList();
		System.out.println("EventTest eventGetList list "+list);
	}
	@Test
	public void eventUpdate() {
	}
}
