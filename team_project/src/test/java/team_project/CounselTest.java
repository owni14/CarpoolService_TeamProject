package team_project;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.ComplainDao;
import com.kh.team.vo.ComplainVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class CounselTest {
	
	@Autowired
	private ComplainDao complainDao;
	
	@Test
	public void insertComplainTest() {
		for (int i = 1; i < 10; i++) {
			ComplainVo complainVo = new ComplainVo("1001", "hong@naver.com", "포인트 좀 많이줘라 왜 이렇게 조금 줌??? 불편하네 ㅎㅎ" + i, "불편");
//			System.out.println("complainVo: " + complainVo);
			complainDao.insertComplain(complainVo);
			
		}
		
	}
	
}
