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
		messageDao.insertNoBlackMessage(messageVo);
	}
	// test ok
	
	// MainPage message insert 하기 Start
	
	// (관리자 -> 나)
	@Test
	public void insertMessage2() {
		for (int i = 1; i < 20; i++) {
			MessageVo messageVo = new MessageVo();
			messageVo.setReceiver_m_id("hong@naver.com");
			messageVo.setSender_admin_code("1001");
			messageVo.setContent("신고 접수가 완료되어 벌점 " + i + "점이 추가 되었습니다.");
			System.out.println("messageVo : " + messageVo);
			messageDao.insertNoBlackMessage(messageVo);
		}
	}
	
	// (유저 -> 나)
	@Test
	public void insertMessage3() {
		for (int i = 1; i < 20; i++) {
			MessageVo messageVo = new MessageVo();
			messageVo.setReceiver_m_id("hong@naver.com");
			messageVo.setSender_m_id("user0" + i + "@gmail.com");
			messageVo.setContent("빨리 프로젝트 끝내자... 메세지 언제까지 만들고 있을래 ㅠㅠ");
			
			messageDao.insertNoBlackMessage(messageVo);
		}
	}
	
	// (나 -> 유저)
	@Test
	public void insertMessage4() {
		for (int i = 1; i < 20; i++) {
			MessageVo messageVo = new MessageVo();
			messageVo.setSender_m_id("hong@naver.com");
			messageVo.setReceiver_m_id("user0" + i + "@gmail.com");
			messageVo.setContent("빨리 프로젝트 끝내자... 메세지 언제까지 만들고 있을래 ㅠㅠ");
			messageDao.insertNoBlackMessage(messageVo);
		}
	}
	
	// MainPage message insert 하기 End
	
	@Test
	public void adminGetMessageList() {
		String receiver_admin_code = "1004";
		List<MessageVo> list = messageDao.adminGetMessageList(receiver_admin_code);
		System.out.println("list : " + list);
	}
	
	@Test
	public void adminSendMessageList() {
		String sender_admin_code = "1004";
		List<MessageVo> list = messageDao.adminSendMessageList(sender_admin_code);
		System.out.println("list : " + list);
	}
	
	@Test
	public void adminToMeMessageList() {
		String sender_admin_code = "1004";
		List<MessageVo> list = messageDao.adminToMeMessageList(sender_admin_code);
		System.out.println("list : " + list);
	}
	
	
	
}

