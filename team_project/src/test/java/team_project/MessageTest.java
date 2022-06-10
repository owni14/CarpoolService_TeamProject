package team_project;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.MessageDao;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.MessageVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MessageTest {
	
	@Autowired
	MessageDao messageDao;
	
	@Test
	public void insertMessage() {
		MessageVo messageVo = new MessageVo();
		messageVo.setReceiver_m_id("hong@naver.com");
		messageVo.setSender_admin_code("1001");
		messageVo.setContent("신고 접수가 완료되어 벌점 3점이 추가 되었습니다.");
		messageDao.insertMessage(messageVo);
	}
	// test ok
	
	
}

